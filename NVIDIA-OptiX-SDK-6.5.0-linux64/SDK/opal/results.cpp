/***************************************************************/
//
//Copyright (c) 2022 Esteban Egea-Lopez http://girtel.upct.es/~eegea
//
/**************************************************************/
#include "results.h"
#include <iomanip>
#include <sstream>
#include <fstream>
using namespace opal;
using namespace optix;
	void ResultRecord::setPower(optix::float2 E,unsigned int index, int rxId, int txId, optix::float3 position, float radius, optix::float3 origin, float eA, float txPower, int raysHit ) 
	{
//: E(E), index(index), rxId(rxId), txId(txId),position(position),radius(radius),origin(origin), eA(eA), txPower(txPower), isField(false), raysHit(raysHit)
	 this->E=E;
	 this->index=index;
	this->rxId=rxId; 
	this->txId=txId;
	this->position=position;
	this->radius=radius;
	this->origin=origin; 
	this->eA=eA; 
	this->txPower=txPower; 
	this->isField=false; 
	this->raysHit=raysHit;
	this->power = eA*((E.x*E.x) + (E.y*E.y))*txPower;
	this->d=length(origin-position);
			
	}	
        void ResultRecord::setField(optix::float2 Ex,optix::float2 Ey,optix::float2 Ez,unsigned int index, int rxId, int txId, optix::float3 position, float radius, optix::float3 origin, float eA, float txPower, int raysHit ) 
	{
	 this->Ex=Ex;
	 this->Ey=Ey;
	 this->Ez=Ez;
	 this->index=index;
	this->rxId=rxId; 
	this->txId=txId;
	this->position=position;
	this->radius=radius;
	this->origin=origin; 
	this->eA=eA; 
	this->txPower=txPower; 
	this->isField=true; 
	this->raysHit=raysHit;
		this->d=length(origin-position);
	
	}
	std::string ResultRecord::toString() const  {
		std::stringstream os;
		 if (isField) {
			 os<<"TERX\t"<<txId<<"\t"<<rxId<<"\t"<<Ex.x<<"\t"<<Ex.y<<"\t"<<position.x<<"\t"<<position.y<<"\t"<<position.z<<"\t"<<raysHit<<"\t"<<radius<<"\t"<<d<<"\t"<<origin.x<<"\t"<<origin.y<<"\t"<<origin.z<< std::endl;
			 os<<"TPRX\t"<<txId<<"\t"<<rxId<<"\t"<<(10*log10(dot(Ex,Ex)))<<"\t"<<dot(Ex,Ex)<<"\t"<<position.x<<"\t"<<position.y<<"\t"<<position.z<<"\t"<<raysHit<<"\t"<<radius<<"\t"<<d<<"\t"<<origin.x<<"\t"<<origin.y<<"\t"<<origin.z<< std::endl;

			 os<<"TERY\t"<<txId<<"\t"<<rxId<<"\t"<<Ey.x<<"\t"<<Ey.y<<"\t"<<position.x<<"\t"<<position.y<<"\t"<<position.z<<"\t"<<raysHit<<"\t"<<radius<<"\t"<<d<<"\t"<<origin.x<<"\t"<<origin.y<<"\t"<<origin.z<< std::endl;

			 os<<"TPRY\t"<<txId<<"\t"<<rxId<<"\t"<<(10*log10(dot(Ey,Ey)))<<"\t"<<dot(Ey,Ey)<<"\t"<<position.x<<"\t"<<position.y<<"\t"<<position.z<<"\t"<<raysHit<<"\t"<<radius<<"\t"<<d<<"\t"<<origin.x<<"\t"<<origin.y<<"\t"<<origin.z<< std::endl;

			 os<<"TERZ\t"<<txId<<"\t"<<rxId<<"\t"<<Ez.x<<"\t"<<Ez.y<<"\t"<<position.x<<"\t"<<position.y<<"\t"<<position.z<<"\t"<<raysHit<<"\t"<<radius<<"\t"<<d<<"\t"<<origin.x<<"\t"<<origin.y<<"\t"<<origin.z<< std::endl;

			 os<<"TPRZ\t"<<txId<<"\t"<<rxId<<"\t"<<(10*log10(dot(Ez,Ez)))<<"\t"<<dot(Ez,Ez)<<"\t"<<position.x<<"\t"<<position.y<<"\t"<<position.z<<"\t"<<raysHit<<"\t"<<radius<<"\t"<<d<<"\t"<<origin.x<<"\t"<<origin.y<<"\t"<<origin.z<< std::endl;


		 } else {
			 os<<std::setprecision(10)<<"TPR\t"<<txId<<"\t"<<rxId<<"\t"<<power<<"\t"<<position.x<<"\t"<<position.y <<"\t"<<position.z<<"\t"<<raysHit<<"\t"<<radius<<"\t"<<d<<"\t"<<origin.x<<"\t"<<origin.y<<"\t"<<origin.z<<"\t"<<eA << std::endl;
			 os<<std::setprecision(10)<<"TER\t"<<txId<<"\t"<<rxId<<"\t"<<E.x<<"\t"<<E.y<<"\t"<<position.x<<"\t"<<position.y <<"\t"<<position.z<<"\t"<<raysHit<<"\t"<<radius<<"\t"<<d<<"\t"<<origin.x<<"\t"<<origin.y<<"\t"<<origin.z<< std::endl;
		 }
			return os.str();
	}
	std::ostream& operator<<(std::ostream& os, const opal::ResultRecord& r)  {
		os<< r.toString();
		return os;
	}
	
	ResultReport::ResultReport() {
	}
	void ResultReport::insert(ResultRecord r) {
		results.push_back(r);
	}
	std::string ResultReport::toString() const {
		std::stringstream os;
		for (auto r : results) {
			os<<r.toString();
		}
		return os.str();
	}
	void ResultReport::merge(ResultReport& other) {
		auto o=other.getVector();
		results.insert(results.end(),o.begin(), o.end());
	}
	void ResultReport::sort() {
		std::sort(results.begin(), results.end());
	}	
	void ResultReport::sortByRx() {
		byRx s;
		std::sort(results.begin(), results.end(), s );
	}	
	std::ostream& operator<<(std::ostream& os, const opal::ResultReport& rr) {
		os<<rr.toString();
		return os;
	}

