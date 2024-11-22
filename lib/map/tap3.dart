import 'package:latlong2/latlong.dart';
import '2ndFloorRoom.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';

//para ni sa tap function 2ND floor
List<Polygon> initializeRoomPolygons2(
    Map<String, LatLngBounds> roompolygon2BoundsMap) {
  // Grade 7 A COLUMN 1 Room
  List<LatLng> G7A2Room1Tap = G7A2Room1;
  List<LatLng> G7A2Room2Tap = G7A2Room2;
  List<LatLng> G7A2Room3Tap = G7A2Room3;
  List<LatLng> G7A2Room4Tap = G7A2Room4;
  List<LatLng> G7A2Room5Tap = G7A2Room5;
  List<LatLng> G7A2Room6Tap = G7A2Room6;
  List<LatLng> G7A2Room7Tap = G7A2Room7;
  List<LatLng> G7A2Room8Tap = G7A2Room8; 
  List<LatLng> G7A2Room9Tap = G7A2Room9;
  // Grade 7 B COLUMN 1 Room
  List<LatLng> G7B2Room1Tap = G7B2Room1;
  List<LatLng> G7B2Room2Tap = G7B2Room2;
  List<LatLng> G7B2Room3Tap = G7B2Room3;
  List<LatLng> G7B2Room4Tap = G7B2Room4;
  List<LatLng> G7B2Room5Tap = G7B2Room5;
  List<LatLng> G7B2Room6Tap = G7B2Room6;
  List<LatLng> G7B2Room7Tap = G7B2Room7;
  List<LatLng> G7B2Room8Tap = G7B2Room8;
  List<LatLng> G7B2Room9Tap = G7B2Room9;
  //GRADE 8 2ND FLOOR
  List<LatLng> G82ndFL2Room1Tap = G82ndFL2Room1;
  List<LatLng> G82ndFL2Room2Tap = G82ndFL2Room2;
  // SPA  BUILDING ROOMS
  List<LatLng> SPA_2room1Tap = SPA_2room1;
  List<LatLng> SPA_2room2Tap = SPA_2room2;
  List<LatLng> SPA_2room3Tap = SPA_2room3;
  List<LatLng> SPA_2room4Tap = SPA_2room4;
  // GRADE 10 YELLOW BUILDING 
  List<LatLng> GRADE10YELLOW_2room1Tap = GRADE10YELLOW_2room1;
  List<LatLng> GRADE10YELLOW_2room2Tap = GRADE10YELLOW_2room2;
  // GRADE 10 4TH FLOOR BUILDING ROOMS
  List<LatLng> G10Building4F_2Room1Tap = G10Building4F_2Room1;
  List<LatLng> G10Building4F_2Room2Tap = G10Building4F_2Room2;
  List<LatLng> G10Building4F_2Room3Tap = G10Building4F_2Room3;
  List<LatLng> G10Building4F_2Room4Tap = G10Building4F_2Room4;
  //COMFORTROOMS 
  // List<LatLng> G10Building4F_2Cr1Tap = G10Building4F_2Cr1;
  // List<LatLng> G10Building4F_2Cr2Tap = G10Building4F_2Cr2;
  // // SPA CR
  // List<LatLng> SPA_2cr1Tap = SPA_2cr1;
  // List<LatLng> SPA_2cr2Tap = SPA_2cr2;
  // // GRADE 10 YELLOW BUILDING CR
  // List<LatLng> CRGrade10YellowBuilding2ndFloor2Tap = CRGrade10YellowBuilding2ndFloor2;
  // List<LatLng> CRGR10YELLOWBUILDING2Tap = CRGR10YELLOWBUILDING2;
  // STE A BUILDING
  List<LatLng> STEA_2Room1Tap = STEA_2Room1;
  List<LatLng> STEA_2Room2Tap = STEA_2Room2;
  // STE B BUILDING
  List<LatLng> STEB_2R1Tap = STEB_2R1;
  List<LatLng> STEB_2R2Tap = STEB_2R2;
  List<LatLng> STEB_2R3Tap = STEB_2R3;
  // STE C BUILDING 
  List<LatLng> STEC_2R1Tap = STEC_2R1;
  List<LatLng> STEC_2R2Tap = STEC_2R2;
  List<LatLng> STEC_2R3Tap = STEC_2R3;
  List<LatLng> STEC_2R4Tap = STEC_2R4;
  List<LatLng> STEC_2R5Tap = STEC_2R5;
 

  List<Polygon> allPolygons = [
    // Grade 7 A COLUMN 1 Room
    Polygon(
      points: G7A2Room1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7A2Room2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7A2Room3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7A2Room4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7A2Room5Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7A2Room6Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7A2Room7Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7A2Room8Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ), 
 Polygon(
      points: G7A2Room9Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ), 
    // Grade 7 B COLUMN 1 Room
    Polygon(
      points: G7B2Room1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7B2Room2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7B2Room3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7B2Room4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7B2Room5Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7B2Room6Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7B2Room7Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G7B2Room8Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
     Polygon(
      points: G7B2Room9Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),

    //GRADE 8 2ND FLOOR
    Polygon(
      points: G82ndFL2Room1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G82ndFL2Room2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // SPA  BUILDING ROOMS
    Polygon(
      points: SPA_2room1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
     Polygon(
      points: SPA_2room2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
     Polygon(
      points: SPA_2room3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
     Polygon(
      points: SPA_2room4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // GRADE 10 YELLOW BUILDING 
     Polygon(
      points: GRADE10YELLOW_2room1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
     Polygon(
      points: GRADE10YELLOW_2room2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // GRADE 10 4TH FLOOR BUILDING ROOMS
     Polygon(
      points: G10Building4F_2Room1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G10Building4F_2Room2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
     Polygon(
      points: G10Building4F_2Room3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G10Building4F_2Room4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    //COMFORTROOMS
    // Polygon(
    //   points: G10Building4F_2Cr1Tap,
    //   color: Colors.transparent,
    //   borderStrokeWidth: 0,
    // ),
    // Polygon(
    //   points: G10Building4F_2Cr2Tap,
    //   color: Colors.transparent,
    //   borderStrokeWidth: 0,
    // ),
    // // SPA CR
    // Polygon(
    //   points: SPA_2cr1Tap,
    //   color: Colors.transparent,
    //   borderStrokeWidth: 0,
    // ),
    // Polygon(
    //   points: SPA_2cr2Tap,
    //   color: Colors.transparent,
    //   borderStrokeWidth: 0,
    // ),
    // GRADE 10 YELLOW BUILDING CR
    // Polygon(
    //   points: CRGrade10YellowBuilding2ndFloor2Tap,
    //   color: Colors.transparent,
    //   borderStrokeWidth: 0,
    // ),
    // Polygon(
    //   points: CRGR10YELLOWBUILDING2Tap,
    //   color: Colors.transparent,
    //   borderStrokeWidth: 0,
    // ),
    // STE A BUILDING
    Polygon(
      points: STEA_2Room1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEA_2Room2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // STE B BUILDING
    Polygon(
      points: STEB_2R1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEB_2R2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEB_2R3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // STE C BUILDING 
    Polygon(
      points: STEC_2R1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEC_2R2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEC_2R3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEC_2R4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: STEC_2R5Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),

  ];


  // Calculate bounds for each polygon
  // Grade 7 A COLUMN 1 Room
  LatLngBounds G7A2Room1Bounds = LatLngBounds.fromPoints(G7A2Room1);
  LatLngBounds G7A2Room2Bounds = LatLngBounds.fromPoints(G7A2Room2);
  LatLngBounds G7A2Room3Bounds = LatLngBounds.fromPoints(G7A2Room3);
  LatLngBounds G7A2Room4Bounds = LatLngBounds.fromPoints(G7A2Room4);
  LatLngBounds G7A2Room5Bounds = LatLngBounds.fromPoints(G7A2Room5);
  LatLngBounds G7A2Room6Bounds = LatLngBounds.fromPoints(G7A2Room6);
  LatLngBounds G7A2Room7Bounds = LatLngBounds.fromPoints(G7A2Room7);
  LatLngBounds G7A2Room8Bounds = LatLngBounds.fromPoints(G7A2Room8); 
LatLngBounds G7A2Room9Bounds = LatLngBounds.fromPoints(G7A2Room9);
  // Grade 7 B COLUMN 1 Room
  LatLngBounds G7B2Room1Bounds = LatLngBounds.fromPoints(G7B2Room1);
  LatLngBounds G7B2Room2Bounds = LatLngBounds.fromPoints(G7B2Room2);
  LatLngBounds G7B2Room3Bounds = LatLngBounds.fromPoints(G7B2Room3);
  LatLngBounds G7B2Room4Bounds = LatLngBounds.fromPoints(G7B2Room4);
  LatLngBounds G7B2Room5Bounds = LatLngBounds.fromPoints(G7B2Room5);
  LatLngBounds G7B2Room6Bounds = LatLngBounds.fromPoints(G7B2Room6);
  LatLngBounds G7B2Room7Bounds = LatLngBounds.fromPoints(G7B2Room7);
  LatLngBounds G7B2Room8Bounds = LatLngBounds.fromPoints(G7B2Room8); 
 LatLngBounds G7B2Room9Bounds = LatLngBounds.fromPoints(G7B2Room9);

  LatLngBounds G82ndFL2Room1Bounds = LatLngBounds.fromPoints(G82ndFL2Room1);
  LatLngBounds G82ndFL2Room2Bounds = LatLngBounds.fromPoints(G82ndFL2Room2);
  // SPA  BUILDING ROOMS
  LatLngBounds SPA_2room1Bounds = LatLngBounds.fromPoints(SPA_2room1);
  LatLngBounds SPA_2room2Bounds = LatLngBounds.fromPoints(SPA_2room2);
  LatLngBounds SPA_2room3Bounds = LatLngBounds.fromPoints(SPA_2room3);
  LatLngBounds SPA_2room4Bounds = LatLngBounds.fromPoints(SPA_2room4);
  // GRADE 10 YELLOW BUILDING 
  LatLngBounds GRADE10YELLOW_2room1Bounds = LatLngBounds.fromPoints(GRADE10YELLOW_2room1);
  LatLngBounds GRADE10YELLOW_2room2Bounds = LatLngBounds.fromPoints(GRADE10YELLOW_2room2);
  // GRADE 10 4TH FLOOR BUILDING ROOMS
  LatLngBounds G10Building4F_2Room1Bounds = LatLngBounds.fromPoints(G10Building4F_2Room1);
  LatLngBounds G10Building4F_2Room2Bounds = LatLngBounds.fromPoints(G10Building4F_2Room2);
  LatLngBounds G10Building4F_2Room3Bounds = LatLngBounds.fromPoints(G10Building4F_2Room3);
  LatLngBounds G10Building4F_2Room4Bounds = LatLngBounds.fromPoints(G10Building4F_2Room4);
  //COMFORTROOMS 
  // LatLngBounds G10Building4F_2Cr1Bounds = LatLngBounds.fromPoints(G10Building4F_2Cr1);
  // LatLngBounds G10Building4F_2Cr2Bounds = LatLngBounds.fromPoints(G10Building4F_2Cr2);
  // // SPA CR
  // LatLngBounds SPA_2cr1Bounds = LatLngBounds.fromPoints(SPA_2cr1);
  // LatLngBounds SPA_2cr2Bounds = LatLngBounds.fromPoints(SPA_2cr2);
  // GRADE 10 YELLOW BUILDING CR
  //LatLngBounds CRGrade10YellowBuilding2ndFloor2Bounds = LatLngBounds.fromPoints(CRGrade10YellowBuilding2ndFloor2);
  //LatLngBounds CRGR10YELLOWBUILDING2Bounds = LatLngBounds.fromPoints(CRGR10YELLOWBUILDING2);
  // STE A BUILDING
  LatLngBounds STEA_2Room1Bounds = LatLngBounds.fromPoints(STEA_2Room1);
  LatLngBounds STEA_2Room2Bounds = LatLngBounds.fromPoints(STEA_2Room2);
  // STE B BUILDING
  LatLngBounds STEB_2R1Bounds = LatLngBounds.fromPoints(STEB_2R1);
  LatLngBounds STEB_2R2Bounds = LatLngBounds.fromPoints(STEB_2R2);
  LatLngBounds STEB_2R3Bounds = LatLngBounds.fromPoints(STEB_2R3);
  // STE C BUILDING 
  LatLngBounds STEC_2R1Bounds = LatLngBounds.fromPoints(STEC_2R1);
  LatLngBounds STEC_2R2Bounds = LatLngBounds.fromPoints(STEC_2R2);
  LatLngBounds STEC_2R3Bounds = LatLngBounds.fromPoints(STEC_2R3);
  LatLngBounds STEC_2R4Bounds = LatLngBounds.fromPoints(STEC_2R4);
  LatLngBounds STEC_2R5Bounds = LatLngBounds.fromPoints(STEC_2R5);
 

  //Store bounds in the map with the polygon name as the key
  // Grade 7 A COLUMN 1 Room
  
  roompolygon2BoundsMap['G7A2Room1'] = G7A2Room1Bounds;
  roompolygon2BoundsMap['G7A2Room2'] = G7A2Room2Bounds;
  roompolygon2BoundsMap['G7A2Room3'] = G7A2Room3Bounds;
  roompolygon2BoundsMap['G7A2Room4'] = G7A2Room4Bounds;
  roompolygon2BoundsMap['G7A2Room5'] = G7A2Room5Bounds;
  roompolygon2BoundsMap['G7A2Room6'] = G7A2Room6Bounds;
  roompolygon2BoundsMap['G7A2Room7'] = G7A2Room7Bounds;
  roompolygon2BoundsMap['G7A2Room8'] = G7A2Room8Bounds;  
  roompolygon2BoundsMap['G7A2Room9'] = G7A2Room9Bounds; 
  // Grade 7 B COLUMN 1 Room
  roompolygon2BoundsMap['G7B2Room1'] = G7B2Room1Bounds;
  roompolygon2BoundsMap['G7B2Room2'] = G7B2Room2Bounds;
  roompolygon2BoundsMap['G7B2Room3'] = G7B2Room3Bounds;
  roompolygon2BoundsMap['G7B2Room4'] = G7B2Room4Bounds;
  roompolygon2BoundsMap['G7B2Room5'] = G7B2Room5Bounds;
  roompolygon2BoundsMap['G7B2Room6'] = G7B2Room6Bounds;
  roompolygon2BoundsMap['G7B2Room7'] = G7B2Room7Bounds;
  roompolygon2BoundsMap['G7B2Room8'] = G7B2Room8Bounds;
    roompolygon2BoundsMap['G7B2Room9'] = G7B2Room9Bounds;
  // GRADE 8 A COLUMN 1 ROOM
  roompolygon2BoundsMap['G82ndFL2Room1'] = G82ndFL2Room1Bounds;
  roompolygon2BoundsMap['G82ndFL2Room2'] = G82ndFL2Room2Bounds;
  // SPA  BUILDING ROOMS
  roompolygon2BoundsMap['SPA_2room1'] = SPA_2room1Bounds;
  roompolygon2BoundsMap['SPA_2room2'] = SPA_2room2Bounds;
  roompolygon2BoundsMap['SPA_2room3'] = SPA_2room3Bounds;
  roompolygon2BoundsMap['SPA_2room4'] = SPA_2room4Bounds;
  // GRADE 10 YELLOW BUILDING 
  roompolygon2BoundsMap['GRADE10YELLOW_2room1'] = GRADE10YELLOW_2room1Bounds;
  roompolygon2BoundsMap['GRADE10YELLOW_2room2'] = GRADE10YELLOW_2room2Bounds;
  // GRADE 10 4TH FLOOR BUILDING ROOMS
  roompolygon2BoundsMap['G10Building4F_2Room1'] = G10Building4F_2Room1Bounds;
  roompolygon2BoundsMap['G10Building4F_2Room2'] = G10Building4F_2Room2Bounds;
  roompolygon2BoundsMap['G10Building4F_2Room3'] = G10Building4F_2Room3Bounds;
  roompolygon2BoundsMap['G10Building4F_2Room4'] = G10Building4F_2Room4Bounds;
  //COMFORTROOMS 
  // roompolygon2BoundsMap['G10Building4F_2Cr1'] = G10Building4F_2Cr1Bounds;
  // roompolygon2BoundsMap['G10Building4F_2Cr2'] = G10Building4F_2Cr2Bounds;
  // // SPA CR
  // roompolygon2BoundsMap['SPA_2cr1'] = SPA_2cr1Bounds;
  // roompolygon2BoundsMap['SPA_2cr2'] = SPA_2cr2Bounds;
  // // GRADE 10 YELLOW BUILDING CR
  // roompolygon2BoundsMap['CRGrade10YellowBuilding2ndFloor2'] = CRGrade10YellowBuilding2ndFloor2Bounds;
  //roompolygon2BoundsMap['CRGR10YELLOWBUILDING2'] = CRGR10YELLOWBUILDING2Bounds;
  // STE A BUILDING
  roompolygon2BoundsMap['STEA_2Room1'] = STEA_2Room1Bounds;
  roompolygon2BoundsMap['STEA_2Room2'] = STEA_2Room2Bounds;
  // STE B BUILDING
  roompolygon2BoundsMap['STEB_2R1'] = STEB_2R1Bounds;
  roompolygon2BoundsMap['STEB_2R2'] = STEB_2R2Bounds;
  roompolygon2BoundsMap['STEB_2R3'] = STEB_2R3Bounds;
  // STE C BUILDING 
  roompolygon2BoundsMap['STEC_2R1'] = STEC_2R1Bounds;
  roompolygon2BoundsMap['STEC_2R2'] = STEC_2R2Bounds;
  roompolygon2BoundsMap['STEC_2R3'] = STEC_2R3Bounds;
  roompolygon2BoundsMap['STEC_2R4'] = STEC_2R4Bounds;
  roompolygon2BoundsMap['STEC_2R5'] = STEC_2R5Bounds;

  return allPolygons;
}
