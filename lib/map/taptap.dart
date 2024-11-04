import 'Buildings.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

List<Polygon> allPolygons = [];
Map<String, LatLngBounds> polygonBoundsMap = {};
LatLng calculatePolygonCenter(List<LatLng> points) {
  double latitudeSum = 0;
  double longitudeSum = 0;

  for (var point in points) {
    latitudeSum += point.latitude;
    longitudeSum += point.longitude;
  }

  return LatLng(latitudeSum / points.length, longitudeSum / points.length);
}

LatLng offsetPointAbove(LatLng point, double offset) {
  return LatLng(point.latitude + offset, point.longitude);
}

List<Polygon> initializePolygons(Map<String, LatLngBounds> polygonBoundsMap) {
  List<LatLng> BesideInnerWaitingShedTap = BesideInnerWaitingShed;
  List<LatLng> InnerWaitingShedBuildingTap = InnerWaitingShedBuilding;
  List<LatLng> PastryLabTap = PastryLab;
  //BASKETBALL AREA
  List<LatLng> Basketballcourtgr8Tap = Basketballcourtgr8;
  // Grade 7 Building A
  List<LatLng> grade7BuildingATap = grade7BuildingA;
  // Grade 7 Building B
  List<LatLng> grade7BuildingBTap = grade7BuildingB;
  // ABS-Building A
  List<LatLng> absBuildingATap = absBuildingA;
  // ABS-Building B
  List<LatLng> absBuildingBTap = absBuildingB;
  // STE A
  List<LatLng> steATap = steA;
  // STE A
  List<LatLng> steBTap = steB;
  // STE A
  List<LatLng> steCTap = steC;
  // Green A
  List<LatLng> greenATap = greenA;
  // Greenery B
  List<LatLng> greeneryBTap = greeneryB;
  // Greenery C
  List<LatLng> greeneryCTap = greeneryC;
  //Grade10 Building 4th floor
  List<LatLng> Grade104FBuildingTap = Grade104FBuilding;
  // Building Swimming Pool
  List<LatLng> buildingSwimmingpoolTap = buildingSwimmingpool;
  // Building Grade 9 A
  List<LatLng> buildingGrade9ATap = buildingGrade9A;
  // Building Grade 9 B
  List<LatLng> buildingGrade9BTap = buildingGrade9B;
  // Grade 9  C
  List<LatLng> grade9BuildingCTap = grade9BuildingC;
  // Grade 9  D
  List<LatLng> G9Lab1Tap = G9Lab1;
  // Grade 9  E
  List<LatLng> grade9BuildingETap = grade9BuildingE;
  // Grade 9  F
  List<LatLng> Grade9BuildingFTap = Grade9BuildingF;
  // Grade 9  G
  List<LatLng> Grade9BuildingGTap = Grade9BuildingG;
  // Grade 9  H
  List<LatLng> Grade_9BuildingHTap = Grade_9BuildingH;
  // SPS
  List<LatLng> SPSBuildingTap = SPSBuilding;
  // GRADE 8 2ND FLOOR
  List<LatLng> Grade8Building2ndfloorTap = Grade8Building2ndfloor;
  List<LatLng> CarpentryTLEATap = CarpentryTLEA;
  List<LatLng> Grade8BuildingATap = Grade8BuildingA;
  List<LatLng> PastryTLEBuildingTap = PastryTLEBuilding;
  List<LatLng> Grade8BuildingBTap = Grade8BuildingB;
  List<LatLng> Grade8BuildingCTap = Grade8BuildingC;
  List<LatLng> Grade8BuildingDTap = Grade8BuildingD;
  List<LatLng> Grade8BuildingETap = Grade8BuildingE;
  List<LatLng> Grade8BuildingFTap = Grade8BuildingF;
  List<LatLng> TLEBuildingBTap = TLEBuildingB;
  List<LatLng> TLEBuildingATap = TLEBuildingA;
  //Grade10 Building 2ndFloor
  List<LatLng> Grade10Buildingwith2ndFloorTap = Grade10Buildingwith2ndFloor;
  List<LatLng> SupplyOfficeBuildingTap = SupplyOfficeBuilding; 
  List<LatLng> CarpentryStageTap = CarpentryStage;
  List<LatLng> TLECarpentryBTap = TLECarpentryB;
  List<LatLng> Grade10BuildingATap = Grade10BuildingA;
  List<LatLng> Grade10BuildingBTap = Grade10BuildingB;
  List<LatLng> Grade10LabCanteenTap = Grade10LabCanteen;
  List<LatLng> SPA_BuildingTap = SPA_Building;
  List<LatLng> OfficeTpdSsgTap = OfficeTpdSsg;
  List<LatLng> PTAOfficeTap = PTAOffice;
  List<LatLng> MainbuildingTap = Mainbuilding;
  List<LatLng> ssgofficeTap = ssgoffice;

  List<Polygon> allPolygons = [
    //BASKETBALL AREA

    Polygon(
      points: BesideInnerWaitingShedTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: InnerWaitingShedBuilding,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: PastryLab,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),

    Polygon(
      points: Basketballcourtgr8Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // Grade 7 Building A
    Polygon(
      points: grade7BuildingATap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // Grade 7 Building B
    Polygon(
      points: grade7BuildingBTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // ABS-Building B
    Polygon(
      points: absBuildingATap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
     Polygon(
      points: absBuildingBTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // STE A
    Polygon(
      points: steATap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // STE B
    Polygon(
      points: steBTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // STE C
    Polygon(
      points: greenATap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // Green A
    Polygon(
      points: steCTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // Greenery B
    Polygon(
      points: greeneryBTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // Greenery C
    Polygon(
      points: greeneryCTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    //Grade10 Building 4th floor
    Polygon(
      points: Grade104FBuildingTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // Building Swimming Pool
    Polygon(
      points: buildingSwimmingpoolTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // Building Grade 9 A
    Polygon(
      points: buildingGrade9ATap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // Building Grade 9 B
    Polygon(
      points: buildingGrade9BTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // Grade 9  C
    Polygon(
      points: grade9BuildingCTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // Grade 9  D
    Polygon(
      points: G9Lab1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // Grade 9  E
    Polygon(
      points: grade9BuildingETap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // Grade 9  F
    Polygon(
      points: Grade9BuildingFTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // Grade 9  G
    Polygon(
      points: Grade9BuildingGTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // Grade 9  H
    Polygon(
      points: Grade_9BuildingHTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // SPS
    Polygon(
      points: SPSBuildingTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // GRADE 8 2ND FLOOR
    Polygon(
      points: Grade8Building2ndfloorTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: CarpentryTLEATap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: Grade8BuildingATap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: PastryTLEBuildingTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: Grade8BuildingBTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: Grade8BuildingCTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: Grade8BuildingDTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: Grade8BuildingETap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: Grade8BuildingFTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: TLEBuildingBTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: TLEBuildingATap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    //Grade10 Building 2ndFloor
    Polygon(
      points: Grade10Buildingwith2ndFloorTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: SupplyOfficeBuildingTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: TLECarpentryBTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ), 
    Polygon(
      points: CarpentryStageTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: Grade10BuildingATap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: Grade10BuildingBTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: Grade10LabCanteenTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: SPA_BuildingTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: OfficeTpdSsgTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: PTAOfficeTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: MainbuildingTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: ssgofficeTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
  ];

  // Calculate bounds for each polygon

  LatLngBounds BesideInnerWaitingShedBounds =
      LatLngBounds.fromPoints(BesideInnerWaitingShed);
  LatLngBounds InnerWaitingShedBuildingBounds =
      LatLngBounds.fromPoints(InnerWaitingShedBuilding);
  LatLngBounds PastryLabBounds = LatLngBounds.fromPoints(PastryLab);

  //BASKETBALL AREA
  LatLngBounds Basketballcourtgr8Bounds =
      LatLngBounds.fromPoints(Basketballcourtgr8);
  // Grade 7 Building A
  LatLngBounds grade7BuildingABounds = LatLngBounds.fromPoints(grade7BuildingA);
  // Grade 7 Building B
  LatLngBounds grade7BuildingBBounds = LatLngBounds.fromPoints(grade7BuildingB);
  // ABS-Building A
  LatLngBounds absABuildingBounds = LatLngBounds.fromPoints(absBuildingA);
  // ABS-BUILDING B
  LatLngBounds absBBuildingBounds = LatLngBounds.fromPoints(absBuildingB);
  // STE A
  LatLngBounds steABounds = LatLngBounds.fromPoints(steA);
  // STE B
  LatLngBounds steBBounds = LatLngBounds.fromPoints(steB);
  // STE C
  LatLngBounds steCBounds = LatLngBounds.fromPoints(steC);
  // Green A
  LatLngBounds greenABounds = LatLngBounds.fromPoints(greenA);
  // Greenery B
  LatLngBounds greeneryBBounds = LatLngBounds.fromPoints(greeneryB);
  // Greenery C
  LatLngBounds greeneryCBounds = LatLngBounds.fromPoints(greeneryC);
  //Grade10 Building 4th floor
  LatLngBounds Grade104FBuildingBounds =
      LatLngBounds.fromPoints(Grade104FBuilding);
  // Building Swimming Pool
  LatLngBounds buildingSwimmingpoolBounds =
      LatLngBounds.fromPoints(buildingSwimmingpool);
  // Building Grade 9 A
  LatLngBounds buildingGrade9ABounds = LatLngBounds.fromPoints(buildingGrade9A);
  // Building Grade 9 B
  LatLngBounds buildingGrade9BBounds = LatLngBounds.fromPoints(buildingGrade9B);
  // Grade 9  C
  LatLngBounds grade9BuildingCBounds = LatLngBounds.fromPoints(grade9BuildingC);
  // Grade 9  D
  LatLngBounds G9Lab1Bounds = LatLngBounds.fromPoints(G9Lab1);
  // Grade 9  E
  LatLngBounds grade9BuildingEBounds = LatLngBounds.fromPoints(grade9BuildingE);
  // Grade 9  F
  LatLngBounds Grade9BuildingFBounds = LatLngBounds.fromPoints(Grade9BuildingF);
  // Grade 9  G
  LatLngBounds Grade9BuildingGBounds = LatLngBounds.fromPoints(Grade9BuildingG);
  // Grade 9  HGrade9BuildingG
  LatLngBounds Grade_9BuildingHBounds =
      LatLngBounds.fromPoints(Grade_9BuildingH);
  // SPS
  LatLngBounds SPSBuildingBounds = LatLngBounds.fromPoints(SPSBuilding);
  // GRADE 8 2ND FLOOR
  LatLngBounds Grade8Building2ndfloorBounds =
      LatLngBounds.fromPoints(Grade8Building2ndfloor);
  LatLngBounds CarpentryTLEABounds = LatLngBounds.fromPoints(CarpentryTLEA);
  LatLngBounds Grade8BuildingABounds = LatLngBounds.fromPoints(Grade8BuildingA);
  LatLngBounds PastryTLEBuildingBounds =
      LatLngBounds.fromPoints(PastryTLEBuilding);
  LatLngBounds Grade8BuildingBBounds = LatLngBounds.fromPoints(Grade8BuildingB);
  LatLngBounds Grade8BuildingCBounds = LatLngBounds.fromPoints(Grade8BuildingC);
  LatLngBounds Grade8BuildingDBounds = LatLngBounds.fromPoints(Grade8BuildingD);
  LatLngBounds Grade8BuildingEBounds = LatLngBounds.fromPoints(Grade8BuildingE);
  LatLngBounds Grade8BuildingFBounds = LatLngBounds.fromPoints(Grade8BuildingF);
  LatLngBounds TLEBuildingBBounds = LatLngBounds.fromPoints(TLEBuildingB);
  LatLngBounds TLEBuildingABounds = LatLngBounds.fromPoints(TLEBuildingA);
  //Grade10 Building 2ndFloor
  LatLngBounds Grade10Buildingwith2ndFloorBounds =
      LatLngBounds.fromPoints(Grade10Buildingwith2ndFloor);
  LatLngBounds SupplyOfficeBuildingBounds =
      LatLngBounds.fromPoints(SupplyOfficeBuilding);
  LatLngBounds TLECarpentryBBounds = LatLngBounds.fromPoints(TLECarpentryB); 
   LatLngBounds CarpentryStageBounds = LatLngBounds.fromPoints(CarpentryStage);
  LatLngBounds Grade10BuildingABounds =
      LatLngBounds.fromPoints(Grade10BuildingA);
  LatLngBounds Grade10BuildingBBounds =
      LatLngBounds.fromPoints(Grade10BuildingB);
  LatLngBounds Grade10LabCanteenBounds =
      LatLngBounds.fromPoints(Grade10LabCanteen);
  LatLngBounds SPA_BuildingBounds = LatLngBounds.fromPoints(SPA_Building);
  LatLngBounds OfficeTpdSsgBounds = LatLngBounds.fromPoints(OfficeTpdSsg);
  LatLngBounds PTAOfficeBounds = LatLngBounds.fromPoints(PTAOffice);
  LatLngBounds MainbuildingBounds = LatLngBounds.fromPoints(Mainbuilding);
  LatLngBounds ssgofficeBounds = LatLngBounds.fromPoints(ssgoffice);

  // Store bounds in the map with the polygon name as the key

  polygonBoundsMap['BesideInnerWaitingShed'] = BesideInnerWaitingShedBounds;
  polygonBoundsMap['InnerWaitingShedBuilding'] = InnerWaitingShedBuildingBounds;
  polygonBoundsMap['PastryLab'] = PastryLabBounds;
  //BASKETBALL AREA
  polygonBoundsMap['Basketballcourtgr8'] = Basketballcourtgr8Bounds;
  // Grade 7 Building A
  polygonBoundsMap['grade7BuildingA'] = grade7BuildingABounds;
  // Grade 7 Building B
  polygonBoundsMap['grade7BuildingB'] = grade7BuildingBBounds;
  // ABS-Building A
  polygonBoundsMap['absBuildingA'] = absABuildingBounds;
  //ABS Building b
  polygonBoundsMap['absBuildingB'] = absBBuildingBounds;
  // STE A
  polygonBoundsMap['steA'] = steABounds;
  // STE B
  polygonBoundsMap['steB'] = steBBounds;
  // STE C
  polygonBoundsMap['steC'] = steCBounds;
  // Green A
  polygonBoundsMap['greenA'] = greenABounds;
  // Greenery B
  polygonBoundsMap['greeneryB'] = greeneryBBounds;
  // Greenery C
  polygonBoundsMap['greeneryC'] = greeneryCBounds;
  //Grade10 Building 4th floor
  polygonBoundsMap['Grade104FBuilding'] = Grade104FBuildingBounds;
  // Building Swimming Pool
  polygonBoundsMap['buildingSwimmingpool'] = buildingSwimmingpoolBounds;
  // Building Grade 9 A
  polygonBoundsMap['buildingGrade9A'] = buildingGrade9ABounds;
  // Building Grade 9 B
  polygonBoundsMap['buildingGrade9B'] = buildingGrade9BBounds;
  // Grade 9  C
  polygonBoundsMap['grade9BuildingC'] = grade9BuildingCBounds;
  // Grade 9  D
  polygonBoundsMap['G9Lab1'] = G9Lab1Bounds;
  // Grade 9  E
  polygonBoundsMap['grade9BuildingE'] = grade9BuildingEBounds;
  // Grade 9  F
  polygonBoundsMap['Grade9BuildingF'] = Grade9BuildingFBounds;
  // Grade 9  G
  polygonBoundsMap['Grade9BuildingG'] = Grade9BuildingGBounds;
  // Grade 9  H
  polygonBoundsMap['Grade_9BuildingH'] = Grade_9BuildingHBounds;
  // SPS
  polygonBoundsMap['SPSBuilding'] = SPSBuildingBounds;
  //END
  // GRADE 8 2ND FLOOR
  polygonBoundsMap['Grade8Building2ndfloor'] = Grade8Building2ndfloorBounds;
  polygonBoundsMap['CarpentryTLEA'] = CarpentryTLEABounds;
  polygonBoundsMap['Grade8BuildingA'] = Grade8BuildingABounds;
  polygonBoundsMap['PastryTLEBuilding'] = PastryTLEBuildingBounds;
  polygonBoundsMap['Grade8BuildingB'] = Grade8BuildingBBounds;
  polygonBoundsMap['Grade8BuildingC'] = Grade8BuildingCBounds;
  polygonBoundsMap['Grade8BuildingD'] = Grade8BuildingDBounds;
  polygonBoundsMap['Grade8BuildingE'] = Grade8BuildingEBounds;
  polygonBoundsMap['Grade8BuildingF'] = Grade8BuildingFBounds;
  polygonBoundsMap['TLEBuildingB'] = TLEBuildingBBounds;
  polygonBoundsMap['TLEBuildingA'] = TLEBuildingABounds;
  //Grade10 Building 2ndFloor
  polygonBoundsMap['Grade10Buildingwith2ndFloor'] =Grade10Buildingwith2ndFloorBounds;
  polygonBoundsMap['SupplyOfficeBuilding'] = SupplyOfficeBuildingBounds;
  polygonBoundsMap['TLECarpentryB'] = TLECarpentryBBounds; 
   polygonBoundsMap['CarpentryStage'] = CarpentryStageBounds;
  polygonBoundsMap['Grade10BuildingA'] = Grade10BuildingABounds;
  polygonBoundsMap['Grade10BuildingB'] = Grade10BuildingBBounds;
  polygonBoundsMap['Grade10LabCanteen'] = Grade10LabCanteenBounds;
  polygonBoundsMap['SPA_Building'] = SPA_BuildingBounds;
  polygonBoundsMap['OfficeTpdSsg'] = OfficeTpdSsgBounds;
  polygonBoundsMap['PTAOffice'] = PTAOfficeBounds;
  polygonBoundsMap['Mainbuilding'] = MainbuildingBounds;
  polygonBoundsMap['ssgoffice'] = ssgofficeBounds;

  return allPolygons;
}
