/***************************************************************/
//
//Copyright (c) 2019 Esteban Egea-Lopez http://ait.upct.es/eegea
//
/**************************************************************/


#include "Common.h"
#include "Complex.h"
#include <optix_world.h>
#include <optixu/optixu_math_namespace.h>
#include <optixu/optixu_aabb_namespace.h>
using namespace optix;



//Receiver global buffers
rtBuffer<HitInfo, 1> globalHitInfoBuffer; //Buffer to store all the hits
rtBuffer<uint, 1> atomicIndex; //Buffer to store the current global buffer index 
rtDeclareVariable(uint, global_info_buffer_maxsize, ,);

//Transmitter buffer
rtBuffer<Transmitter, 1> txBuffer;


//Receiver local variables
rtDeclareVariable(uint, receiverBufferIndex, , ); //Buffer id
rtDeclareVariable(int, externalId, , ); //External id  used to identify receivers 
rtDeclareVariable(SphereHit, hit_attr, attribute hit_attr, );
rtDeclareVariable(float, k, , );
rtDeclareVariable(float4, sphere, , );

//Launch variables
rtDeclareVariable(uint3, receiverLaunchIndex, rtLaunchIndex, );
rtDeclareVariable(HVWavePayload, hitPayload, rtPayload, );
rtDeclareVariable(optix::Ray, ray_receiver, rtCurrentRay, );

//Global variables
rtDeclareVariable(float, asRadiusConstant, ,);

//Penetration configuration
rtDeclareVariable(uint, usePenetration, , );



