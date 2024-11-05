import 'package:latlong2/latlong.dart';
import '1stFlooRoom.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';

//para ni sa tap function 1st floor
List<Polygon> initializeRoomPolygons1(
    Map<String, LatLngBounds> roompolygonBoundsMap) {
  List<LatLng> G7ARoom1Tap = G7ARoom1;
  List<LatLng> G7ARoom2Tap = G7ARoom2;
  // List<LatLng> G7AGroundHallTap = G7AGroundHall;
  List<LatLng> G7ARoom3Tap = G7ARoom3;
  List<LatLng> G7ARoom4Tap = G7ARoom4;
  List<LatLng> G7ARoom5Tap = G7ARoom5;
  List<LatLng> G7ARoom6Tap = G7ARoom6;
  // List<LatLng> G7AStairTap = G7AStair;
  List<LatLng> G7ARoom7Tap = G7ARoom7;
  List<LatLng> G7ARoom8Tap = G7ARoom8;
// Grade 7 B COLUMN 1 Room
  List<LatLng> G7BRoom1Tap = G7BRoom1;
  List<LatLng> G7BRoom2Tap = G7BRoom2;
  // List<LatLng> G7BStairsTap = G7BStairs;
  List<LatLng> G7BRoom3Tap = G7BRoom3;
  List<LatLng> G7BRoom4Tap = G7BRoom4;
// Grade 7 B COLUMN 2 Room
  List<LatLng> G7BRoom5Tap = G7BRoom5;
  List<LatLng> G7BRoom6Tap = G7BRoom6;
  // List<LatLng> G7BGroundHallTap = G7BGroundHall;
  List<LatLng> G7BRoom7Tap = G7BRoom7;
  List<LatLng> G7BRoom8Tap = G7BRoom8;
//GRADE 8 2ND FLOOR Room
  List<LatLng> G82ndFLRoom1Tap = G82ndFLRoom1;
  List<LatLng> G82ndFLRoom2Tap = G82ndFLRoom2;
  List<LatLng> PastryTLEBuildingRoomTap = PastryTLEBuildingRoom;
//GRADE 8 A Room
  List<LatLng> G8bldARoom1Tap = G8bldARoom1;
  List<LatLng> G8bldARoom2Tap = G8bldARoom2;
//GRADE8 B Room
  List<LatLng> G8bldBRoom1Tap = G8bldBRoom1;
  List<LatLng> G8bldBRoom2Tap = G8bldBRoom2;
//GRADE8 C Room
  List<LatLng> G8bldCRoom1Tap = G8bldCRoom1;
  List<LatLng> G8bldCRoom2Tap = G8bldCRoom2;
// GRADE8 D Room
  List<LatLng> G8Room1Tap = G8Room1;
  List<LatLng> G8Rooms2Tap = G8Rooms2;
// GRADE8 E Room
  List<LatLng> G8Room3Tap = G8Room3;
  List<LatLng> G8Room4Tap = G8Room4;
  List<LatLng> G8Room5Tap = G8Room5;
// GRADE8 F Room
  List<LatLng> G8Room6Tap = G8Room6;
  List<LatLng> G8Room7Tap = G8Room7;
  List<LatLng> G8Room8Tap = G8Room8;
// ABS  A Room
  List<LatLng> ABSA_Room1Tap = ABSA_Room1;
  List<LatLng> ABSA_Room2Tap = ABSA_Room2;
  List<LatLng> ABSA_Room3Tap = ABSA_Room3;
  List<LatLng> ABSA_Room4Tap = ABSA_Room4;
// ABS-Building B
  List<LatLng> ABSB_Room1Tap = ABSB_Room1;
  List<LatLng> ABSB_Room2Tap = ABSB_Room2;
  List<LatLng> ABSB_Room3Tap = ABSB_Room3;
  List<LatLng> ABSB_Room4Tap = ABSB_Room4;

// STE A BUILDING /HUNONJH

  List<LatLng> STEA_Room1Tap = STEA_Room1;
  List<LatLng> STEA_Room2Tap = STEA_Room2;
  List<LatLng> STEA_StairsTap = STEA_Stairs;
// STE B BUILDING
  List<LatLng> STEB_R1Tap = STEB_R1;
  List<LatLng> STEB_R2Tap = STEB_R2;
  List<LatLng> STEB_R3Tap = STEB_R3;
  List<LatLng> STEB_STAIRSTap = STEB_STAIRS;

// STE C BUILDING
  List<LatLng> STEC_R1Tap = STEC_R1;
  List<LatLng> STEC_R2Tap = STEC_R2;
  List<LatLng> STEC_R3Tap = STEC_R3;
  List<LatLng> STEC_R4Tap = STEC_R4;
  List<LatLng> STEC_R5Tap = STEC_R5;
  List<LatLng> STEC_STAIR1Tap = STEC_STAIR1;
  List<LatLng> STEC_STAIR2Tap = STEC_STAIR2;

// GREENERY AREA
  List<LatLng> GreeneryA_Room1Tap = GreeneryA_Room1;
  List<LatLng> GreeneryA_Room2Tap = GreeneryA_Room2;
  List<LatLng> GreeneryA_Room3Tap = GreeneryA_Room3;

  List<LatLng> GreeneryB_Room1Tap = GreeneryB_Room1;
  List<LatLng> GreeneryB_Room2Tap = GreeneryB_Room2;
  List<LatLng> GreeneryB_Room3Tap = GreeneryB_Room3;

  List<LatLng> GreeneryC_Room1Tap = GreeneryC_Room1;
  List<LatLng> GreeneryC_Room2Tap = GreeneryC_Room2;

// SWIMMING POOL
  List<LatLng> swimmingPoolRoom1Tap = swimmingPoolRoom1;
  List<LatLng> swimmingPoolRoom2Tap = swimmingPoolRoom2;
  List<LatLng> swimmingPoolRoom3Tap = swimmingPoolRoom3; //END

// GRADE 9 A
  List<LatLng> grade9AClinicTap = grade9AClinic;
  List<LatLng> grade9AOffice1Tap = grade9AOffice1;
  List<LatLng> grade9ARoom1Tap = grade9ARoom1;
  List<LatLng> grade9ARoom2Tap = grade9ARoom2;
  List<LatLng> grade9ARoom3Tap = grade9ARoom3;
  List<LatLng> grade9ARoom4Tap = grade9ARoom4;
  List<LatLng> grade9ARoom5Tap = grade9ARoom5;
  List<LatLng> grade9ARoom6Tap = grade9ARoom6;
  List<LatLng> grade9ARoom7Tap = grade9ARoom7;
  List<LatLng> grade9ARoom8Tap = grade9ARoom8;
  List<LatLng> grade9ARoom9Tap = grade9ARoom9;
  List<LatLng> grade9ARoom10Tap = grade9ARoom10;
  List<LatLng> grade9ARoom11Tap = grade9ARoom11;

// GRADE 9 B
// Building Grade 9 B
  List<LatLng> buildingGrade9BTap = buildingGrade9B;

  // GRADE 9  C
  List<LatLng> grade9BuildingCRoom1Tap = grade9BuildingCRoom1;
  List<LatLng> grade9BuildingCRoom2Tap = grade9BuildingCRoom2;
  List<LatLng> grade9BuildingCRoom3Tap = grade9BuildingCRoom3;
  List<LatLng> grade9BuildingCRoom4Tap = grade9BuildingCRoom4;

  // GRADE 9 D
  //GRADE 9 LAB
  List<LatLng> G9DLAB1Tap = G9DLAB1;
  List<LatLng> G9DLAB2Tap = G9DLAB2;

  // grade 9 E
  List<LatLng> grade9ERoomTap = grade9ERoom;

  // GRADE 9 BUILDING F

  List<LatLng> grade9BuildingFRoom1Tap = grade9BuildingFRoom1;
  List<LatLng> grade9BuildingFRoom2Tap = grade9BuildingFRoom2;
  List<LatLng> grade9BuildingFRoom3Tap = grade9BuildingFRoom3;

  // GRADE 9 G
  List<LatLng> Grade9BuildingG1Tap = Grade9BuildingG1;
  List<LatLng> Grade9BuildingG2Tap = Grade9BuildingG2;
  List<LatLng> Grade9BuildingG3Tap = Grade9BuildingG3;
  // GRADE 9 H
  List<LatLng> Grade_9BuildingHTap = Grade_9BuildingH; //END
  //Carpentry
  List<LatLng> CarpentryStageTap = CarpentryStage;
  List<LatLng> CarpentryATap = CarpentryA;
  // SPS BUILDING
  List<LatLng> SPSroom1Tap = SPSroom1;
  List<LatLng> SPSroom2Tap = SPSroom2;
  List<LatLng> SPSroom3Tap = SPSroom3;
  List<LatLng> SPSroom4Tap = SPSroom4;
  List<LatLng> SPSroom5Tap = SPSroom5;
  List<LatLng> SPSroom6Tap = SPSroom6;
  List<LatLng> SPSroom7Tap = SPSroom7;

  //TLE BUILDING 1
  List<LatLng> tleBuildingARoom1Tap = tleBuildingARoom1;
  List<LatLng> tleBuildingARoom2Tap = tleBuildingARoom2;
  List<LatLng> tleBuildingARoom3Tap = tleBuildingARoom3;
  List<LatLng> tleBuildingARoom4Tap = tleBuildingARoom4;
  //TLE BUILDING 2
  List<LatLng> TLE_BUILDING_2_ROOM_1Tap = TLE_BUILDING_2_ROOM_1;
  List<LatLng> TLE_BUILDING_2_ROOM_2Tap = TLE_BUILDING_2_ROOM_2;
  List<LatLng> TLE_BUILDING_2_ROOM_3Tap = TLE_BUILDING_2_ROOM_3;
  List<LatLng> TLE_BUILDING_2_ROOM_4Tap = TLE_BUILDING_2_ROOM_4;

  // SUPPLY OFFICE BUILDING
  List<LatLng> SOBuildingRoom1Tap = SOBuildingRoom1;
  List<LatLng> SOBuildingRoom2Tap = SOBuildingRoom2;
  List<LatLng> SOBuildingRoom3Tap = SOBuildingRoom3;
  //SUPPLY OFFICE
  // List<LatLng> SupplyOfficeTap = SupplyOffice;

  // GRADE 10 BUILDING W/ 2ND FLOOR
  //List<LatLng> Grade10Buildingwith2ndFloorTap = Grade10Buildingwith2ndFloor; //END

  // TLE CAPRPENTRY A B
  List<LatLng> TLECarpentryBTap = TLECarpentryB;
  //Grade 10 room near guardhouse 2
  List<LatLng> grade10Room1Tap = grade10Room1;
  List<LatLng> grade10Room2Tap = grade10Room2;
  List<LatLng> grade10Room3Tap = grade10Room3;
  List<LatLng> conferenceHallTap = conferenceHall;
  List<LatLng> grade10Room4Tap = grade10Room4;
  List<LatLng> grade10Room5Tap = grade10Room5;
  List<LatLng> grade10Room6Tap = grade10Room6;
  List<LatLng> grade10Room7Tap = grade10Room7;
  // GRADE 10 YELLOW BUILDING
  List<LatLng> GRADE10YELLOW_room1Tap = GRADE10YELLOW_room1;
  List<LatLng> GRADE10YELLOW_room2Tap = GRADE10YELLOW_room2; 
  List<LatLng> Grade10YellowBSPTap = Grade10YellowBSP;
  // // GRADE 10 BUILDING B
  List<LatLng> Grade10BuildingB1Tap = Grade10BuildingB1;
  List<LatLng> Grade10BuildingB2Tap = Grade10BuildingB2;
  //GRADE 10 LAB
  final List<LatLng> GR10LABTap = GR10LAB;
  final List<LatLng> InnerRoom1Tap = InnerRoom1;
  final List<LatLng> InnerRoom2Tap = InnerRoom2;
  final List<LatLng> InnerRoom3Tap = InnerRoom3;
  final List<LatLng> PastryLab1Tap = PastryLab1;
  final List<LatLng> InnerOffice2R1Tap = InnerOffice2R1;
  final List<LatLng> InnerOffice2R2Tap = InnerOffice2R2;
  // SSG OFFICE
  final List<LatLng> ssgofficeTap = ssgoffice;
  final List<LatLng> OfficeTpdSsgTap = OfficeTpdSsg;
  final List<LatLng> PTAOfficeTap = PTAOffice;

  //Main Building
  List<LatLng> principalOfficeTap = principalOffice;
  List<LatLng> guidanceOfficeTap = guidanceOffice;
  List<LatLng> registrarOfficeTap = registrarOffice;
  List<LatLng> complab1Tap = complab1;
  List<LatLng> complab2Tap = complab2;
  List<LatLng> complab3Tap = complab3;
  List<LatLng> libraryTap = library;
  List<LatLng> AVRTap = AVR;
  //SPA  BUILDING ROOMS
  List<LatLng> SPA_room1Tap = SPA_room1; 
  List<LatLng> SPA_room2Tap = SPA_room2;
  List<LatLng> SPA_room3Tap = SPA_room3;
  List<LatLng> SPA_room4Tap = SPA_room4;
  // GRADE 10 4TH FLOOR BUILDING ROOMS
  List<LatLng> G10Building4F_Room1Tap = G10Building4F_Room1;
  List<LatLng> G10Building4F_Room2Tap = G10Building4F_Room2;
  List<LatLng> G10Building4F_Room3Tap = G10Building4F_Room3;
  List<LatLng> G10Building4F_Room4Tap = G10Building4F_Room4;
  //COMFORT ROOMS
  // MAIN BUILDING CR
  List<LatLng> fth_floorcr1Tap = fth_floorcr1;
  List<LatLng> fth_floorcr2Tap = fth_floorcr2;
  List<LatLng> STEA_ComfortRoom1Tap = STEA_ComfortRoom1;
  List<LatLng> STEB_CRTap = STEB_CR;
  List<LatLng> STEC_CRTap = STEC_CR;
  // GRADE 7 CR
  List<LatLng> G7AComfortRoomFemale1Tap = G7AComfortRoomFemale1;
  List<LatLng> G7AComfortRoomMale1Tap = G7AComfortRoomMale1;
  List<LatLng> G7BComfortRoomFemale1Tap = G7BComfortRoomFemale1;
  List<LatLng> G7BComfortRoomTap = G7BComfortRoom;
  //SPA CR
  List<LatLng> SPA_cr1Tap = SPA_cr1;
  List<LatLng> SPA_cr2Tap = SPA_cr2;
  List<LatLng> G10Building4F_Cr1Tap = G10Building4F_Cr1;
  List<LatLng> G10Building4F_Cr2Tap = G10Building4F_Cr2;

  List<Polygon> allPolygons = [
    Polygon(
      points: G7ARoom1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7ARoom2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // Polygon(
    //   points: G7AGroundHallTap,
    //   color: Colors.transparent,
    //   borderStrokeWidth: 0,
    // ),
    Polygon(
      points: G7ARoom3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7ARoom4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7ARoom5Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7ARoom6Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // Polygon(
    //   points: G7AStairTap,
    //   color: Colors.transparent,
    //   borderStrokeWidth: 0,
    // ),
    Polygon(
      points: G7ARoom7Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7ARoom8Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ), // Grade 7 B COLUMN 1 Room
    Polygon(
      points: G7BRoom1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7BRoom2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    //  Polygon(
    //   points: G7BStairsTap,
    //   color: Colors.transparent,
    //   borderStrokeWidth: 0,
    // ),
    Polygon(
      points: G7BRoom3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7BRoom4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7BRoom5Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7BRoom6Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // Polygon(
    //   points: G7BGroundHallTap,
    //   color: Colors.transparent,
    //   borderStrokeWidth: 0,
    // ),
    Polygon(
      points: G7BRoom7Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7BRoom8Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    //GRADE 8 2ND FLOOR Room
    Polygon(
      points: G82ndFLRoom1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G82ndFLRoom2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: PastryTLEBuildingRoomTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // Polygon(
    //   points: G82ndFLRoom2StairsTap,
    //   color: Colors.transparent,
    //   borderStrokeWidth: 0,
    // ),
    //GRADE8 A Room
    Polygon(
      points: G8bldARoom1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G8bldARoom2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    //GRADE8 B Room
    Polygon(
      points: G8bldBRoom1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G8bldBRoom2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
//GRADE8 C Room
    Polygon(
      points: G8bldCRoom1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G8bldCRoom2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
// GRADE8 D Room
    Polygon(
      points: G8Room1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G8Rooms2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
// GRADE8 E Room
    Polygon(
      points: G8Room3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G8Room4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G8Room5Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
// GRADE8 F Room
    Polygon(
      points: G8Room6Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G8Room7Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G8Room8Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
// ABS  A Room
    Polygon(
      points: ABSA_Room1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: ABSA_Room2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: ABSA_Room3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: ABSA_Room4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
// ABS-Building B
    Polygon(
      points: ABSB_Room1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: ABSB_Room2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: ABSB_Room3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: ABSB_Room4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
// STE A BUILDING
    Polygon(
      points: STEA_Room1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEA_Room2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEA_StairsTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
// STE B BUILDING
    Polygon(
      points: STEB_R1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEB_R2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEB_R3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEB_STAIRSTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
// STE C BUILDING
    Polygon(
      points: STEC_R1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEC_R2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEC_R3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEC_R4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEC_R5Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEC_STAIR1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEC_STAIR2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),

    // GREENERY AREA
    Polygon(
      points: GreeneryA_Room1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: GreeneryA_Room2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: GreeneryA_Room3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),

    Polygon(
      points: GreeneryB_Room1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: GreeneryB_Room2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: GreeneryB_Room3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),

    Polygon(
      points: GreeneryC_Room1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: GreeneryC_Room2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),

// SWIMMING POOL
    Polygon(
      points: swimmingPoolRoom1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: swimmingPoolRoom2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: swimmingPoolRoom3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),

// GRADE 9 A
    Polygon(
      points: grade9AClinicTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade9AOffice1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade9ARoom1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade9ARoom2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade9ARoom3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade9ARoom4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade9ARoom5Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade9ARoom6Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade9ARoom7Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade9ARoom8Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade9ARoom9Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade9ARoom10Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade9ARoom11Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
// GRADE 9 B
// Building Grade 9 B
    Polygon(
      points: buildingGrade9BTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),

    // GRADE 9  C
    Polygon(
      points: grade9BuildingCRoom1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade9BuildingCRoom2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),

    Polygon(
      points: grade9BuildingCRoom3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),

    Polygon(
      points: grade9BuildingCRoom4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),

// GRADE 9 D
//GRADE 9 LAB
    Polygon(
      points: G9DLAB1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G9DLAB2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
// grade 9 E
    Polygon(
      points: grade9ERoomTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),

// GRADE 9 BUILDING F

    Polygon(
      points: grade9BuildingFRoom1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade9BuildingFRoom2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade9BuildingFRoom3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
// GRADE 9 G
    Polygon(
      points: Grade9BuildingG1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: Grade9BuildingG2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: Grade9BuildingG3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),

    // GRADE 9 H
    Polygon(
      points: Grade_9BuildingHTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
//Carpentry
    Polygon(
      points: CarpentryStageTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: CarpentryATap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
// SPS BUILDING
    Polygon(
      points: SPSroom1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: SPSroom2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: SPSroom3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: SPSroom4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: SPSroom5Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: SPSroom6Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: SPSroom7Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
//TLE BUILDING 1
    Polygon(
      points: tleBuildingARoom1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: tleBuildingARoom2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: tleBuildingARoom3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: tleBuildingARoom4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
//TLE BUILDING 2

    Polygon(
      points: TLE_BUILDING_2_ROOM_1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: TLE_BUILDING_2_ROOM_2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),

    Polygon(
      points: TLE_BUILDING_2_ROOM_3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),

    Polygon(
      points: TLE_BUILDING_2_ROOM_4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),

// SUPPLY OFFICE BUILDING

    Polygon(
      points: SOBuildingRoom1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: SOBuildingRoom2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: SOBuildingRoom3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
// //SUPPLY OFFICE
// Polygon(
//       points:SupplyOfficeTap,
//       color: Colors.transparent,
//       borderStrokeWidth: 0,
//     ),

// GRADE 10 BUILDING W/ 2ND FLOOR

// Polygon(
//       points:Grade10Buildingwith2ndFloorTap,
//       color: Colors.transparent,
//       borderStrokeWidth: 0,
//     ),
// TLE CAPRPENTRY A B
    Polygon(
      points: TLECarpentryBTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
//Grade 10 room near guardhouse 2
    Polygon(
      points: conferenceHallTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade10Room1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade10Room2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade10Room3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade10Room4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade10Room5Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade10Room6Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: grade10Room7Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
// GRADE 10 YELLOW BUILDING
    Polygon(
      points: GRADE10YELLOW_room1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: GRADE10YELLOW_room2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: Grade10YellowBSPTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
// GRADE 10 BUILDING B
    Polygon(
      points: Grade10BuildingB1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: Grade10BuildingB2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
//GRADE 10 LAB
    Polygon(
      points: GR10LABTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: InnerRoom1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: InnerRoom2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: InnerRoom3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: PastryLab1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: InnerOffice2R1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: InnerOffice2R2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
// SSG OFFICE
    Polygon(
      points: ssgofficeTap,
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

//Main Building
    Polygon(
      points: principalOfficeTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: guidanceOfficeTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: registrarOfficeTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: complab1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: complab2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: complab3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: libraryTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: AVRTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
//SPA  BUILDING ROOMS
    Polygon(
      points: SPA_room1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: SPA_room2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: SPA_room3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: SPA_room4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
// GRADE 10 4TH FLOOR BUILDING ROOMS
    Polygon(
      points: G10Building4F_Room1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G10Building4F_Room2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G10Building4F_Room3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G10Building4F_Room4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
//COMFORT ROOMS
// MAIN BUILDING CR
    Polygon(
      points: fth_floorcr1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: fth_floorcr2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEA_ComfortRoom1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEB_CRTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEC_CRTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
// GRADE 7 CR
    Polygon(
      points: G7AComfortRoomFemale1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7AComfortRoomMale1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7BComfortRoomFemale1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7BComfortRoomTap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: SPA_cr1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: SPA_cr2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G10Building4F_Cr1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G10Building4F_Cr2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
  ];

  // Calculate bounds for each polygon

  LatLngBounds grade7ARoom1Bounds = LatLngBounds.fromPoints(G7ARoom1);
  LatLngBounds grade7ARoom2Bounds = LatLngBounds.fromPoints(G7ARoom2);
  // LatLngBounds G7AGroundHallBounds = LatLngBounds.fromPoints(G7AGroundHall);
  LatLngBounds grade7ARoom3Bounds = LatLngBounds.fromPoints(G7ARoom3);
  LatLngBounds grade7ARoom4Bounds = LatLngBounds.fromPoints(G7ARoom4);
  LatLngBounds grade7ARoom5Bounds = LatLngBounds.fromPoints(G7ARoom5);
  LatLngBounds grade7ARoom6Bounds = LatLngBounds.fromPoints(G7ARoom6);
  // LatLngBounds G7AStairBounds = LatLngBounds.fromPoints(G7AStair);
  LatLngBounds grade7ARoom7Bounds = LatLngBounds.fromPoints(G7ARoom7);
  LatLngBounds grade7ARoom8Bounds = LatLngBounds.fromPoints(G7ARoom8);
  // Grade 7 B COLUMN 1 Room
  LatLngBounds grade7BRoom1Bounds = LatLngBounds.fromPoints(G7BRoom1);
  LatLngBounds grade7BRoom2Bounds = LatLngBounds.fromPoints(G7BRoom2);
  // LatLngBounds G7BStairsBounds = LatLngBounds.fromPoints(G7BStairs);
  LatLngBounds grade7BRoom3Bounds = LatLngBounds.fromPoints(G7BRoom3);
  LatLngBounds grade7BRoom4Bounds = LatLngBounds.fromPoints(G7BRoom4);
  LatLngBounds grade7BRoom5Bounds = LatLngBounds.fromPoints(G7BRoom5);
  LatLngBounds grade7BRoom6Bounds = LatLngBounds.fromPoints(G7BRoom6);
  // LatLngBounds G7BGroundHallBounds = LatLngBounds.fromPoints(G7BGroundHall);
  LatLngBounds grade7BRoom7Bounds = LatLngBounds.fromPoints(G7BRoom7);
  LatLngBounds grade7BRoom8Bounds = LatLngBounds.fromPoints(G7BRoom8);
//GRADE 8 2ND FLOOR Room
  LatLngBounds G82ndFLRoom1Bounds = LatLngBounds.fromPoints(G82ndFLRoom1);
  LatLngBounds G82ndFLRoom2Bounds = LatLngBounds.fromPoints(G82ndFLRoom2);
  LatLngBounds PastryTLEBuildingRoomBounds =
      LatLngBounds.fromPoints(PastryTLEBuildingRoom);
//GRADE8 A Room
  LatLngBounds G8bldARoom1Bounds = LatLngBounds.fromPoints(G8bldARoom1);
  LatLngBounds G8bldARoom2Bounds = LatLngBounds.fromPoints(G8bldARoom2);
//GRADE8 B Room
  LatLngBounds G8bldBRoom1Bounds = LatLngBounds.fromPoints(G8bldBRoom1);
  LatLngBounds G8bldBRoom2Bounds = LatLngBounds.fromPoints(G8bldBRoom2);
//GRADE8 C Room
  LatLngBounds G8bldCRoom1Bounds = LatLngBounds.fromPoints(G8bldCRoom1);
  LatLngBounds G8bldCRoom2Bounds = LatLngBounds.fromPoints(G8bldCRoom2);
// GRADE8 D Room
  LatLngBounds G8Room1Bounds = LatLngBounds.fromPoints(G8Room1);
  LatLngBounds G8Rooms2Bounds = LatLngBounds.fromPoints(G8Rooms2);
  // GRADE8 E Room
  LatLngBounds G8Room3Bounds = LatLngBounds.fromPoints(G8Room3);
  LatLngBounds G8Room4Bounds = LatLngBounds.fromPoints(G8Room4);
  LatLngBounds G8Room5Bounds = LatLngBounds.fromPoints(G8Room5);
  // GRADE8 F Room
  LatLngBounds G8Room6Bounds = LatLngBounds.fromPoints(G8Room6);
  LatLngBounds G8Room7Bounds = LatLngBounds.fromPoints(G8Room7);
  LatLngBounds G8Room8Bounds = LatLngBounds.fromPoints(G8Room8);
// ABS  A Room
  LatLngBounds ABSA_Room1Bounds = LatLngBounds.fromPoints(ABSA_Room1);
  LatLngBounds ABSA_Room2Bounds = LatLngBounds.fromPoints(ABSA_Room2);
  LatLngBounds ABSA_Room3Bounds = LatLngBounds.fromPoints(ABSA_Room3);
  LatLngBounds ABSA_Room4Bounds = LatLngBounds.fromPoints(ABSA_Room4);

// ABS-Building B
  LatLngBounds ABSB_Room1Bounds = LatLngBounds.fromPoints(ABSB_Room1);
  LatLngBounds ABSB_Room2Bounds = LatLngBounds.fromPoints(ABSB_Room2);
  LatLngBounds ABSB_Room3Bounds = LatLngBounds.fromPoints(ABSB_Room3);
  LatLngBounds ABSB_Room4Bounds = LatLngBounds.fromPoints(ABSB_Room4);

// STE A BUILDING
  LatLngBounds STEA_Room1Bounds = LatLngBounds.fromPoints(STEA_Room1);
  LatLngBounds STEA_Room2Bounds = LatLngBounds.fromPoints(STEA_Room2);
  LatLngBounds STEA_StairsBounds = LatLngBounds.fromPoints(STEA_Stairs);

// STE B BUILDING
  LatLngBounds STEB_R1Bounds = LatLngBounds.fromPoints(STEB_R1);
  LatLngBounds STEB_R2Bounds = LatLngBounds.fromPoints(STEB_R2);
  LatLngBounds STEB_R3Bounds = LatLngBounds.fromPoints(STEB_R3);
  LatLngBounds STEB_STAIRSBounds = LatLngBounds.fromPoints(STEB_STAIRS);

// STE C BUILDING
  LatLngBounds STEC_R1Bounds = LatLngBounds.fromPoints(STEC_R1);
  LatLngBounds STEC_R2Bounds = LatLngBounds.fromPoints(STEC_R2);
  LatLngBounds STEC_R3Bounds = LatLngBounds.fromPoints(STEC_R3);
  LatLngBounds STEC_R4Bounds = LatLngBounds.fromPoints(STEC_R4);
  LatLngBounds STEC_R5Bounds = LatLngBounds.fromPoints(STEC_R5);
  LatLngBounds STEC_STAIR1Bounds = LatLngBounds.fromPoints(STEC_STAIR2);
  LatLngBounds STEC_STAIR2Bounds = LatLngBounds.fromPoints(STEC_STAIR2);

// GREENERY AREA
  LatLngBounds GreeneryA_Room1Bounds = LatLngBounds.fromPoints(GreeneryA_Room1);
  LatLngBounds GreeneryA_Room2Bounds = LatLngBounds.fromPoints(GreeneryA_Room2);
  LatLngBounds GreeneryA_Room3Bounds = LatLngBounds.fromPoints(GreeneryA_Room3);

  LatLngBounds GreeneryB_Room1Bounds = LatLngBounds.fromPoints(GreeneryB_Room1);
  LatLngBounds GreeneryB_Room2Bounds = LatLngBounds.fromPoints(GreeneryB_Room2);
  LatLngBounds GreeneryB_Room3Bounds = LatLngBounds.fromPoints(GreeneryB_Room3);

  LatLngBounds GreeneryC_Room1Bounds = LatLngBounds.fromPoints(GreeneryC_Room1);
  LatLngBounds GreeneryC_Room2Bounds = LatLngBounds.fromPoints(GreeneryC_Room2);

// SWIMMING POOL
  LatLngBounds swimmingPoolRoom1Bounds =
      LatLngBounds.fromPoints(swimmingPoolRoom1);
  LatLngBounds swimmingPoolRoom2Bounds =
      LatLngBounds.fromPoints(swimmingPoolRoom2);
  LatLngBounds swimmingPoolRoom3Bounds =
      LatLngBounds.fromPoints(swimmingPoolRoom3);
// GRADE 9 A
  LatLngBounds grade9AClinicBounds = LatLngBounds.fromPoints(grade9AClinic);
  LatLngBounds grade9AOffice1Bounds = LatLngBounds.fromPoints(grade9AOffice1);
  LatLngBounds grade9ARoom1Bounds = LatLngBounds.fromPoints(grade9ARoom1);
  LatLngBounds grade9ARoom2Bounds = LatLngBounds.fromPoints(grade9ARoom2);
  LatLngBounds grade9ARoom3Bounds = LatLngBounds.fromPoints(grade9ARoom3);
  LatLngBounds grade9ARoom4Bounds = LatLngBounds.fromPoints(grade9ARoom4);
  LatLngBounds grade9ARoom5Bounds = LatLngBounds.fromPoints(grade9ARoom5);
  LatLngBounds grade9ARoom6Bounds = LatLngBounds.fromPoints(grade9ARoom6);
  LatLngBounds grade9ARoom7Bounds = LatLngBounds.fromPoints(grade9ARoom7);
  LatLngBounds grade9ARoom8Bounds = LatLngBounds.fromPoints(grade9ARoom8);
  LatLngBounds grade9ARoom9Bounds = LatLngBounds.fromPoints(grade9ARoom9);
  LatLngBounds grade9ARoom10Bounds = LatLngBounds.fromPoints(grade9ARoom10);
  LatLngBounds grade9ARoom11Bounds = LatLngBounds.fromPoints(grade9ARoom11);
// GRADE 9 B
// Building Grade 9 B
  LatLngBounds buildingGrade9BBounds = LatLngBounds.fromPoints(buildingGrade9B);
// GRADE 9  C
  LatLngBounds grade9BuildingCRoom1Bounds =
      LatLngBounds.fromPoints(grade9BuildingCRoom1);
  LatLngBounds grade9BuildingCRoom2Bounds =
      LatLngBounds.fromPoints(grade9BuildingCRoom2);
  LatLngBounds grade9BuildingCRoom3Bounds =
      LatLngBounds.fromPoints(grade9BuildingCRoom3);
  LatLngBounds grade9BuildingCRoom4Bounds =
      LatLngBounds.fromPoints(grade9BuildingCRoom4);
// GRADE 9 D
//GRADE 9 LAB
  LatLngBounds G9DLAB1Bounds = LatLngBounds.fromPoints(G9DLAB1);
  LatLngBounds G9DLAB2Bounds = LatLngBounds.fromPoints(G9DLAB2);
// grade 9 E
  LatLngBounds grade9ERoomBounds = LatLngBounds.fromPoints(grade9ERoom);
// GRADE 9 BUILDING F
  LatLngBounds grade9BuildingFRoom1Bounds =
      LatLngBounds.fromPoints(grade9BuildingFRoom1);
  LatLngBounds grade9BuildingFRoom2Bounds =
      LatLngBounds.fromPoints(grade9BuildingFRoom2);
  LatLngBounds grade9BuildingFRoom3Bounds =
      LatLngBounds.fromPoints(grade9BuildingFRoom3);
// GRADE 9 G
  LatLngBounds Grade9BuildingG1Bounds =
      LatLngBounds.fromPoints(Grade9BuildingG1);
  LatLngBounds Grade9BuildingG2Bounds =
      LatLngBounds.fromPoints(Grade9BuildingG2);
  LatLngBounds Grade9BuildingG3Bounds =
      LatLngBounds.fromPoints(Grade9BuildingG3);
  // GRADE 9 H
  LatLngBounds Grade_9BuildingHBounds =
      LatLngBounds.fromPoints(Grade_9BuildingH);
//Carpentry
  LatLngBounds CarpentryStageBounds = LatLngBounds.fromPoints(CarpentryStage);
  LatLngBounds CarpentryABounds = LatLngBounds.fromPoints(CarpentryA);
// SPS BUILDING
  LatLngBounds SPSroom1Bounds = LatLngBounds.fromPoints(SPSroom1);
  LatLngBounds SPSroom2Bounds = LatLngBounds.fromPoints(SPSroom2);
  LatLngBounds SPSroom3Bounds = LatLngBounds.fromPoints(SPSroom3);
  LatLngBounds SPSroom4Bounds = LatLngBounds.fromPoints(SPSroom4);
  LatLngBounds SPSroom5Bounds = LatLngBounds.fromPoints(SPSroom5);
  LatLngBounds SPSroom6Bounds = LatLngBounds.fromPoints(SPSroom6);
  LatLngBounds SPSroom7Bounds = LatLngBounds.fromPoints(SPSroom7);
//TLE BUILDING 1
  LatLngBounds tleBuildingARoom1Bounds =
      LatLngBounds.fromPoints(tleBuildingARoom1);
  LatLngBounds tleBuildingARoom2Bounds =
      LatLngBounds.fromPoints(tleBuildingARoom2);
  LatLngBounds tleBuildingARoom3Bounds =
      LatLngBounds.fromPoints(tleBuildingARoom3);
  LatLngBounds tleBuildingARoom4Bounds =
      LatLngBounds.fromPoints(tleBuildingARoom4);
//TLE BUILDING 2
  LatLngBounds TLE_BUILDING_2_ROOM_1Bounds =
      LatLngBounds.fromPoints(TLE_BUILDING_2_ROOM_1);
  LatLngBounds TLE_BUILDING_2_ROOM_2Bounds =
      LatLngBounds.fromPoints(TLE_BUILDING_2_ROOM_2);
  LatLngBounds TLE_BUILDING_2_ROOM_3Bounds =
      LatLngBounds.fromPoints(TLE_BUILDING_2_ROOM_3);
  LatLngBounds TLE_BUILDING_2_ROOM_4Bounds =
      LatLngBounds.fromPoints(TLE_BUILDING_2_ROOM_4);
// SUPPLY OFFICE BUILDING
  LatLngBounds SOBuildingRoom1Bounds = LatLngBounds.fromPoints(SOBuildingRoom1);
  LatLngBounds SOBuildingRoom2Bounds = LatLngBounds.fromPoints(SOBuildingRoom2);
  LatLngBounds SOBuildingRoom3Bounds = LatLngBounds.fromPoints(SOBuildingRoom3);
//SUPPLY OFFICE
  // LatLngBounds SupplyOfficeBounds = LatLngBounds.fromPoints(SupplyOffice);

// GRADE 10 BUILDING W/ 2ND FLOOR
  // LatLngBounds Grade10Buildingwith2ndFloorBounds = LatLngBounds.fromPoints(Grade10Buildingwith2ndFloor);
// TLE CAPRPENTRY B
  LatLngBounds TLECarpentryBBounds = LatLngBounds.fromPoints(TLECarpentryB);
//Grade 10 room near guardhouse 2
  LatLngBounds conferenceHallBounds = LatLngBounds.fromPoints(conferenceHall);
  LatLngBounds grade10Room1Bounds = LatLngBounds.fromPoints(grade10Room1);
  LatLngBounds grade10Room2Bounds = LatLngBounds.fromPoints(grade10Room2);
  LatLngBounds grade10Room3Bounds = LatLngBounds.fromPoints(grade10Room3);
  LatLngBounds grade10Room4Bounds = LatLngBounds.fromPoints(grade10Room4);
  LatLngBounds grade10Room5Bounds = LatLngBounds.fromPoints(grade10Room5);
  LatLngBounds grade10Room6Bounds = LatLngBounds.fromPoints(grade10Room6);
  LatLngBounds grade10Room7Bounds = LatLngBounds.fromPoints(grade10Room7);
// GRADE 10 YELLOW BUILDING
  LatLngBounds GRADE10YELLOW_room1Bounds =
      LatLngBounds.fromPoints(GRADE10YELLOW_room1);
  LatLngBounds GRADE10YELLOW_room2Bounds =
      LatLngBounds.fromPoints(GRADE10YELLOW_room2);
  LatLngBounds Grade10YellowBSPBounds =
      LatLngBounds.fromPoints(Grade10YellowBSP);
// GRADE 10 BUILDING B
  LatLngBounds Grade10BuildingB1Bounds =
      LatLngBounds.fromPoints(Grade10BuildingB1);
  LatLngBounds Grade10BuildingB2Bounds =
      LatLngBounds.fromPoints(Grade10BuildingB2);
//GRADE 10 LAB
  LatLngBounds GR10LABBounds = LatLngBounds.fromPoints(GR10LAB);
  LatLngBounds InnerRoom1Bounds = LatLngBounds.fromPoints(InnerRoom1);
  LatLngBounds InnerRoom2Bounds = LatLngBounds.fromPoints(InnerRoom2);
  LatLngBounds InnerRoom3Bounds = LatLngBounds.fromPoints(InnerRoom3);
  LatLngBounds PastryLab1Bounds = LatLngBounds.fromPoints(PastryLab1);
  LatLngBounds InnerOffice2R1Bounds = LatLngBounds.fromPoints(InnerOffice2R1);
  LatLngBounds InnerOffice2R2Bounds = LatLngBounds.fromPoints(InnerOffice2R2);
// SSG OFFICE
  LatLngBounds ssgofficeBounds = LatLngBounds.fromPoints(ssgoffice);
  LatLngBounds OfficeTpdSsgBounds = LatLngBounds.fromPoints(OfficeTpdSsg);
  LatLngBounds PTAOfficeBounds = LatLngBounds.fromPoints(PTAOffice);
//Main Building
  LatLngBounds principalOfficeBounds = LatLngBounds.fromPoints(principalOffice);
  LatLngBounds guidanceOfficeBounds = LatLngBounds.fromPoints(guidanceOffice);
  LatLngBounds registrarOfficeBounds = LatLngBounds.fromPoints(registrarOffice);
  LatLngBounds complab1Bounds = LatLngBounds.fromPoints(complab1);
  LatLngBounds complab2Bounds = LatLngBounds.fromPoints(complab2);
  LatLngBounds complab3Bounds = LatLngBounds.fromPoints(complab3);
  LatLngBounds libraryBounds = LatLngBounds.fromPoints(library);
  LatLngBounds AVRBounds = LatLngBounds.fromPoints(AVR);
  //SPA  BUILDING ROOMS
  LatLngBounds SPA_room1Bounds = LatLngBounds.fromPoints(SPA_room1);
  LatLngBounds SPA_room2Bounds = LatLngBounds.fromPoints(SPA_room2);
  LatLngBounds SPA_room3Bounds = LatLngBounds.fromPoints(SPA_room3);
  LatLngBounds SPA_room4Bounds = LatLngBounds.fromPoints(SPA_room4);
  // GRADE 10 4TH FLOOR BUILDING ROOMS
  LatLngBounds G10Building4F_Room1Bounds =
      LatLngBounds.fromPoints(G10Building4F_Room1);
  LatLngBounds G10Building4F_Room2Bounds =
      LatLngBounds.fromPoints(G10Building4F_Room2);
  LatLngBounds G10Building4F_Room3Bounds =
      LatLngBounds.fromPoints(G10Building4F_Room3);
  LatLngBounds G10Building4F_Room4Bounds =
      LatLngBounds.fromPoints(G10Building4F_Room4);
  //COMFORT ROOMS
  // MAIN BUILDING CR
  LatLngBounds fth_floorcr1Bounds = LatLngBounds.fromPoints(fth_floorcr1);
  LatLngBounds fth_floorcr2Bounds = LatLngBounds.fromPoints(fth_floorcr2);
  LatLngBounds STEA_ComfortRoom1Bounds =
      LatLngBounds.fromPoints(STEA_ComfortRoom1);
  LatLngBounds STEB_CRBounds = LatLngBounds.fromPoints(STEB_CR);
  LatLngBounds STEC_CRBounds = LatLngBounds.fromPoints(STEC_CR);
  // GRADE 7 CR
  LatLngBounds G7AComfortRoomFemale1Bounds =
      LatLngBounds.fromPoints(G7AComfortRoomFemale1);
  LatLngBounds G7AComfortRoomMale1Bounds =
      LatLngBounds.fromPoints(G7AComfortRoomMale1);
  LatLngBounds G7BComfortRoomFemale1Bounds =
      LatLngBounds.fromPoints(G7BComfortRoomFemale1);
  LatLngBounds G7BComfortRoomBounds = LatLngBounds.fromPoints(G7BComfortRoom);
  //SPA CR
  LatLngBounds SPA_cr1Bounds = LatLngBounds.fromPoints(SPA_cr1);
  LatLngBounds SPA_cr2Bounds = LatLngBounds.fromPoints(SPA_cr1);
  // GRADE 10  4TH FLOOR CR
  LatLngBounds G10Building4F_Cr1Bounds =
      LatLngBounds.fromPoints(G10Building4F_Cr1);
  LatLngBounds G10Building4F_Cr2Bounds =
      LatLngBounds.fromPoints(G10Building4F_Cr2);

  //Store bounds in the map with the polygon name as the key
  roompolygonBoundsMap['G7ARoom1'] = grade7ARoom1Bounds;
  roompolygonBoundsMap['G7ARoom2'] = grade7ARoom2Bounds;
  // roompolygonBoundsMap['G7AGroundHall'] = G7AGroundHallBounds;
  roompolygonBoundsMap['G7ARoom3'] = grade7ARoom3Bounds;
  roompolygonBoundsMap['G7ARoom4'] = grade7ARoom4Bounds;
  roompolygonBoundsMap['G7ARoom5'] = grade7ARoom5Bounds;
  roompolygonBoundsMap['G7ARoom6'] = grade7ARoom6Bounds;
  // roompolygonBoundsMap['G7AStair'] = G7AStairBounds;
  roompolygonBoundsMap['G7ARoom7'] = grade7ARoom7Bounds;
  roompolygonBoundsMap['G7ARoom8'] = grade7ARoom8Bounds;
  // Grade 7 B COLUMN 1 Room
  roompolygonBoundsMap['G7BRoom1'] = grade7BRoom1Bounds;
  roompolygonBoundsMap['G7BRoom2'] = grade7BRoom2Bounds;
  // roompolygonBoundsMap['G7BStairs'] = G7BStairsBounds;
  roompolygonBoundsMap['G7BRoom3'] = grade7BRoom3Bounds;
  roompolygonBoundsMap['G7BRoom4'] = grade7BRoom4Bounds;
  roompolygonBoundsMap['G7BRoom5'] = grade7BRoom5Bounds;
  roompolygonBoundsMap['G7BRoom6'] = grade7BRoom6Bounds;
  // roompolygonBoundsMap['G7BGroundHall'] = G7BGroundHallBounds;
  roompolygonBoundsMap['G7BRoom7'] = grade7BRoom7Bounds;
  roompolygonBoundsMap['G7BRoom8'] = grade7BRoom8Bounds;
  roompolygonBoundsMap['G82ndFLRoom1'] = G82ndFLRoom1Bounds;
  roompolygonBoundsMap['G82ndFLRoom2'] = G82ndFLRoom2Bounds;
  roompolygonBoundsMap['PastryTLEBuildingRoom'] = PastryTLEBuildingRoomBounds;
//GRADE8 A Room
  roompolygonBoundsMap['G8bldARoom1'] = G8bldARoom1Bounds;
  roompolygonBoundsMap['G8bldARoom2'] = G8bldARoom2Bounds;
//GRADE8 B Room
  roompolygonBoundsMap['G8bldBRoom1'] = G8bldBRoom1Bounds;
  roompolygonBoundsMap['G8bldBRoom2'] = G8bldBRoom2Bounds;
//GRADE8 C Room
  roompolygonBoundsMap['G8bldCRoom1'] = G8bldCRoom1Bounds;
  roompolygonBoundsMap['G8bldCRoom2'] = G8bldCRoom2Bounds;
// GRADE8 D Room
  roompolygonBoundsMap['G8Room1'] = G8Room1Bounds;
  roompolygonBoundsMap['G8Rooms2'] = G8Rooms2Bounds;
  // GRADE8 E Room
  roompolygonBoundsMap['G8Room3'] = G8Room3Bounds;
  roompolygonBoundsMap['G8Room4'] = G8Room4Bounds;
  roompolygonBoundsMap['G8Room5'] = G8Room5Bounds;
  // GRADE8 F Room
  roompolygonBoundsMap['G8Room6'] = G8Room6Bounds;
  roompolygonBoundsMap['G8Room7'] = G8Room7Bounds;
  roompolygonBoundsMap['G8Room8'] = G8Room8Bounds;
// ABS  A Room
  roompolygonBoundsMap['ABSA_Room1'] = ABSA_Room1Bounds;
  roompolygonBoundsMap['ABSA_Room2'] = ABSA_Room2Bounds;
  roompolygonBoundsMap['ABSA_Room3'] = ABSA_Room3Bounds;
  roompolygonBoundsMap['ABSA_Room4'] = ABSA_Room4Bounds;
// ABS-Building B
  roompolygonBoundsMap['ABSB_Room1'] = ABSB_Room1Bounds;
  roompolygonBoundsMap['ABSB_Room2'] = ABSB_Room2Bounds;
  roompolygonBoundsMap['ABSB_Room3'] = ABSB_Room3Bounds;
  roompolygonBoundsMap['ABSB_Room4'] = ABSB_Room4Bounds;
// STE A BUILDING
  roompolygonBoundsMap['STEA_Room1'] = STEA_Room1Bounds;
  roompolygonBoundsMap['STEA_Room2'] = STEA_Room2Bounds;
  roompolygonBoundsMap['STEA_Stairs'] = STEA_StairsBounds;
// STE B BUILDING
  roompolygonBoundsMap['STEB_R1'] = STEB_R1Bounds;
  roompolygonBoundsMap['STEB_R2'] = STEB_R2Bounds;
  roompolygonBoundsMap['STEB_R3'] = STEB_R3Bounds;
  roompolygonBoundsMap['STEB_STAIRS'] = STEB_STAIRSBounds;

// STE C  BUILDING
  roompolygonBoundsMap['STEC_R1'] = STEC_R1Bounds;
  roompolygonBoundsMap['STEC_R2'] = STEC_R2Bounds;
  roompolygonBoundsMap['STEC_R3'] = STEC_R3Bounds;
  roompolygonBoundsMap['STEC_R4'] = STEC_R4Bounds;
  roompolygonBoundsMap['STEC_R5'] = STEC_R5Bounds;
  roompolygonBoundsMap['STEC_STAIR1'] = STEC_STAIR1Bounds;
  roompolygonBoundsMap['STEC_STAIR2'] = STEC_STAIR2Bounds;

// GREENERY AREA
  roompolygonBoundsMap['GreeneryA_Room1'] = GreeneryA_Room1Bounds;
  roompolygonBoundsMap['GreeneryA_Room2'] = GreeneryA_Room2Bounds;
  roompolygonBoundsMap['GreeneryA_Room3'] = GreeneryA_Room3Bounds;
// GREENERY B
  roompolygonBoundsMap['GreeneryB_Room1'] = GreeneryB_Room1Bounds;
  roompolygonBoundsMap['GreeneryB_Room2'] = GreeneryB_Room2Bounds;
  roompolygonBoundsMap['GreeneryB_Room3'] = GreeneryB_Room3Bounds;
// GREENERY C
  roompolygonBoundsMap['GreeneryC_Room1'] = GreeneryC_Room1Bounds;
  roompolygonBoundsMap['GreeneryC_Room2'] = GreeneryC_Room2Bounds;

// SWIMMING POOL
  roompolygonBoundsMap['swimmingPoolRoom1'] = swimmingPoolRoom1Bounds;
  roompolygonBoundsMap['swimmingPoolRoom2'] = swimmingPoolRoom2Bounds;
  roompolygonBoundsMap['swimmingPoolRoom3'] = swimmingPoolRoom3Bounds;

// GRADE 9 A
  roompolygonBoundsMap['grade9AClinic'] = grade9AClinicBounds;
  roompolygonBoundsMap['grade9AOffice1'] = grade9AOffice1Bounds;
  roompolygonBoundsMap['grade9ARoom1'] = grade9ARoom1Bounds;
  roompolygonBoundsMap['grade9ARoom2'] = grade9ARoom2Bounds;
  roompolygonBoundsMap['grade9ARoom3'] = grade9ARoom3Bounds;
  roompolygonBoundsMap['grade9ARoom4'] = grade9ARoom4Bounds;
  roompolygonBoundsMap['grade9ARoom5'] = grade9ARoom5Bounds;
  roompolygonBoundsMap['grade9ARoom6'] = grade9ARoom6Bounds;
  roompolygonBoundsMap['grade9ARoom7'] = grade9ARoom7Bounds;
  roompolygonBoundsMap['grade9ARoom8'] = grade9ARoom8Bounds;
  roompolygonBoundsMap['grade9ARoom9'] = grade9ARoom9Bounds;
  roompolygonBoundsMap['grade9ARoom10'] = grade9ARoom10Bounds;
  roompolygonBoundsMap['grade9ARoom11'] = grade9ARoom11Bounds;
// GRADE 9 B
// Building Grade 9 B
  roompolygonBoundsMap['buildingGrade9B'] = buildingGrade9BBounds;
// GRADE 9  C
  roompolygonBoundsMap['grade9BuildingCRoom1'] = grade9BuildingCRoom1Bounds;
  roompolygonBoundsMap['grade9BuildingCRoom2'] = grade9BuildingCRoom2Bounds;
  roompolygonBoundsMap['grade9BuildingCRoom3'] = grade9BuildingCRoom3Bounds;
  roompolygonBoundsMap['grade9BuildingCRoom4'] = grade9BuildingCRoom4Bounds;
// GRADE 9 D
//GRADE 9 LAB
  roompolygonBoundsMap['G9DLAB1'] = G9DLAB1Bounds;
  roompolygonBoundsMap['G9DLAB2'] = G9DLAB2Bounds;

// grade 9 E
  roompolygonBoundsMap['grade9ERoom'] = grade9ERoomBounds;

// GRADE 9 BUILDING F
  roompolygonBoundsMap['grade9BuildingFRoom1'] = grade9BuildingFRoom1Bounds;
  roompolygonBoundsMap['grade9BuildingFRoom2'] = grade9BuildingFRoom2Bounds;
  roompolygonBoundsMap['grade9BuildingFRoom3'] = grade9BuildingFRoom3Bounds;
// GRADE 9 G
  roompolygonBoundsMap['Grade9BuildingG1'] = Grade9BuildingG1Bounds;
  roompolygonBoundsMap['Grade9BuildingG2'] = Grade9BuildingG2Bounds;
  roompolygonBoundsMap['Grade9BuildingG3'] = Grade9BuildingG3Bounds;

  // GRADE 9 H
  roompolygonBoundsMap['Grade_9BuildingH'] = Grade_9BuildingHBounds;

//Carpentry
  roompolygonBoundsMap['CarpentryStage'] = CarpentryStageBounds;
  roompolygonBoundsMap['CarpentryA'] = CarpentryABounds;

// SPS BUILDING
  roompolygonBoundsMap['SPSroom1'] = SPSroom1Bounds;
  roompolygonBoundsMap['SPSroom2'] = SPSroom2Bounds;
  roompolygonBoundsMap['SPSroom3'] = SPSroom3Bounds;
  roompolygonBoundsMap['SPSroom4'] = SPSroom4Bounds;
  roompolygonBoundsMap['SPSroom5'] = SPSroom5Bounds;
  roompolygonBoundsMap['SPSroom6'] = SPSroom6Bounds;
  roompolygonBoundsMap['SPSroom7'] = SPSroom7Bounds;

//TLE BUILDING 1
  roompolygonBoundsMap['tleBuildingARoom1'] = tleBuildingARoom1Bounds;
  roompolygonBoundsMap['tleBuildingARoom2'] = tleBuildingARoom2Bounds;
  roompolygonBoundsMap['tleBuildingARoom3'] = tleBuildingARoom3Bounds;
  roompolygonBoundsMap['tleBuildingARoom4'] = tleBuildingARoom4Bounds;

//TLE BUILDING 2
  roompolygonBoundsMap['TLE_BUILDING_2_ROOM_1'] = TLE_BUILDING_2_ROOM_1Bounds;
  roompolygonBoundsMap['TLE_BUILDING_2_ROOM_2'] = TLE_BUILDING_2_ROOM_2Bounds;
  roompolygonBoundsMap['TLE_BUILDING_2_ROOM_3'] = TLE_BUILDING_2_ROOM_3Bounds;
  roompolygonBoundsMap['TLE_BUILDING_2_ROOM_4'] = TLE_BUILDING_2_ROOM_4Bounds;

// SUPPLY OFFICE BUILDING
  roompolygonBoundsMap['SOBuildingRoom1'] = SOBuildingRoom1Bounds;
  roompolygonBoundsMap['SOBuildingRoom2'] = SOBuildingRoom2Bounds;
  roompolygonBoundsMap['SOBuildingRoom3'] = SOBuildingRoom3Bounds;
//SUPPLY OFFICE
//  roompolygonBoundsMap['SupplyOffice'] = SupplyOfficeBounds;

// GRADE 10 BUILDING W/ 2ND FLOOR
//  roompolygonBoundsMap['Grade10Buildingwith2ndFloor'] = Grade10Buildingwith2ndFloorBounds;

// TLE CAPRPENTRY B
  roompolygonBoundsMap['TLECarpentryB'] = TLECarpentryBBounds;
//Grade 10 room near guardhouse 2
  roompolygonBoundsMap['conferenceHall'] = conferenceHallBounds;
  roompolygonBoundsMap['grade10Room1'] = grade10Room1Bounds;
  roompolygonBoundsMap['grade10Room2'] = grade10Room2Bounds;
  roompolygonBoundsMap['grade10Room3'] = grade10Room3Bounds;
  roompolygonBoundsMap['grade10Room4'] = grade10Room4Bounds;
  roompolygonBoundsMap['grade10Room5'] = grade10Room5Bounds;
  roompolygonBoundsMap['grade10Room6'] = grade10Room6Bounds;
  roompolygonBoundsMap['grade10Room7'] = grade10Room7Bounds;
// GRADE 10 YELLOW BUILDING
  roompolygonBoundsMap['GRADE10YELLOW_room1'] = GRADE10YELLOW_room1Bounds;
  roompolygonBoundsMap['GRADE10YELLOW_room2'] = GRADE10YELLOW_room2Bounds;
  roompolygonBoundsMap['Grade10YellowBSP'] = Grade10YellowBSPBounds;
// GRADE 10 BUILDING B
  roompolygonBoundsMap['Grade10BuildingB1'] = Grade10BuildingB1Bounds;
  roompolygonBoundsMap['Grade10BuildingB2'] = Grade10BuildingB2Bounds;
//GRADE 10 LAB
  roompolygonBoundsMap['GR10LAB'] = GR10LABBounds;
  //Gate Rooms
  roompolygonBoundsMap['InnerRoom1'] = InnerRoom1Bounds;
  roompolygonBoundsMap['InnerRoom2'] = InnerRoom2Bounds;
  roompolygonBoundsMap['InnerRoom3'] = InnerRoom3Bounds;
  roompolygonBoundsMap['InnerOffice2R1'] = InnerOffice2R1Bounds;
  roompolygonBoundsMap['InnerOffice2R2'] = InnerOffice2R2Bounds;
  roompolygonBoundsMap['PastryLab1'] = PastryLab1Bounds;
// SSG OFFICE
  roompolygonBoundsMap['ssgoffice'] = ssgofficeBounds;
  roompolygonBoundsMap['OfficeTpdSsg'] = OfficeTpdSsgBounds;
  roompolygonBoundsMap['PTAOffice'] = PTAOfficeBounds;
//Main Building
  roompolygonBoundsMap['principalOffice'] = principalOfficeBounds;
  roompolygonBoundsMap['guidanceOffice'] = guidanceOfficeBounds;
  roompolygonBoundsMap['registrarOffice'] = registrarOfficeBounds;
  roompolygonBoundsMap['complab1'] = complab1Bounds;
  roompolygonBoundsMap['complab2'] = complab2Bounds;
  roompolygonBoundsMap['complab3'] = complab3Bounds;
  roompolygonBoundsMap['library'] = libraryBounds;
  roompolygonBoundsMap['AVR'] = AVRBounds;
//SPA  BUILDING ROOMS
  roompolygonBoundsMap['SPA_room1'] = SPA_room1Bounds;
  roompolygonBoundsMap['SPA_room2'] = SPA_room2Bounds;
  roompolygonBoundsMap['SPA_room3'] = SPA_room3Bounds;
  roompolygonBoundsMap['SPA_room4'] = SPA_room4Bounds;
// GRADE 10 4TH FLOOR BUILDING ROOMS
  roompolygonBoundsMap['G10Building4F_Room1'] = G10Building4F_Room1Bounds;
  roompolygonBoundsMap['G10Building4F_Room2'] = G10Building4F_Room2Bounds;
  roompolygonBoundsMap['G10Building4F_Room3'] = G10Building4F_Room3Bounds;
  roompolygonBoundsMap['G10Building4F_Room4'] = G10Building4F_Room4Bounds;
//COMFORT ROOMS
// MAIN BUILDING CR
  roompolygonBoundsMap['fth_floorcr1'] = fth_floorcr1Bounds;
  roompolygonBoundsMap['fth_floorcr2'] = fth_floorcr2Bounds;
  roompolygonBoundsMap['STEA_ComfortRoom1'] = STEA_ComfortRoom1Bounds;
  roompolygonBoundsMap['STEB_CR'] = STEB_CRBounds;
  roompolygonBoundsMap['STEC_CR'] = STEC_CRBounds;
// GRADE 7 CR
  roompolygonBoundsMap['G7AComfortRoomFemale1'] = G7AComfortRoomFemale1Bounds;
  roompolygonBoundsMap['G7AComfortRoomMale1'] = G7AComfortRoomMale1Bounds;
  roompolygonBoundsMap['G7BComfortRoomFemale1'] = G7BComfortRoomFemale1Bounds;
  roompolygonBoundsMap['G7BComfortRoom'] = G7BComfortRoomBounds;
//SPA CR
  roompolygonBoundsMap['SPA_cr1'] = SPA_cr1Bounds;
  roompolygonBoundsMap['SPA_cr2'] = SPA_cr2Bounds;
// GRADE 10  4TH FLOOR CR
  roompolygonBoundsMap['G10Building4F_Cr1'] = G10Building4F_Cr1Bounds;
  roompolygonBoundsMap['G10Building4F_Cr2'] = G10Building4F_Cr2Bounds;

  return allPolygons;
}
