import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'Landmarks.dart';
import 'Buildings.dart'; //Note only the Basketballcourtgr8 for this import

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

// LatLng offsetPointAbove(LatLng point, double offset) {
//   return LatLng(point.latitude + offset, point.longitude);
// }

List<Polygon> initializeLandmarkPolygons(
    Map<String, LatLngBounds> LandmarkpolygonBoundsMap) {
  List<LatLng> Basketballcourtgr8Tap = Basketballcourtgr8;
  List<LatLng> SwimmingPoolTap = SwimmingPoolGate;
  List<LatLng> SpecialBuildingMainTap = SpecialBuildingMain;
  List<LatLng> SpecialEducBuildingTap = SpecialEducBuilding;
  List<LatLng> SpecialEducBuilding2Tap = SpecialEducBuilding2;
  List<LatLng> DepEd1Tap = DepEd1;
  List<LatLng> DepEd2Tap = DepEd2;
  List<LatLng> NightHigh1Tap = NightHigh1;
  List<LatLng> NightHigh2Tap = NightHigh2;
  List<LatLng> NightHigh3Tap = NightHigh3;
  List<LatLng> ocshsCourtTap = ocshsCourt;
  List<LatLng> ocshsBuildingATap = ocshsBuildingA;
  List<LatLng> ocshsBuildingBTap = ocshsBuildingB;
  List<LatLng> StudentGateGuardHouseTap = StudentGateGuardHouse;
  List<LatLng> WaitingShedTap = WaitingShed;
  List<LatLng> GuardHouseTap = GuardHouse;
  // List<LatLng> GateTap = Gate;
  List<LatLng> OldStageTap = OldStage;
  List<LatLng> OldCourtTap = OldCourt;
  List<LatLng> InnerWaitingShed1Tap = InnerWaitingShed1;
  List<LatLng> CoveredcourtTap = Coveredcourt;
  List<LatLng> MaterialRoomTap = MaterialRoom;
  List<LatLng> MainCanteenTap = MainCanteen;
  List<LatLng> grade7CanteenTap = grade7Canteen;
  List<LatLng> G8bldCanteenTap = G8bldCanteen;
  List<LatLng> STECanteenTap = STECanteen;
  List<LatLng> CrNearMainBuildingTap = CrNearMainBuilding;
  List<LatLng> OldStageCRTap = OldStageCR;
  List<LatLng> CR1OldStageTap = CR1OldStage;
  List<LatLng> CR2OldStageTap = CR2OldStage;
  List<LatLng> BesideCoveredCourtCRTap = BesideCoveredCourtCR;
  List<LatLng> CrNearStudentGateTap = CrNearStudentGate;
  List<LatLng> STEWashroomTap = STEWashroom;
  List<LatLng> Carpentry_CrTap = Carpentry_Cr;
  List<LatLng> SPS_CrTap = SPS_Cr;
  List<LatLng> CrNrG9Tap = CrNrG9;
  List<LatLng> CrNrG8ATap = CrNrG8A;
  List<LatLng> CrNrG8BTap = CrNrG8B;

  List<Polygon> allPolygons = [
    Polygon(
      points: Basketballcourtgr8Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: SwimmingPoolTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: SpecialBuildingMainTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: SpecialEducBuildingTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: SpecialEducBuilding2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: DepEd1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: DepEd2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: NightHigh1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: NightHigh2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: NightHigh3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: ocshsCourtTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: ocshsBuildingATap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: ocshsBuildingBTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: StudentGateGuardHouseTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: WaitingShedTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: GuardHouseTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // Polygon(
    //   points: GateTap,
    //   color: Colors.transparent,
    //   borderStrokeWidth: 0,
    // ),
    Polygon(
      points: OldStageTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: OldCourtTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: InnerWaitingShed1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: CoveredcourtTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: MaterialRoomTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: MainCanteenTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade7CanteenTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G8bldCanteenTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STECanteenTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: CrNearMainBuildingTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: OldStageCRTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: OldStageCRTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: CR1OldStageTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: CR2OldStageTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: BesideCoveredCourtCRTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: CrNearStudentGateTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEWashroomTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: Carpentry_CrTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: SPS_CrTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: CrNrG9Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: CrNrG8ATap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: CrNrG8BTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
  ];

  // Calculate bounds for each polygon
  LatLngBounds Basketballcourtgr8Bounds =
      LatLngBounds.fromPoints(Basketballcourtgr8);
  LatLngBounds SwimmingPoolBounds = LatLngBounds.fromPoints(SwimmingPoolGate);
  LatLngBounds SpecialBuildingMainBounds =
      LatLngBounds.fromPoints(SpecialBuildingMain);
  LatLngBounds SpecialEducBuildingBounds =
      LatLngBounds.fromPoints(SpecialEducBuilding);
  LatLngBounds SpecialEducBuilding2Bounds =
      LatLngBounds.fromPoints(SpecialEducBuilding2);
  LatLngBounds DepEd1Bounds = LatLngBounds.fromPoints(DepEd1);
  LatLngBounds DepEd2Bounds = LatLngBounds.fromPoints(DepEd2);
  LatLngBounds NightHigh1Bounds = LatLngBounds.fromPoints(NightHigh1);
  LatLngBounds NightHigh2Bounds = LatLngBounds.fromPoints(NightHigh2);
  LatLngBounds NightHigh3Bounds = LatLngBounds.fromPoints(NightHigh3);
  LatLngBounds ocshsCourtBounds = LatLngBounds.fromPoints(ocshsCourt);
  LatLngBounds ocshsBuildingABounds = LatLngBounds.fromPoints(ocshsBuildingA);
  LatLngBounds ocshsBuildingBBounds = LatLngBounds.fromPoints(ocshsBuildingB);
  LatLngBounds StudentGateGuardHouseBounds =
      LatLngBounds.fromPoints(StudentGateGuardHouse);
  LatLngBounds WaitingShedBounds = LatLngBounds.fromPoints(WaitingShed);
  LatLngBounds GuardHouseBounds = LatLngBounds.fromPoints(GuardHouse);
  // LatLngBounds GateBounds = LatLngBounds.fromPoints(Gate);
  LatLngBounds OldStageBounds = LatLngBounds.fromPoints(OldStage);
  LatLngBounds OldCourtBounds = LatLngBounds.fromPoints(OldCourt);
  LatLngBounds InnerWaitingShed1Bounds =
      LatLngBounds.fromPoints(InnerWaitingShed1);
  LatLngBounds CoveredcourtBounds = LatLngBounds.fromPoints(Coveredcourt);
  LatLngBounds MaterialRoomBounds = LatLngBounds.fromPoints(MaterialRoom);
  LatLngBounds MainCanteenBounds = LatLngBounds.fromPoints(MainCanteen);
  LatLngBounds grade7CanteenBounds = LatLngBounds.fromPoints(grade7Canteen);
  LatLngBounds G8bldCanteenBounds = LatLngBounds.fromPoints(G8bldCanteen);
  LatLngBounds STECanteenBounds = LatLngBounds.fromPoints(STECanteen);
  LatLngBounds CrNearMainBuildingBounds =
      LatLngBounds.fromPoints(CrNearMainBuilding);
  LatLngBounds OldStageCRBounds = LatLngBounds.fromPoints(OldStageCR);
  LatLngBounds CR1OldStageBounds = LatLngBounds.fromPoints(CR1OldStage);
  LatLngBounds CR2OldStageBounds = LatLngBounds.fromPoints(CR2OldStage);
  LatLngBounds BesideCoverdCourtCRBounds =
      LatLngBounds.fromPoints(BesideCoveredCourtCR);
  LatLngBounds CrNearStudentGateBounds =
      LatLngBounds.fromPoints(CrNearStudentGate);
  LatLngBounds STEWashroomBounds = LatLngBounds.fromPoints(STEWashroom);
  LatLngBounds Carpentry_CrBounds = LatLngBounds.fromPoints(Carpentry_Cr);
  LatLngBounds SPS_CrBounds = LatLngBounds.fromPoints(SPS_Cr);
  LatLngBounds CrNrG9Bounds = LatLngBounds.fromPoints(CrNrG9);
  LatLngBounds CrNrG8ABounds = LatLngBounds.fromPoints(CrNrG8A);
  LatLngBounds CrNrG8BBounds = LatLngBounds.fromPoints(CrNrG8B);

 LandmarkpolygonBoundsMap['Basketballcourtgr8'] = Basketballcourtgr8Bounds;
 LandmarkpolygonBoundsMap['SwimmingPoolGate'] = SwimmingPoolBounds;
 LandmarkpolygonBoundsMap['SpecialBuildingMain'] = SpecialBuildingMainBounds;
 LandmarkpolygonBoundsMap['SpecialEducBuilding'] = SpecialEducBuildingBounds;
 LandmarkpolygonBoundsMap['SpecialEducBuilding2'] = SpecialEducBuilding2Bounds;
  LandmarkpolygonBoundsMap['DepEd1'] = DepEd1Bounds;
 LandmarkpolygonBoundsMap['DepEd2'] = DepEd2Bounds;
  LandmarkpolygonBoundsMap['DepEdNightHigh1'] = NightHigh1Bounds;
  LandmarkpolygonBoundsMap['DepEdNightHigh2'] = NightHigh2Bounds;
  LandmarkpolygonBoundsMap['DepEdNightHigh3'] = NightHigh3Bounds;
  LandmarkpolygonBoundsMap['ocshsCourt'] = ocshsCourtBounds;
  LandmarkpolygonBoundsMap['ocshsBuildingA'] = ocshsBuildingABounds;
  LandmarkpolygonBoundsMap['ocshsBuildingB'] = ocshsBuildingBBounds;
  LandmarkpolygonBoundsMap['StudentGateGuardHouse'] = StudentGateGuardHouseBounds;
  LandmarkpolygonBoundsMap['WaitingShed'] = WaitingShedBounds;
  LandmarkpolygonBoundsMap['GuardHouse'] = GuardHouseBounds;
  LandmarkpolygonBoundsMap['OldStage'] = OldStageBounds;
  LandmarkpolygonBoundsMap['OldCourt'] = OldCourtBounds;
  LandmarkpolygonBoundsMap['InnerWaitingShed1'] = InnerWaitingShed1Bounds;
  LandmarkpolygonBoundsMap['Coveredcourt'] = CoveredcourtBounds;
  LandmarkpolygonBoundsMap['MaterialRoom'] = MaterialRoomBounds;
  LandmarkpolygonBoundsMap['MainCanteen'] = MainCanteenBounds;
  LandmarkpolygonBoundsMap['grade7Canteen'] = grade7CanteenBounds;
  LandmarkpolygonBoundsMap['G8bldCanteen'] = G8bldCanteenBounds;
  LandmarkpolygonBoundsMap['STECanteen'] = STECanteenBounds;
  LandmarkpolygonBoundsMap['CrNearMainBuilding'] = CrNearMainBuildingBounds;
  LandmarkpolygonBoundsMap['OldStageCR'] = OldStageCRBounds;
  LandmarkpolygonBoundsMap['CR1OldStage'] = CR1OldStageBounds;
  LandmarkpolygonBoundsMap['BesideCoveredCourtCR'] = BesideCoverdCourtCRBounds;
  LandmarkpolygonBoundsMap['CrNearStudentGate'] = CrNearStudentGateBounds;
  LandmarkpolygonBoundsMap['Carpentry_Cr'] = Carpentry_CrBounds;
  LandmarkpolygonBoundsMap['SPS_Cr'] = SPS_CrBounds;
  LandmarkpolygonBoundsMap['CrNrG9'] = CrNrG9Bounds;
  LandmarkpolygonBoundsMap['CrNrG8A'] = CrNrG8ABounds;
  LandmarkpolygonBoundsMap['CrNrG8B'] = CrNrG8BBounds;

  return allPolygons;
}