//Closest hit program for receivers
RT_PROGRAM void closestHitReceiver()
{

	//TODO: We do not check polarization between tx and rx. Can be done comparing payload polarization and receiver polarization

	//Do not end the ray, it can pass through the reception sphere and reflect on a wall, inside or outside the receiver sphere

	//Update ray data
	const float rayLength = hit_attr.geom_normal_t.w;
	hitPayload.hitPoint = ray_receiver.origin + rayLength*ray_receiver.direction;
	const float aux= hitPayload.ndtd.w; //Previous total distance
	hitPayload.ndtd = make_float4(ray_receiver.direction); //Next direction only
	hitPayload.ndtd.w = aux+ rayLength; //totalDistance 

	const uint txBufferIndex=receiverLaunchIndex.z;
	const Transmitter current_tx=txBuffer[txBufferIndex];

	//Check if ray is hitting his own tx (transmitter are also receivers usually) A transmitter cannot receive while it is transmitting, unless other channel is used.
	if (externalId == current_tx.externalId) {
		//My own outgoing ray
		//rtPrintf("External. txId=%d i.el=%u i.az=%u, ray=(%f,%f,%f) origin=(%f,%f,%f) t=%f rId[%u]=%d\n", txBuffer.externalId, receiverLaunchIndex.x, receiverLaunchIndex.y, ray_receiver.direction.x, ray_receiver.direction.y, ray_receiver.direction.z, ray_receiver.origin.x, ray_receiver.origin.y, ray_receiver.origin.z, hit_attr.t, receiverBufferIndex,externalId);
		return;
	}


	int reflections = hitPayload.reflections;
	float3 prx = make_float3(sphere.x, sphere.y, sphere.z);

	//HitInfo values
	float d;
	uint hash=0u;
	uint dtrx=0u;
	if (reflections == 0 && hitPayload.hits==0) {
		//This is a purely direct ray
		//Compute electric field. For direct rays, the distance is always between tx and rx
		float3 ptx = current_tx.origin;
		d = length(prx - ptx);
	} else {
		//Reflected or transmitted ray


		//Distance from ray line to receiver position. To keep only the closest hit later
		//Line is defined by ray
		float3 pd = prx - hitPayload.hitPoint;
		float u = dot(pd, ray_receiver.direction);
		float3 p3 = hitPayload.hitPoint + u*ray_receiver.direction;


		float3 rxtoh=prx-p3;
		float drxtohitsq=dot(rxtoh,rxtoh);
		//float drxtohit=length(prx - p3);

		//Unfolded path distance		
		const float3 lastReflectionHitPoint = make_float3(hitPayload.lrhpd.x,hitPayload.lrhpd.y,hitPayload.lrhpd.z);
		d=length(prx-lastReflectionHitPoint);

		d+=hitPayload.lrhpd.w; //totalDistanceTillLastReflection

		//Take into account radius and angular separation: ignore hit if distance from hit to receiver is > unfolded path distance * angular separation

		float vrsq=d*d*asRadiusConstant*asRadiusConstant/3; //sqr(d*as/sqrt(3));
		if (drxtohitsq>vrsq) {
			return;
		}
		float dm = drxtohitsq*1000000.0f;  //Multiply by 1000 000 to truncate later take 6 digits
		int dmt = __float2int_rz(dm);   //Truncate
		//HitInfo values
		dtrx=static_cast<uint>(dmt);
		hash=hitPayload.refhash;
	}



	//Compute electric field	
	float2 z = make_float2(0.0f, -k*d);
	float2 zexp = complex_exp_only_imaginary(z);
	float2 Rzexp = complex_prod(hitPayload.prodReflectionCoefficient, zexp);


	float2 E = sca_complex_prod((hitPayload.electricFieldAmplitude / d), Rzexp);
//	if (reflections==0) {
//	//Log hit
//		rtPrintf("HE\t%u\t%u\t%u\t%6e\t%6e\t%6e\t%6e\t%6e\t%6e\t%6e \n", receiverLaunchIndex.x, receiverLaunchIndex.y, hitPayload.reflections, k,  E.x, E.y,d,Rzexp.x,Rzexp.y,-k*d);
//	}
	float attE=0.0f;
	if (usePenetration==1u) {
		//Switch to linear
		attE=hitPayload.accumulatedAttenuation*0.05f;
		//Check to avoid float overflows
		if (attE>-15.f) {
			attE=exp10f(attE);
			//rtPrintf("Eatt=(%.10e,%.10e) attExp=%f hits=%u\n",E.x,E.y,attE,hitPayload.hits );
		} else {
			attE=1.e-15f; //Set this value directly to avoid overflows, it is neglectable anyway

		}
		E=sca_complex_prod(attE,E);

	}
	HitInfo aHit;
	aHit.thrd=make_uint4(txBufferIndex,hash,receiverBufferIndex,dtrx);
	aHit.E=E;
	//Debug
	//const float3 lastReflectionHitPoint = make_float3(hitPayload.lrhpd.x,hitPayload.lrhpd.y,hitPayload.lrhpd.z);
	//aHit.lh=lastReflectionHitPoint;
	//aHit.r=reflections;
	//aHit.in=receiverLaunchIndex;
	//Check if global buffer is full
	uint hitIndex=atomicAdd(&atomicIndex[0u],1u);
	if (hitIndex>=global_info_buffer_maxsize) {
		rtThrow(GLOBALHITBUFFEROVERFLOW);
		//if exceptions are disabled, let it crash...?
		hitIndex=global_info_buffer_maxsize-1;
	}
	//Store hit in global buffer
	globalHitInfoBuffer[hitIndex]=aHit;
	//Log hit
	rtPrintf("H\t%u\t%u\t%u\t%u\t%f\t%f\t%f\t%f\t%u\t%u\t%u\t%d\n", receiverLaunchIndex.x, receiverLaunchIndex.y,receiverBufferIndex, hitPayload.reflections, attE,  E.x, E.y,d, aHit.thrd.x,aHit.thrd.y,aHit.thrd.w,externalId);
}








rtDeclareVariable(HVWavePayload, missPayload, rtPayload, );
//Miss program. End ray
RT_PROGRAM void miss()
{
	//rtPrintf("miss i.x=%u. iy=%u \n", receiverLaunchIndex.x, receiverLaunchIndex.y);
	missPayload.flags = FLAG_END;
}

