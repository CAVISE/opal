/***************************************************************/
//
//Copyright (c) 2019 Esteban Egea-Lopez http://girtel.upct.es/~eegea
//
/**************************************************************/

#include "timer.h"
#include "Opal.h"
#include <memory>
using namespace opal;
using namespace optix;
//Tests. Compile as exe
#ifdef _WIN32
//Define wgetopt as a substitute for getopt in Windows

int     opterr = 1,             /* if error message should be printed */
optind = 1,             /* index into parent argv vector */
optopt,                 /* character checked for validity */
optreset;               /* reset getopt */
char* optarg;                /* argument associated with option */

#define BADCH   (int)'?'
#define BADARG  (int)':'
#define EMSG    ""

/*
 * getopt --
 *      Parse argc/argv argument vector.
 */
int wgetopt(int nargc, char* const nargv[], const char* ostr)
{
	static char* place = EMSG;              /* option letter processing */
	const char* oli;                              /* option letter list index */

	if (optreset || !*place) {              /* update scanning pointer */
		optreset = 0;
		if (optind >= nargc || *(place = nargv[optind]) != '-') {
			place = EMSG;
			return (-1);
		}
		if (place[1] && *++place == '-') {      /* found "--" */
			++optind;
			place = EMSG;
			return (-1);
		}
	}                                       /* option letter okay? */
	if ((optopt = (int)*place++) == (int)':' ||
		!(oli = strchr(ostr, optopt))) {
		/*
		* if the user didn't specify '-' as an option,
		* assume it means -1.
		*/
		if (optopt == (int)'-')
			return (-1);
		if (!*place)
			++optind;
		if (opterr && *ostr != ':')
			(void)printf("illegal option -- %c\n", optopt);
		return (BADCH);
	}
	if (*++oli != ':') {                    /* don't need argument */
		optarg = NULL;
		if (!*place)
			++optind;
	}
	else {                                  /* need an argument */
		if (*place)                     /* no white space */
			optarg = place;
		else if (nargc <= ++optind) {   /* no arg */
			place = EMSG;
			if (*ostr == ':')
				return (BADARG);
			if (opterr)
				(void)printf("option requires an argument -- %c\n", optopt);
			return (BADCH);
		}
		else                            /* white space */
			optarg = nargv[optind];
		place = EMSG;
		++optind;
	}
	return (optopt);                        /* dump back option letter */
}

#else 
#include <unistd.h>
#endif

