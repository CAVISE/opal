/***************************************************************/
//
//Copyright (c) 2019 Esteban Egea-Lopez http://ait.upct.es/eegea
//
/**************************************************************/


#pragma once

#include "Opal.h"

//Derived class for multi-transmitter and multi-receiver operation. Supports simultaneous parallel transmission of multiple nodes 
namespace opal {
	class OpalSceneManagerMultiTransmitter : public OpalSceneManager {
		public:
			virtual void initMembers() override;
			OpalSceneManagerMultiTransmitter(float f, bool useExactSpeedOfLight);


			//Register transmitter in Opal. Add to transmitters map
			void registerTransmitter(int txId, optix::float3 origin, optix::float3 polarization, float transmitPower) ;
			//Find transmitter and remove from Opal. Cannot transmit anymore 
			void removeTransmitter(int txId) ;
			//Add transmitter to next parallel transmission
			void addTransmitterToGroup(int txId,float transmitPower, optix::float3 origin,optix::float3 polarization);
			//Add transmitter to next parallel transmission
			void addTransmitterToGroup(int txId,float transmitPower, optix::float3 origin);
			//Clear current transmit group
			void clearGroup();
			//Transmit simultaneously all transmitters in group
			void groupTransmit() ;



		protected:

			virtual void checkInternalBuffers() override;
			void resizeTransmitterBuffer(optix::uint tx);



			std::vector<BaseTransmitter*> activeTransmitters; //Map from internal buffer index to external Id. Used for grouping transmissions (batches)



	};
} //namespace opal
