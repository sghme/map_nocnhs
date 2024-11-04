import 'package:latlong2/latlong.dart';
import '3rdfloorRoom.dart';
import '4thFloorRoom.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
//para ni sa tap na function for 3rd floor
List<Polygon> initializeRoomPolygons3(
    Map<String, LatLngBounds> roompolygon3BoundsMap) {
  // SPA BUILDING ROOMS
  List<LatLng> SPA_3room1Tap = SPA_3room1;
  List<LatLng> SPA_3room2Tap = SPA_3room2;
  List<LatLng> SPA_3room3Tap = SPA_3room3;
  List<LatLng> SPA_3room4Tap = SPA_3room4;
  // GRADE 10 4TH FLOOR BUILDING ROOMS
  List<LatLng> G10Building4F_3Room1Tap = G10Building4F_3Room1;
  List<LatLng> G10Building4F_3Room2Tap = G10Building4F_3Room2;
  List<LatLng> G10Building4F_3Room3Tap = G10Building4F_3Room3;
  List<LatLng> G10Building4F_3Room4Tap = G10Building4F_3Room4;
  //COMFORTROOMS 
  List<LatLng> G10Building4F_3Cr1Tap = G10Building4F_3Cr1;
  List<LatLng> G10Building4F_3Cr2Tap = G10Building4F_3Cr2;
  // SPA CR
  List<LatLng> SPA_3cr1Tap = SPA_3cr1;
  List<LatLng> SPA_3cr2Tap = SPA_3cr2;





  List<Polygon> allPolygons = [
    // SPA BUILDING ROOMS
    Polygon(
      points: SPA_3room1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
     Polygon(
      points: SPA_3room2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
     Polygon(
      points: SPA_3room3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
     Polygon(
      points: SPA_3room4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // GRADE 10 4TH FLOOR BUILDING ROOMS
     Polygon(
      points: G10Building4F_3Room1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G10Building4F_3Room2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
     Polygon(
      points: G10Building4F_3Room3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G10Building4F_3Room4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // GRADE 10 4TH FLOOR BUILDING CRROOMS
    Polygon(
      points: G10Building4F_3Cr1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G10Building4F_3Cr2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // SPA CR
    Polygon(
      points: SPA_3cr1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: SPA_3cr2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
  ];
  // Calculate bounds for each polygon
  // SPA BUILDING ROOMS
  LatLngBounds SPA_3room1Bounds = LatLngBounds.fromPoints(SPA_3room1);
  LatLngBounds SPA_3room2Bounds = LatLngBounds.fromPoints(SPA_3room2);
  LatLngBounds SPA_3room3Bounds = LatLngBounds.fromPoints(SPA_3room3);
  LatLngBounds SPA_3room4Bounds = LatLngBounds.fromPoints(SPA_3room4);
  // GRADE 10 4TH FLOOR BUILDING ROOMS
  LatLngBounds G10Building4F_3Room1Bounds = LatLngBounds.fromPoints(G10Building4F_3Room1);
  LatLngBounds G10Building4F_3Room2Bounds = LatLngBounds.fromPoints(G10Building4F_3Room2);
  LatLngBounds G10Building4F_3Room3Bounds = LatLngBounds.fromPoints(G10Building4F_3Room3);
  LatLngBounds G10Building4F_3Room4Bounds = LatLngBounds.fromPoints(G10Building4F_3Room4);
  // GRADE 10 4TH FLOOR BUILDING CRROOMS
  LatLngBounds G10Building4F_3Cr1Bounds = LatLngBounds.fromPoints(G10Building4F_3Cr1);
  LatLngBounds G10Building4F_3Cr2Bounds = LatLngBounds.fromPoints(G10Building4F_3Cr2);
  // SPA CR
  LatLngBounds SPA_3cr1Bounds = LatLngBounds.fromPoints(SPA_3cr1);
  LatLngBounds SPA_3cr2Bounds = LatLngBounds.fromPoints(SPA_3cr2);





  //Store bounds in the map with the polygon name as the key
  // SPA  BUILDING ROOMS
  roompolygon3BoundsMap['SPA_3room1'] = SPA_3room1Bounds;
  roompolygon3BoundsMap['SPA_3room2'] = SPA_3room2Bounds;
  roompolygon3BoundsMap['SPA_3room3'] = SPA_3room3Bounds;
  roompolygon3BoundsMap['SPA_3room4'] = SPA_3room4Bounds;
  // GRADE 10 4TH FLOOR BUILDING ROOMS
  roompolygon3BoundsMap['G10Building4F_3Room1'] = G10Building4F_3Room1Bounds;
  roompolygon3BoundsMap['G10Building4F_3Room2'] = G10Building4F_3Room2Bounds;
  roompolygon3BoundsMap['G10Building4F_3Room3'] = G10Building4F_3Room3Bounds;
  roompolygon3BoundsMap['G10Building4F_3Room4'] = G10Building4F_3Room4Bounds;
  //COMFORTROOMS 
  roompolygon3BoundsMap['G10Building4F_3Cr1'] = G10Building4F_3Cr1Bounds;
  roompolygon3BoundsMap['G10Building4F_3Cr2'] = G10Building4F_3Cr2Bounds;
  // SPA CR
  roompolygon3BoundsMap['SPA_3cr1'] = SPA_3cr1Bounds;
  roompolygon3BoundsMap['SPA_3cr2'] = SPA_3cr2Bounds;

  return allPolygons;
}
List<Polygon> initializeRoomPolygons4(
    Map<String, LatLngBounds> roompolygon4BoundsMap) {
   // GRADE 10 4TH FLOOR BUILDING ROOMS
  List<LatLng> G10Building4F_4Room1Tap = G10Building4F_4Room1;
  List<LatLng> G10Building4F_4Room2Tap = G10Building4F_4Room2;
  List<LatLng> G10Building4F_4Room3Tap = G10Building4F_4Room3;
  List<LatLng> G10Building4F_4Room4Tap = G10Building4F_4Room4;
  //COMFORTROOMS 
  List<LatLng> G10Building4F_4Cr1Tap = G10Building4F_4Cr1;
  List<LatLng> G10Building4F_4Cr2Tap = G10Building4F_4Cr2;



  List<Polygon> allPolygons = [
    // GRADE 10 4TH FLOOR BUILDING ROOMS
     Polygon(
      points: G10Building4F_4Room1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G10Building4F_4Room2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
     Polygon(
      points: G10Building4F_4Room3Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G10Building4F_4Room4Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    // GRADE 10 4TH FLOOR BUILDING CRROOMS
    Polygon(
      points: G10Building4F_4Cr1Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
    Polygon(
      points: G10Building4F_4Cr2Tap,
      color: Colors.transparent,
      borderStrokeWidth: 0,
    ),
  ];
  // Calculate bounds for each polygon

 // GRADE 10 4TH FLOOR BUILDING ROOMS
  LatLngBounds G10Building4F_4Room1Bounds = LatLngBounds.fromPoints(G10Building4F_4Room1);
  LatLngBounds G10Building4F_4Room2Bounds = LatLngBounds.fromPoints(G10Building4F_4Room2);
  LatLngBounds G10Building4F_4Room3Bounds = LatLngBounds.fromPoints(G10Building4F_4Room3);
  LatLngBounds G10Building4F_4Room4Bounds = LatLngBounds.fromPoints(G10Building4F_4Room4);
  // GRADE 10 4TH FLOOR BUILDING CRROOMS
  LatLngBounds G10Building4F_4Cr1Bounds = LatLngBounds.fromPoints(G10Building4F_4Cr1);
  LatLngBounds G10Building4F_4Cr2Bounds = LatLngBounds.fromPoints(G10Building4F_4Cr2);
  

  //Store bounds in the map with the polygon name as the key
  // GRADE 10 4TH FLOOR BUILDING ROOMS
  roompolygon4BoundsMap['G10Building4F_4Room1'] = G10Building4F_4Room1Bounds;
  roompolygon4BoundsMap['G10Building4F_4Room2'] = G10Building4F_4Room2Bounds;
  roompolygon4BoundsMap['G10Building4F_4Room3'] = G10Building4F_4Room3Bounds;
  roompolygon4BoundsMap['G10Building4F_4Room4'] = G10Building4F_4Room4Bounds;
  //COMFORTROOMS 
  roompolygon4BoundsMap['G10Building4F_4Cr1'] = G10Building4F_4Cr1Bounds;
  roompolygon4BoundsMap['G10Building4F_4Cr2'] = G10Building4F_4Cr2Bounds;

  return allPolygons;
}

