/***************************************************************/
//
//Copyright (c) 2019 Esteban Egea-Lopez http://girtel.upct.es/~eegea
//
/**************************************************************/


#ifndef RESULTS_H
#define RESULTS_H
#include "Opal.h"
#include <vector>
#include <iostream>
#include <tuple>
#include <algorithm>
namespace opal {
	class ResultRecord  {
		public:
			bool isField;
			unsigned int index;
			int rxId;
			int txId;
			optix::float3 position;
			float radius;
			optix::float3 origin;
			float eA;
			float txPower;
			int raysHit;
			optix::float2 E;
			optix::float2 Ex;
			optix::float2 Ey;
			optix::float2 Ez;
	
			float power;
			float d;
		 	void setPower(optix::float2 E,unsigned int index, int rxId, int txId, optix::float3 positio, float radius, optix::float3 origin, float eA, float txPower, int raysHits );	
		 	void setField(optix::float2 Ex, optix::float2 Ey, optix::float2 Ez, unsigned int index, int rxId, int txId, optix::float3 positio, float radius, optix::float3 origin, float eA, float txPower, int raysHits );	
			//Default sort, first by txId and then by rxId
			inline  bool operator<(const ResultRecord &h) const {
				if (txId==h.txId) {
					return (rxId<h.rxId);
				} else {
					return (txId<h.txId);
				}	
			};
			std::string toString() const ;
			
			//friend std::ostream& operator<<(std::ostream& os, const ResultRecord& r) ;
		
	};
	struct byRx {
			bool operator()(ResultRecord a, ResultRecord b) const { 
			return std::tie(a.rxId,a.txId) < std::tie(b.rxId,b.txId) ; }
	} ;
	struct byZRx {
			bool operator()(ResultRecord a, ResultRecord b) const { 
			return std::tie(a.position.z,a.rxId,a.txId) < std::tie(b.position.z,b.rxId,b.txId) ; }
	} ;
	struct byRxZ {
			bool operator()(ResultRecord a, ResultRecord b) const { 
			return std::tie(a.rxId,a.position.z,a.txId) < std::tie(b.rxId,b.position.z,b.txId) ; }
	} ;
	class ResultReport {
		//This may be done as templates
		public:
			std::vector<ResultRecord> results;
			ResultReport() ;
			void insert(ResultRecord r);
			void clear() {results.clear();} ;
			unsigned int size() const { return results.size();};
			std::vector<ResultRecord>& getVector() { return results;};	
			std::string toString() const ;
 			void toCSV(std::string file);
			void sort();
			void sortByRx();
			void merge(ResultReport& other);
			template <typename T> 
			void sortBy(T t) { 
				std::sort(results.begin(), results.end(),  t);
			};
	};
}
#endif

