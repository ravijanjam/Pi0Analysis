/*

Version: December 22, 2010 at 9:55 CST, included v2 for random component

ROOT macro to simulate the decay of pairs of pizero or the eta
The pairs have a correlation distribution in azimuth and pseudo-rapidity which approximates the "ridge" result
An output NTUPLE file is produced which contains the photon coordinates in the CMS EMCal
Lorentz boost from the rest mass of the meson is done using C++ version of the GLOREN and GROTAT Fortran routines of GEANT3

The macro has the following input parameters:

void ridgePizeroDecay(const int nEvents=1, const int mesonChoice=1,
const double lowPt=1.0, const double highPt=3.0,
const double lowEta=-4.0, const double highEta=+4.0,
const bool useFlow=true,
const double v2Factor=0.20,
const double mountainFraction = 0.02,
const double mountainRapdityWidth = 0.15,
const double mountainAzimuthWidth = 0.15,
const double awayFraction = 0.02,
const double awayAzimuthWidth = 0.15,
const double nearSideRidgeFraction = 0.00,
const double nearSideAzimuthWidth = 0.01,
const double etaDependentEfficiencyWidth = 0.5,
const char* fileName="ridgePizeroDecay.root",
const bool printInformation=false)

nEvents = number of decays to generate
mesonChoice = 1 for pizero, = 2 for eta
lowPt and highPt delimit the uniformly distributed transverse momentum range of the parent meson (pizero or eta)
lowEta and highEta delimit the pseudo-rapidity of the parent meson
mountainFraction = fractional number of events in near-side mountain
mountainRapidityWidth = gaussian pseudo-rapidity width of the mountain peak
mountainAzimuthWidth = gaussian azimuthal width (radians) of the mountain peak
awayFraction = fractional number of events in away-side ridge
awayAzimuthWidth = gaussian azimuthal width (radians) of the away-side ridge, assuming uniform pseudo-rapidity distribution
nearFraction = fractional number of events in near-side ridge
nearAzimuthWidth = gaussian azimuthal width (radians) of the near-side ridge, assuming uniform pseudo-rapidity distribution
etaDependentEfficiencyWidth = gaussian width in pseudo-rapidity of the pizero reconstruction efficiency 
fileName is the name of the produced NTUPLE file
printInformation controls whether to print out all the kinematic information (debug development purpose)


NTUPLE definition, with 20 parameters:

TNtuple *decayNtuple = new TNtuple("ridgeDecay", "Meson Decay into 2 Photons with Correlated Pairs",
"iEvent:kPizero,mesonPt:mesonEta:mesonPhi:mesonEnr:"// 4
"photn1Pt:photn1Eta:photn1Phi:photn1Loc:photn1Enr:"// 9
"photn2Pt:photn2Eta:photn2Phi:photn2Loc:phton2Enr:"// 14
"openAngle:dSeparate"); // 16

iEvent is the decay sequence number starting from 1
kPizero is one or two for the pair member sequence
mesonPt is the transverse momentum of the parent meson (GeV/c)
mesonEta is the eta of the meson
mesonPhi is the azimuthal angle of the meson (assumed uniformly distributed 0 to 2Pi, radians)
mesonEnr is the total energy of the meson
photn1Pt is the lab transverse momentum of the first photon (GeV/c)
photn1Eta is the lab eta of the first photon
photn1Phi is the lab azimuthal angle of the first photon (radians)
photn1Loc indicates the EMCal location of the first photon (0 is the barrel, 1 is the endcap, -1 is in the hole of the endcap)
photn1Enr is the energy of the first photon (GeV)
photn2Pt is the lab transverse momentum of the second photon (GeV/c)
photn2Eta is the lab eta of the second photon
photn2Phi is the lab azimuthal angle of the second photon (radians)
photn2Loc indicates the EMCal location of the second photon (0 is the barrel, 1 is the endcap, -1 is in the hole of the endcap)
photn2Enr is the energy of the second photon (GeV)
openAngle is the opening angle (in radians) between the two photons according to their 3-momenta dot product (=-99999 if either photon is projected into the hole of the endcap)
dSeparate is the separation distance (in cm) between the two photons according to their (x,y,z) coordinates in the EMCal (=-99999 if either photon is in hole of the endcap)


Basic EMCal information for CMS  (from Askew presentation, and from R M Brown presentation of August 2007)
EMCal barrel goes from eta = -1.48 to eta = +1.48
The barrel eta limits correspond to 2.694 radians (154.140 deg) to 0.448 radians (25.6 degrees)
EMCal endcap goes from eta = 1.48 to eta = 3.0 (positive end),  -3.0 to -1.48 (negative end)
The endcap eta limits correspond to 3.042 radians (174.061 degrees) and 0.099 radians (5.693 degrees)
Barrel crystals (61,220) are 2 x 2 x 23 cm,  endcap crystals are 3 x 3 x 22 cm (14,648) in 4 "Dees" (3,662 each)
Barrel crystals have ~1 degree azimuthal opening

Moliere radius R = 2.10 cm
Radiation length X0 = 0.89 cm

Design resoluton 0.5% for E > 100 GeV
TDR resolution parameterization: a/sqrt(E) + b/E + c  (sum in quadrature)
a (stochastic)            = 2.7% for the barrel, 5.7% for the endcap
b (electronic, pile-up)   = 155 (210) MeV for the barrel, 770 (915) MeV for the endcap for Low (High) luminosity
c (non-uniformities, ...) = 0.55% for both the barrel and the endcap

Pair resolution for H -> two photons E1 and E2 with an opening angle theta
sigma-M/M = 0.5[sigma-E1/E1 + sigma-E2/E2 + sigma-theta/tan(theta/2)] (sum in quadrature)

*/