//Include the file with the tests you want to perform
#include "tests/depolarization.h"
#include "tests/tunnels.h"
#include "tests/tests.h"
#include "tests/rdn.h"
#include "tests/curvature.h"
#include "tests/dudley.h"
#include "tests/diffraction.h"
#include "tests/antennaGain.h"
int main(int argc, char** argv)
{
	try {

		//Init log
		//Remove some info from the log
		loguru::g_preamble_date=false;
		loguru::g_preamble_time=false;
		loguru::g_preamble_thread=false;
		loguru::init(argc,argv);
		
		std::cout << "Running Opal with:  " ;
		for(int i = 0; i < argc; ++i) {
 		       std::cout << argv[i] << ' ';
		}
		std::cout<<std::endl;
		//float freq = 900e6f;
		//float freq = 5.9e9f;
		//float freq = 1.0e9f;

		//Defaults	
		uint maxReflections=10u;
		bool printEnabled=false;
		bool subSteps=false;
		bool useExactSpeedOfLight=true;
		bool useDepolarization=false;
		bool usePenetration = false;
		bool useMultiGPU=true;
		bool useFastMath=true;
		float radius=0.04f;

		std::string usage="Usage: opal [-options] \n  -r Max reflections E \n -p Enable OptiX rtPrintf on device to debug \n -s Use decimal degrees in angular spacing \n -c Use c=3e8 m/s. Default is c=299 792 458 m/s\n -d Enable depolarization \n -a Enable penetration \n -g Disable multiGPU \n -m disable fast_math \n -h Show help \n -t string to select a particular test (dependent on the program)";

		int c;
		int nr;
		std::string test;
#ifdef _WIN32
		while ((c = wgetopt (argc, argv, "r:pscdagmu:ht:")) != -1) {
#else 

		while ((c = getopt (argc, argv, "r:pscdagmu:ht:")) != -1) {
#endif
			switch (c) {
				case 'r':
					//std::cout<<optarg<<std::endl;
					nr=atoi(optarg);
					if (nr>=0) {

						maxReflections=nr;
					} else {
						fprintf(stderr, usage.c_str(),
								argv[0]);
						exit(EXIT_FAILURE);
					}
					break;
				case 'u':
					//std::cout<<"-u="<<optarg<<std::endl;
					radius=atof(optarg);
					break;
				case 't':
					//std::cout<<optarg<<std::endl;
					test=optarg;
					break;
				case 'p':
					printEnabled=true;
					break;
				case 's':
					subSteps=true;
					break;
				case 'c':
					useExactSpeedOfLight=false;
					break;
				case 'd':
					useDepolarization=true;
					break;
				case 'a':
					usePenetration=true;
					break;
				case 'g':
					useMultiGPU=false;
					break;
				case 'm':
					useFastMath=false;
					break;
				case 'h':
					std::cout<<usage<<std::endl;
					exit(0);
					break;

				default: /* '?' */
					fprintf(stderr, usage.c_str(),
							argv[0]);
					exit(EXIT_FAILURE);


			}
		}
//#endif
		
		//New way to initialize: first create instance
		//std::unique_ptr<OpalSceneManager> sceneManager(new OpalSceneManager());
	
		OpalSceneManager* sceneManager=new OpalSceneManager();


		//Now set desired common features
		if (!useExactSpeedOfLight) {
			sceneManager->useApproximateSpeedLight();
		}

		if (usePenetration) {	
			sceneManager->enablePenetration();
		}
		
		if (useDepolarization) {	
			sceneManager->enableDepolarization();
		}
		if (!useMultiGPU) {
			sceneManager->disableMultiGPU();	
		}
		if (!useFastMath) {
			sceneManager->disableFastMath();
		}
		sceneManager->setMaxReflections(maxReflections);
		
		//sceneManager->setUsageReport();
		if (printEnabled) {
			sceneManager->setPrintEnabled(1024* 1024 * 1024);	
		}

		//Additional features are set in the particular tests and initContext is called then 
		
		

		
		//Finally, run the test


//Basic tests
		BasicTests basic(sceneManager,radius,useDepolarization);
		//basic.planeTest(0);
		//basic.freeSpace();
		//basic.quadTest(false,false);
		//basic.addCompoundDynamicMeshes();

		basic.loadScenario();

//Curvature tests
		//CurvatureTests ct(sceneManager, radius);
		//ct.cylinderTest();
		//ct.symmetricDivergenceTest();
		
//Tunnel tests
		//CubeTunnelTests ctt(sceneManager,radius,useDepolarization);
		//ctt.cubeTunnelRDNIsotropic(100);
		//ctt.cubeTunnelRDN(100);
		//ctt.cubeTunnel(0);//No random
		//ctt.cubeTunnelSingleReceiver(0);//No random
		//ctt.cubeTunnelWithCurvedSimulation(0,1);

//RDN tests	
		
		//RDNTests rdn(sceneManager,radius,useDepolarization);
		//rdn.runDidascalouDielectricRDN(1);
		//rdn.runDidascalouConductorRDN(1);
		//rdn.runDidascalouDielectric(0);
		//rdn.runDidascalouDielectricMultipleReceivers(0);
		//rdn.runTest(test);
		//rdn.rdnPlaneTestMultiReceiver();
		//rdn.rdnPlaneTest();
		//rdn.freeSpace();
//Dudley tests
		//DudleyTests dud(sceneManager,radius,useDepolarization);
		//dud.runTest(test);		


//Diffraction tests
		//DiffractionTests dif(sceneManager,radius, useDepolarization);
		//dif.semiplaneDiffraction();
		//dif.semiplaneTotal();
		//dif.runSWCorner(false);
		//dif.runSWCorner(true); //With multitransmitter
		//dif.runSWAcuteCorner();
		//dif.runCrossing();
		//dif.addCompoundDynamicMeshes();
//AntennaGain test
		//AntennaGainTests ag(sceneManager, radius);
		//ag.freeSpace(useDepolarization);
		//ag.freeSpaceRDN();

		delete sceneManager;


		return 0;
	}
	catch (optix::Exception& e) {
		std::cout << "main error occurred with error code "
			<< e.getErrorCode() << " and message "
			<< e.getErrorString() << std::endl;

		return 1;
	}
	catch (opal::Exception& e) {
		std::cout << "main error occurred with  message "
			<< e.getErrorString()
			<< std::endl;

		return 2;
	}

}


