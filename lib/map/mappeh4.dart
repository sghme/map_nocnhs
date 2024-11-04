import 'package:latlong2/latlong.dart';
import 'Landmarks.dart';
import 'Buildings.dart'; //Note only the Basketballcourtgr8 for this import

List<LatLng> getLandmarkPolygonForLandmark(String polygonName) {
  switch (polygonName) {
case 'SwimmingPoolGate':
      return SwimmingPoolGate;
case 'Coveredcourt':
      return Coveredcourt; 
case 'SpecialBuildingMain':
      return SpecialBuildingMain; 
case 'SpecialEducBuilding':
      return SpecialEducBuilding; 
case 'SpecialEducBuilding2':
      return SpecialEducBuilding2; 
case 'DepEd1':
      return DepEd1; 
case 'DepEd2':
      return DepEd2; 
case 'NightHigh1':
      return NightHigh1; 
case 'NightHigh2':
      return NightHigh2; 
case 'NightHigh3':
      return NightHigh3; 
case 'ocshsCourt':
      return ocshsCourt; 
case 'ocshsBuildingA':
      return ocshsBuildingA; 
case 'ocshsBuildingB':
      return ocshsBuildingB; 
case 'StudentGateGuardHouse':
      return StudentGateGuardHouse; 
case 'WaitingShed':
      return WaitingShed; 
case 'GuardHouse':
      return GuardHouse; 
// case 'Gate':
//       return Gate; 
case 'OldStage':
      return OldStage; 
case 'OldCourt':
      return OldCourt; 
case 'InnerWaitingShed1':
      return InnerWaitingShed1; 
case 'MaterialRoom':
      return MaterialRoom; 
case 'MainCanteen':
      return MainCanteen; 
case 'grade7Canteen':
      return grade7Canteen; 
case 'G8bldCanteen':
      return G8bldCanteen; 
case 'STECanteen':
      return STECanteen; 
case 'CrNearMainBuilding':
      return CrNearMainBuilding; 
case 'OldStageCR':
      return OldStageCR; 
case 'CR1OldStage':
      return CR1OldStage; 
case 'CR2OldStage':
      return CR2OldStage; 
case 'BesideCoveredCourtCR':
      return BesideCoveredCourtCR; 
case 'STEWashroom':
      return STEWashroom; 
case 'Carpentry_Cr':
      return Carpentry_Cr;
case 'SPS_Cr':
      return SPS_Cr;
case 'CrNrG9':
      return CrNrG9;
case 'CrNrG8A':
      return CrNrG8A;
case 'CrNrG8B':
      return CrNrG8B;
case 'Basketballcourtgr8':
     return Basketballcourtgr8;

    default:
      return [];
  }
}