void ResultReport::toCSV(std::string file) {
	std::ofstream myfile;
	myfile.open (file);
	if (results[0].isField) {
		myfile<<"txId,rxId,Ex.real,Ex.im,Px,Ey.real,Ey.im,Py,Ez.real,Ez.im,Pz,position.x,position.y,position.z,raysHit,radius,distance,txpos.x,txpos.y,txpos.z"<< std::endl;
		for (auto r : results) {
			 myfile<<r.txId<<","<<r.rxId<<","<<r.Ex.x<<","<<r.Ex.y<<","<<dot(r.Ex,r.Ex)<<","<<r.Ey.x<<","<<r.Ey.y<<","<<dot(r.Ey,r.Ey)<<","<<r.Ez.x<<","<<r.Ez.y<<","<<dot(r.Ez,r.Ez)<<","<<r.position.x<<","<<r.position.y<<","<<r.position.z<<","<<r.raysHit<<","<<r.radius<<","<<r.d<<","<<r.origin.x<<","<<r.origin.y<<","<<r.origin.z<< std::endl;
	
		}
	} else {
		myfile<<"txId,rxId,E.real,E.im,power,position.x,position.y,position.z,raysHit,radius,distance,txpos.x,txpos.y,txpos.z,effectiveArea"<< std::endl;

		for (auto r : results) {
			 myfile<<std::setprecision(10)<<r.txId<<","<<r.rxId<<","<<r.E.x<<","<<r.E.y<<","<<r.power<<","<<r.position.x<<","<<r.position.y <<","<<r.position.z<<","<<r.raysHit<<","<<r.radius<<","<<r.d<<","<<r.origin.x<<","<<r.origin.y<<","<<r.origin.z<<","<<r.eA <<std::endl;
	
		}
	}
	myfile.close();

}

