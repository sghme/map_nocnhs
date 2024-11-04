import 'package:latlong2/latlong.dart';
import 'Buildings.dart';
import 'Landmarks.dart';

List<LatLng> getBuildingPolygonForBuilding(String polygonName) {
  switch (polygonName) {
    
   
    case 'grade7BuildingA':
      return grade7BuildingA;
    case 'grade7BuildingB':
      return grade7BuildingB;
    case 'absBuildingA':
      return absBuildingA;
    case 'absBuildingB':
      return absBuildingB;
    case 'steA':
      return steA;
    case 'steB':
      return steB;
    case 'steC':
      return steC;
    case 'SwimmingPoolGate':
      return SwimmingPoolGate;
    case 'greenA':
      return greenA;
    case 'greeneryB':
      return greeneryB;
    case 'greeneryC':
      return greeneryC;
    case 'Grade104FBuilding':
      return Grade104FBuilding;
    case 'buildingSwimmingpool':
      return buildingSwimmingpool;
    case 'buildingGrade9A':
      return buildingGrade9A;
    case 'buildingGrade9B':
      return buildingGrade9B;
    case 'grade9BuildingC':
      return grade9BuildingC;
    case 'G9Lab1':
      return G9Lab1;
    case 'grade9BuildingE':
      return grade9BuildingE;
    case 'Grade9BuildingF':
      return Grade9BuildingF;
    case 'Grade9BuildingG':
      return Grade9BuildingG;
    case 'Grade_9BuildingH':
      return Grade_9BuildingH;
    case 'SPSBuilding':
      return SPSBuilding;
    case 'Grade8Building2ndfloor':
      return Grade8Building2ndfloor;
    case 'CarpentryTLEA':
      return CarpentryTLEA;
    case 'Grade8BuildingA':
      return Grade8BuildingA;
    case 'CarpentryStage':
      return CarpentryStage;
    case 'Grade8BuildingB':
      return Grade8BuildingB;
    case 'Grade8BuildingC':
      return Grade8BuildingC;
    case 'Grade8BuildingD':
      return Grade8BuildingD;
    case 'Grade8BuildingE':
      return Grade8BuildingE;
    case 'Grade8BuildingF':
      return Grade8BuildingF;
    case 'TLEBuildingB':
      return TLEBuildingB;
    case 'TLEBuildingA':
      return TLEBuildingA;
    case 'Grade10Buildingwith2ndFloor':
      return Grade10Buildingwith2ndFloor;
    case 'SupplyOfficeBuilding':
      return SupplyOfficeBuilding;
    case 'TLECarpentryB':
      return TLECarpentryB;
    case 'Grade10BuildingA':
      return Grade10BuildingA;
    case 'Grade10BuildingB':
      return Grade10BuildingB;
    case 'Grade10LabCanteen':
      return Grade10LabCanteen;
    case 'SPA_Building':
      return SPA_Building;
    case 'OfficeTpdSsg':
      return OfficeTpdSsg;
    case 'PTAOffice':
      return PTAOffice;
    case 'Mainbuilding':
      return Mainbuilding;
    case 'ssgoffice':
      return ssgoffice;
    case 'BesideInnerWaitingShed':
      return BesideInnerWaitingShed; 
    case 'InnerWaitingShedBuilding':
      return InnerWaitingShedBuilding; 
      case 'PastryLab':
      return PastryLab;
    default:
      return [];
  }
}


// import 'package:latlong2/latlong.dart';
// import 'Landmarks.dart';
// List<LatLng> getLandmarkPolygonForLandmark(String polygonName) {
//   switch (polygonName) {
//     case 'SwimmingPoolGate':
//       return SwimmingPoolGate;
//     case 'Coveredcourt':
//       return Coveredcourt;
//     // case 'Basketballcourtgr8':
//     //   return Basketballcourtgr8;
//     default:
//       return [];
//   }
// }

