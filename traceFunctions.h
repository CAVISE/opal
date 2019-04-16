/***************************************************************/
//
//Copyright (c) 2019 Esteban Egea-Lopez http://ait.upct.es/eegea
//
/**************************************************************/


#include "Common.h"
#include <optix_world.h>
using namespace optix;
rtDeclareVariable(rtObject, root, , );
rtDeclareVariable(float, min_t_epsilon, , );
rtDeclareVariable(unsigned int, max_interactions, , );

__forceinline__ __device__ void traceInternalRay(EMWavePayload& rayPayload, float3 ro, float3 rd) {
			//Hit a receiver. Trace internal ray	
			EMWavePayload internalRayPayload = rayPayload;
			internalRayPayload.geomNormal = optix::make_float3(0, 0, 0);
			internalRayPayload.nextDirection = optix::make_float3(0, 0, 0);
			internalRayPayload.end = false;

			float3 internal_ray_direction = rd;
			float3 internal_origin=ro;
			while (true) {
				optix::Ray internalRay(internal_origin, internal_ray_direction, 1u, min_t_epsilon, RT_DEFAULT_MAX); //Internal ray type =1
				//rtPrintf("IR\taccAtt=%f\tr=\%u\tray=(%f,%f,%f)\n",internalRayPayload.accumulatedAttenuation,internalRayPayload.reflections, internal_ray_direction.x,internal_ray_direction.y,internal_ray_direction.z);
				
				rtTrace(root, internalRay, internalRayPayload);
				//Miss or too much attenuation
				if (internalRayPayload.end) {
					break;
				}
				//Max number of reflections
				if (internalRayPayload.reflections > max_interactions) {
					break;
				}

				//Reflection or going through receiver
				// Update ray data for the next path segment
				internal_ray_direction = internalRayPayload.nextDirection;
				internal_origin = internalRayPayload.hitPoint;
			}


}


__forceinline__ __device__ void traceReflection(EMWavePayload& rayPayload, float3 ro, float3 rd) 
{
	float3 origin=ro;
	float3 ray_direction=rd;
	// Each iteration is a segment (due to reflections) of the ray path.  The closest hit will
	// return new segments to be traced here. Additionally, the closest hit at receiver will generate another ray to continue the propagation through the recption sphere
	while (true) {
		optix::Ray myRay(origin, ray_direction, 0u, min_t_epsilon, RT_DEFAULT_MAX);
		
		if (rayPayload.rxBufferIndex>=0) {
			traceInternalRay(rayPayload,rayPayload.hitPoint,rayPayload.nextDirection);	
		}

		rtTrace(root, myRay, rayPayload);



		//Miss or too much attenuation
		if (rayPayload.end) {
			break;
		}
		//Max number of reflections
		if (rayPayload.reflections > max_interactions) {
			break;
		}

		//Reflection or going through receiver
		// Update ray data for the next path segment
		ray_direction = rayPayload.nextDirection;
		origin = rayPayload.hitPoint;
		rayPayload.rxBufferIndex=-1;	


		//Reflection info log (to be used in external programs)
		//launchIndex is not available in this scope, pass it to the function to be used in the log
		//rtPrintf("R\t%u\t%u\t%d\t%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\n", launchIndex.x, launchIndex.y,  rayPayload.reflections, rayPayload.hits, ray_direction.x, ray_direction.y, ray_direction.z, rayPayload.hitPoint.x, rayPayload.hitPoint.y, rayPayload.hitPoint.z, rayPayload.totalDistance);
	}

}