#include "TFile.h"
#include "TNtuple.h"
#include "TRandom1.h"
#include "TLorentzVector.h"
#include "TF1.h"

#include <iostream>
#include <cmath>

using namespace std;

void ridgePizeroDecayV2(const int nEvents=1000, const int mesonChoice=1,
			const bool useExponentialPt = true,
		        const double lowPt=1.0, const double highPt=3.0,
    		        const double lowEta=-1.45, const double highEta=+1.45,
                        const bool useFlow=true,
                        const double v2Factor=0.20,
		        const double mountainFraction = 0.00,
		        const double mountainRapidityWidth = 0.15,
		        const double mountainAzimuthWidth = 0.22,
		        const double awayFraction = 0.00,
		        const double awayAzimuthWidth = 0.22,
		        const double nearSideRidgeFraction = 0.00,
		        const double nearSideAzimuthWidth = 0.22,
		        const double etaDependentEfficiencyWidth = 0.5,
		        const char* fileName="ridgePizeroDecayV2.root",
		        const bool quickStop = false,
		        const bool printInformation=false) {

  double mesonMass = 0.135;                           // assume the piZero mass in GeV
  if(mesonChoice == 2)
    mesonMass = 0.547;                                // other choice is the eta

  unsigned int maxPrint = 10;
  unsigned int countPrint = 0;
  float etaNormalizationFactor = 1.0/(sqrt(2.0)*etaDependentEfficiencyWidth);
  float erfFactor = 1.0/etaNormalizationFactor;

  cout << "\n\n Toy model, fast simulation of decays of correlated pairs of mesons";
  cout << "\n   Meson choice = " << mesonChoice;

  if(useExponentialPt)
    cout << "\n   Using exponential pT distribution from 0.5 to 9.0 GeV/c";
  else
    cout << "\n   lowPt = " << lowPt << ",  hight pT = " << highPt;

  cout << "\n   low eta limit = " << lowEta << ",  high eta limit = " << highEta;
  cout << "\n   mountain fraction = " << mountainFraction << " with eta width = " << mountainRapidityWidth << " and azimuth width = " << mountainAzimuthWidth;
  cout << "\n   away-side fraction = " << awayFraction << " and azimuth width = " << awayAzimuthWidth;
  cout << "\n   near-side (ridge) fraction = " << nearSideRidgeFraction << " and azimuth width = " << nearSideAzimuthWidth;
  cout << "\n   eta-dependent reconstruction efficiency width = " << etaDependentEfficiencyWidth;
  double randomFraction = 1.0 - mountainFraction - awayFraction - nearSideRidgeFraction;
  cout << "\n   random pairs fraction = " << randomFraction;
  cout << endl << endl;

  double randomTest2 = randomFraction + mountainFraction;
  double randomTest3 = randomTest2 + awayFraction;

  const double decayPhotonMomentum = mesonMass/2.0;  // units of GeV/c
  
  //
  // EMCal barrel goes from eta = -1.48 to eta = +1.48
  // The barrel eta limits correspond to 2.694 radians (154.140 deg) to 0.448 radians (25.6 degrees)
  // EMCal endcap goes from eta = 1.48 to eta = 3.0 (positive end),  -3.0 to -1.48 (negative end)
  // The endcap eta limits correspond to 3.042 radians (174.061 degrees) and 0.099 radians (5.693 degrees)
  // Barrel crystals (61,220) are 2 x 2 x 23 cm,  endcap crystals are 3 x 3 x 22 cm (14,648) in 4 "Dees" (3,662 each)
  // Barrel crystals have ~1 degree azimuthal opening
  //
  const double barrelLowEta = -1.48;
  const double barrelHighEta = +1.48;
  const double endcapLowEta = barrelHighEta;         // positive endcap
  const double endcapHighEta = 3.0;                  // positive endcap
  
  const double radiusEMCalBarrel = 1.0;              // for the barrel

  const double endcapHighTheta = 2.0*atan(exp(-endcapLowEta));  // theta angle at the top of the "Dee", positive end
  const double endcapZ = radiusEMCalBarrel/tan(endcapHighTheta);
  if(printInformation) cout << "\n Highest theta value for positive endcap Dee = " << 180.0*endcapHighTheta/TMath::Pi() << " degrees" << endl;  
  if(printInformation) cout << "\n Z value for positive endcap Dee = " << endcapZ << " meters" << endl;
  
  TRandom1 *decayKinematics = new TRandom1();
  decayKinematics->SetSeed(1);                        // use the same default seed for each production
  const double diffEta = highEta - lowEta;
  const double diffPt = highPt - lowPt;

  TFile *decayFile = new TFile(fileName, "recreate", "Meson Decay NTUPLE for CMS EMCal");
  const int kNtupleParameters = 21;
  float ntupleParameters[kNtupleParameters];
  TNtuple *decayNtuple = new TNtuple("ridgeDecay", "Meson Decay into 2 Photons with Correlated Pairs",
				     "iEvent:kPizero:mesonPt:mesonEta:mesonPhi:mesonEnr:"// 5
                                     "photn1Pt:photn1Eta:photn1Phi:photn1Loc:photn1Enr:"// 10
                                     "photn2Pt:photn2Eta:photn2Phi:photn2Loc:photn2Enr:"// 15
                                     "openAngle:dSeparate:rndChoice:canReco:RPAngle"); // 20

  int nEvents10 = nEvents/10;

  //
  // pT distribution from 0.5 to 9.0 GeV/c
  //	f(pT) = pT*exp(-pT/0.5)
  //

  char ptFunction[200];
  sprintf(ptFunction, "50000*x*exp(-x/0.5)"); 
  TF1 *ptF = new TF1("ptF", ptFunction, 0.5, 9.0);
	
  //
  // v2Flow function produces angles from -pi to +pi
  //
  char flowFunction[200];
  sprintf(flowFunction, "1.0 + %4.2f*2.0*cos(2.0*x)", v2Factor);
  TF1 *v2Flow = new TF1("v2Flow", flowFunction, -TMath::Pi(), TMath::Pi());
  for(int iEvent=0; iEvent<nEvents; iEvent++) {

    if(iEvent>0 && iEvent%nEvents10==0)
      cout << "\n At event " << iEvent;

    //
    // In each event there are two pizero generated, which may or may not be correlated in direction
    //
    double reactionPlaneAngle = 0.0;
    double pairEta[2] = {-100., +100.};
    double pairPhi[2] = {-200., +200.};
    double pairPt[2] = {0., 0.};
    double rndm1 = decayKinematics->Rndm();
    unsigned int randomChoice = 0;
    if(rndm1 < randomFraction) {
      //
      // pair of pizero are uncorrelated
      //
      randomChoice = 1;
      pairEta[0] = lowEta + diffEta*decayKinematics->Rndm();
      pairEta[1] = pairEta[0] + diffEta*(0.5 - decayKinematics->Rndm());
      //
      // Check for using flow
      //
      if(useFlow) {
	reactionPlaneAngle = -0.5*TMath::Pi() + (decayKinematics->Rndm())*TMath::Pi();  // -pi/2 to +pi/2 range
        pairPhi[0] = v2Flow->GetRandom() + reactionPlaneAngle;
        pairPhi[1] = v2Flow->GetRandom() + reactionPlaneAngle;

	//
	// range conversion checking variables
	//
	double test0 = cos(2.0*(pairPhi[0] - reactionPlaneAngle));
	double epsilon0 = 1.0e-03*test0;
	if(epsilon0 < 1.0e-05)
	  epsilon0 = 1.0e-05;
	double test1 = cos(2.0*(pairPhi[1] - reactionPlaneAngle));
	double epsilon1 = 1.0e-03*test1;
	if(epsilon1 < 1.0e-05)
	  epsilon1 = 1.0e-05;

	//
	// Azimuthal angles for pairPhi above can range from -3pi/2 to +3pi/2
	// Azimuthal angles from atan2(py, px) range from -pi to + pi
	// Convert pairPhi back to -pi to +pi range
	//
        double xValue = cos(pairPhi[0]);
        double yValue = sin(pairPhi[0]);
	pairPhi[0] = atan2(yValue, xValue);
	xValue = cos(pairPhi[1]);
        yValue = sin(pairPhi[1]);
	pairPhi[1] = atan2(yValue, xValue);

	//
	// Check that the range conversion has not changed cos(2*DeltaPhi)
	//

	if(fabs(cos(2.0*(pairPhi[0] - reactionPlaneAngle)) - test0) > epsilon0) {
	  cerr << "\n Range conversion fails for pairPhi[0]" << endl;
	  return;
	} // check range conversion for the pairPhi[0]

	if(fabs(cos(2.0*(pairPhi[1] - reactionPlaneAngle)) - test1) > epsilon1) {
	  cerr << "\n Range conversion fails for pairPhi[1]" << endl;
	  return;
	} // check range conversion for the pairPhi[1]

      } // check on using flow
      else {
        pairPhi[0] = 2.0*(decayKinematics->Rndm())*TMath::Pi();
        pairPhi[1] = 2.0*(decayKinematics->Rndm())*TMath::Pi();
      } // not using flow
    }
    if(rndm1 >= randomFraction && rndm1 < randomTest2) {
      //
      // mountain fraction
      //
      double aRandom = 0.0;
      double bRandom = 0.0;
      decayKinematics->Rannor(aRandom, bRandom);
      pairEta[0] = lowEta + diffEta*decayKinematics->Rndm();
      pairEta[1] = pairEta[0] + mountainRapidityWidth*aRandom;
      pairPhi[0] = 2.0*(decayKinematics->Rndm())*TMath::Pi();
      pairPhi[1] = pairPhi[0] + mountainAzimuthWidth*bRandom;
      randomChoice = 2;
    }
    if(rndm1 >= randomTest2 && rndm1 < randomTest3) {
      //
      // away-side fraction
      //
      pairEta[0] = lowEta + diffEta*decayKinematics->Rndm();
      pairEta[1] = lowEta + diffEta*decayKinematics->Rndm();
      double aRandom = 0.0;
      double bRandom = 0.0;
      decayKinematics->Rannor(aRandom, bRandom);
      pairPhi[0] = 2.0*(decayKinematics->Rndm())*TMath::Pi();
      pairPhi[1] =  pairPhi[0] - TMath::Pi() + awayAzimuthWidth*aRandom;
      randomChoice = 3;
    }
    if(rndm1 >= randomTest3) {
      //
      // near-side ridge fraction
      //
      pairEta[0] = lowEta + diffEta*decayKinematics->Rndm();
      pairEta[1] = lowEta + diffEta*decayKinematics->Rndm();
      double aRandom = 0.0;
      double bRandom = 0.0;
      decayKinematics->Rannor(aRandom, bRandom);
      pairPhi[0] = 2.0*(decayKinematics->Rndm())*TMath::Pi();
      pairPhi[1] = pairPhi[0] + nearSideAzimuthWidth*bRandom;
      randomChoice = 4;
    }

    if(useExponentialPt) {
      pairPt[0] = ptF->GetRandom();
      pairPt[1] = ptF->GetRandom();
    }
    else {
      pairPt[0] = lowPt + diffPt*decayKinematics->Rndm();   // See ROOT documentation for cautions about the use of Rndm
      pairPt[1] = lowPt + diffPt*decayKinematics->Rndm();   // See ROOT documentation for cautions about the use of Rndm
    }
    for(int kPiZero=0; kPiZero<2; kPiZero++) {
      //
      // Choose a transverse momentum between lowPt and highPt
      //
      double pTransverse = pairPt[kPiZero];

      //
      // Choose a psuedo-rapidity eta between lowEta and highEta
      //

      double eta = pairEta[kPiZero];

      float normalizedEta = fabs(eta)/etaDependentEfficiencyWidth;
      float efficiencyCheck = erf(normalizedEta);
      float normalizedErf = erfFactor*efficiencyCheck;
      bool canReconstruct = normalizedErf < decayKinematics->Rndm();
      if(countPrint < maxPrint) {
	cout << "\n eta = " << eta << ", normalized eta = " << normalizedEta;
	cout << "\n efficiencyCheck = " << efficiencyCheck << ", normalizedErf = " << normalizedErf;

	if(canReconstruct)
	  cout << "\n Can reconstruct at this eta";
	else
	  cout << "\n Cannot reconstruct at this eta";

	cout << endl;

	countPrint++;
	if(quickStop && countPrint == maxPrint)
	  return;
      } // print check

      double theta = 2.0*atan(exp(-eta));
      double pTotal = pTransverse/sin(theta); 
      double costh = cos(theta);
      double sinth = sin(theta);

      //
      // Choose an azimuthal angle between 0 and 2Pi
      //
      double phi = pairPhi[kPiZero];
      double cosph = cos(phi);
      double sinph = sin(phi);

      //
      // Compute the 4-vector of the meson
      //
      double mesonEnergy = sqrt(pTotal*pTotal + mesonMass*mesonMass);
      TLorentzVector mesonLab(pTotal*sin(theta)*cos(theta),
			      pTotal*sin(theta)*sin(phi),
			      pTotal*cos(theta),
			      mesonEnergy);

      double beta = pTotal/sqrt(pTotal*pTotal + mesonMass*mesonMass);
      if(printInformation) cout << "\n pTotal = " << pTotal << ", beta = " << beta << endl;

      //
      // true beta
      //
      double beta4[4] ={beta*sin(theta)*cos(theta),
			beta*sin(theta)*sin(phi),
			beta*cos(theta),
			1.0/sqrt(1.0 - beta*beta)};

      //
      // "rotated" beta quantity from GEANT3
      // GEANT3 does the Lorentz boost of the photon momenta in two steps
      // 1) the first step is to assume that the lab Z frame is aligned with the meson Z axis
      // 2) the second step is to rotate the daughter momentum 3-vectors back to the actual lab Z direction
      //
      double betaRotate[4] = {0.0, 0.0, -pTotal/mesonLab(3), beta4[3]};
 
      //
      // Choose the azimuthal angle of one decay photon in the rest frame of the meson
      //
      double phi1 = 2.0*(decayKinematics->Rndm())*TMath::Pi();

      //
      // Choose the theta angle of this decay photon in the rest frame of the meson
      //
      double theta1 = acos(2.0*(0.5 - decayKinematics->Rndm()));

      //
      // Compose the momentum vector of this decay photon in the rest frame of the meson
      //
      double photon1Rest[4] = {decayPhotonMomentum*sin(theta1)*cos(phi1),
			       decayPhotonMomentum*sin(theta1)*sin(phi1),
			       decayPhotonMomentum*cos(theta1),
			       decayPhotonMomentum};

      //
      // Compose the momentum vector of this second decay photon in the rest frame of the meson
      //
      double photon2Rest[4] = {-decayPhotonMomentum*sin(theta1)*cos(phi1),
			       -decayPhotonMomentum*sin(theta1)*sin(phi1),
			       -decayPhotonMomentum*cos(theta1),
			       decayPhotonMomentum};

      //
      // Boost the photon rest frame momenta to the lab system according to the betaRotate value
      //
      double betpa = betaRotate[0]*photon1Rest[0] + betaRotate[1]*photon1Rest[1] + betaRotate[2]*photon1Rest[2];
      double bpgam = (betpa*betaRotate[3]/(betaRotate[3] + 1.) - photon1Rest[3])*betaRotate[3];
      double photon1Lab[4] = {photon1Rest[0] + bpgam*betaRotate[0],
			      photon1Rest[1] + bpgam*betaRotate[1],
			      photon1Rest[2] + bpgam*betaRotate[2],
			      (photon1Rest[3] - betpa)*betaRotate[3]};
      //
      // Now rotate back to the lab frame
      //
      double pxOld1[3] = {photon1Lab[0], photon1Lab[1], photon1Lab[2]};
      photon1Lab[0] = pxOld1[0]*costh*cosph - pxOld1[1]*sinph + pxOld1[2]*sinth*cosph;
      photon1Lab[1] = pxOld1[0]*costh*sinph + pxOld1[1]*cosph + pxOld1[2]*sinth*sinph;
      photon1Lab[2] = -pxOld1[0]*sinth                        + pxOld1[2]*costh;
	
      double photon1TotalMomentum = sqrt(photon1Lab[0]*photon1Lab[0] +
					 photon1Lab[1]*photon1Lab[1] +
					 photon1Lab[2]*photon1Lab[2]); 

      betpa = betaRotate[0]*photon2Rest[0] + betaRotate[1]*photon2Rest[1] + betaRotate[2]*photon2Rest[2];
      bpgam = (betpa*betaRotate[3]/(betaRotate[3] +1.) - photon2Rest[3])*betaRotate[3];
      double photon2Lab[4] = {photon2Rest[0] + bpgam*betaRotate[0],
			      photon2Rest[1] + bpgam*betaRotate[1],
			      photon2Rest[2] + bpgam*betaRotate[2],
			      (photon2Rest[3] - betpa)*betaRotate[3]};

      //
      // Now rotate back to the lab frame
      //
      double pxOld2[3] = {photon2Lab[0], photon2Lab[1], photon2Lab[2]};
      photon2Lab[0] = pxOld2[0]*costh*cosph - pxOld2[1]*sinph + pxOld2[2]*sinth*cosph;
      photon2Lab[1] = pxOld2[0]*costh*sinph + pxOld2[1]*cosph + pxOld2[2]*sinth*sinph;
      photon2Lab[2] = -pxOld2[0]*sinth                        + pxOld2[2]*costh;

      double photon2TotalMomentum = sqrt(photon2Lab[0]*photon2Lab[0] +
					 photon2Lab[1]*photon2Lab[1] +
					 photon2Lab[2]*photon2Lab[2]); 

      double mass1 = photon1Lab[3]*photon1Lab[3] - photon1TotalMomentum*photon1TotalMomentum;
  
      if(printInformation) cout << "\n mass1sq = " << mass1;
      if(printInformation) cout << endl;

      double mass2 = photon2Lab[3]*photon2Lab[3] - photon2TotalMomentum*photon2TotalMomentum;

      if(printInformation) cout << "\n mass2sq = " << mass2;
      if(printInformation) cout << endl;
  
      double photon1Theta = acos(photon1Lab[2]/photon1TotalMomentum);
      double photon1Eta = -log(tan(photon1Theta/2.));
	
      int photon1Location = -1;
      if(photon1Eta>barrelLowEta && photon1Eta<barrelHighEta)
	photon1Location = 0;
      if(fabs(photon1Eta)>endcapLowEta && fabs(photon1Eta)<endcapHighEta)
	photon1Location = 1; 
	  
      double photon1Phi = atan2(photon1Lab[1], photon1Lab[0]);
      //
      // Check for the photon in the barrel is based on the eta value
      //
      double photon1Z = 0.0;
      double photon1X = 0.0;
      double photon1Y = 0.0;
      if(photon1Location == 0) {
	photon1Z = radiusEMCalBarrel/tan(photon1Theta);
	photon1X = radiusEMCalBarrel*cos(photon1Phi);
	photon1Y = radiusEMCalBarrel*sin(photon1Phi);
      }
	
      if(photon1Location == 1) {
	//
	// First photon is in an endcap, either positive or negative end
	//
	photon1Z = endcapZ;
	if(photon1Eta < 0.0)
	  photon1Z = -endcapZ;    // negative eta corresponds to negative end

	double rAtEndcap = photon1Z*tan(photon1Theta);
	photon1X = rAtEndcap*cos(photon1Phi);
	photon1Y = rAtEndcap*sin(photon1Phi);
	if(printInformation) cout << "\n Photon1 location = " << photon1Location << ", (x,y,z) = (" << photon1X << ", " << photon1Y << ", " << photon1Z << ")" << endl;
      }
	
      double photon2Theta = acos(photon2Lab[2]/photon2TotalMomentum);
      double photon2Eta = -log(tan(photon2Theta/2.));
	
      int photon2Location = -1;
      if(photon2Eta>barrelLowEta && photon2Eta<barrelHighEta)
	photon2Location = 0;
      if(fabs(photon2Eta)>endcapLowEta && fabs(photon2Eta)<endcapHighEta)
	photon2Location  = 1; 
	  
      double photon2Phi = atan2(photon2Lab[1], photon2Lab[0]);
      //
      // Check for the photon in the barrel is based on the eta value
      //
      double photon2Z = 0.0;
      double photon2X = 0.0;
      double photon2Y = 0.0;
      if(photon2Location == 0) {
	photon2Z = radiusEMCalBarrel/tan(photon2Theta);
	photon2X = radiusEMCalBarrel*cos(photon2Phi);
	photon2Y = radiusEMCalBarrel*sin(photon2Phi);
      }
	
      if(photon2Location == 1) {
	//
	// Second photon is in an endcap, either positive or negative end
	//
	photon2Z = endcapZ;
	if(photon2Eta < 0.0)
	  photon2Z = -endcapZ;    // negative eta corresponds to negative end

	double rAtEndcap = photon2Z*tan(photon2Theta);
	photon2X = rAtEndcap*cos(photon2Phi);
	photon2Y = rAtEndcap*sin(photon2Phi);
	if(printInformation) cout << "\n Photon2 location = " << photon2Location << ", (x,y,z) = (" << photon2X << ", " << photon2Y << ", " << photon2Z << ")" << endl;
      }
	
      double separationDistance = -9999.0;  // default unless both photons are in detector
      if(photon1Location >= 0 && photon2Location >= 0)
	separationDistance = sqrt((photon1X - photon2X)*(photon1X - photon2X) +
				  (photon1Y - photon2Y)*(photon1Y - photon2Y) +
				  (photon1Z - photon2Z)*(photon1Z - photon2Z));	

      if(printInformation) cout << "\n mesonLab (";
      if(printInformation) cout << mesonLab[0] << ", " ;
      if(printInformation) cout << mesonLab[1] << ", " ;
      if(printInformation) cout << mesonLab[2] << ") " ;

      if(printInformation) cout << "\n beta4 (";
      if(printInformation) cout << beta4[0] << ", " ;
      if(printInformation) cout << beta4[1] << ", " ;
      if(printInformation) cout << beta4[2] << ", " ;
      if(printInformation) cout << beta4[3] << ") " ;

      if(printInformation) cout << "\n photon1Rest (";
      if(printInformation) cout << photon1Rest[0] << ", " ;
      if(printInformation) cout << photon1Rest[1] << ", " ;
      if(printInformation) cout << photon1Rest[2] << ", " ;
      if(printInformation) cout << photon1Rest[3] << ")" ;

      if(printInformation) cout << "\n photon2Rest (";
      if(printInformation) cout << photon2Rest[0] << ", " ;
      if(printInformation) cout << photon2Rest[1] << ", " ;
      if(printInformation) cout << photon2Rest[2] << ", " ;
      if(printInformation) cout << photon2Rest[3] << ")" ;
    
      if(printInformation) cout << "\n photon1Lab (";
      if(printInformation) cout << photon1Lab[0] << ", " ;
      if(printInformation) cout << photon1Lab[1] << ", " ;
      if(printInformation) cout << photon1Lab[2] << ", " ;
      if(printInformation) cout << photon1Lab[3] << ")" ;
      if(printInformation) cout << ", theta1Lab " << photon1Theta;

      if(printInformation) cout << "\n photon2Lab (";
      if(printInformation) cout << photon2Lab[0] << ", " ;
      if(printInformation) cout << photon2Lab[1] << ", " ;
      if(printInformation) cout << photon2Lab[2] << ", " ;
      if(printInformation) cout << photon2Lab[3] << ")" ;
      if(printInformation) cout << ", theta2Lab " << photon2Theta;

      double pxSum = photon1Lab[0] + photon2Lab[0];
      double pySum = photon1Lab[1] + photon2Lab[1];
      double pzSum = photon1Lab[2] + photon2Lab[2];
      double pTransverseDecay = sqrt(pxSum*pxSum + pySum*pySum);
      if(printInformation) cout << "\n pTransverse of decay photons = " << pTransverseDecay;
      if(printInformation) cout << "\n pTotal of decay photons = " << sqrt(pzSum*pzSum + pow(pTransverseDecay,2)) << endl;

      double cosOpen = (photon1Lab[0]*photon2Lab[0] + photon1Lab[1]*photon2Lab[1]+ photon1Lab[2]*photon2Lab[2])/ 
	(photon1TotalMomentum*photon2TotalMomentum);

      double openingAngle = -99999.0;
      if(fabs(cosOpen) < 1.0) {
	openingAngle = acos(cosOpen);
	if(printInformation) cout << "\n Opening angle = "  << openingAngle << " radians " << endl;
      }
      else {
	cerr << "\n Cosine of opening angle is out of range " << cosOpen << endl;
	cerr << "\n kPiZero " << kPiZero << ",  pTransverse " << pTransverse << ",  eta = " << eta << ", phi = " << phi;
	cerr << "\n random choice = " << randomChoice; 
	cerr << endl;
	return;
      }
									 
      if(printInformation) cout << "\n Separation distance is " << separationDistance << " meters" << endl;

      if(printInformation) cout << endl;
    
      ntupleParameters[0] = iEvent + 1;
      ntupleParameters[1] = kPiZero;

      ntupleParameters[2] = pTransverse;
      ntupleParameters[3] = eta;
      ntupleParameters[4] = phi;
      ntupleParameters[5] = mesonEnergy;

      ntupleParameters[6] = photon1TotalMomentum*sin(photon1Theta);
      ntupleParameters[7] = photon1Eta;
      ntupleParameters[8] = photon1Phi;
      ntupleParameters[9] = photon1Location;
      ntupleParameters[10] = photon1TotalMomentum;

      ntupleParameters[11] = photon2TotalMomentum*sin(photon2Theta);
      ntupleParameters[12] = photon2Eta;
      ntupleParameters[13] = photon2Phi;
      ntupleParameters[14] = photon2Location;
      ntupleParameters[15] = photon2TotalMomentum;
	
      ntupleParameters[16] = openingAngle;
      ntupleParameters[17] = 100*separationDistance;  // store the separation distance in cm

      ntupleParameters[18] = randomChoice;
			
      if(canReconstruct)
	ntupleParameters[19] = 1;
      else
	ntupleParameters[19] = 0;
			
      ntupleParameters[20] = reactionPlaneAngle;

      decayNtuple->Fill(ntupleParameters);

    } // loop over the two pizero members in the pair

  } // loop over number of events

  cout << "\n Finished event loop" << endl << endl;

  decayFile->Write();
  decayFile->Close();

  return;

}
