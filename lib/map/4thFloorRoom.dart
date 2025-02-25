import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

// GRADE 10 4TH FLOOR BUILDING ROOMS
final List <LatLng> G10Building4F_4Stairs1 = [
const LatLng (11.0112713, 124.6047985),
const LatLng (11.0112633, 124.6048871),
const LatLng (11.0112432, 124.6048857),
const LatLng (11.0112566, 124.6047971),
];
final List <LatLng> G10Building4F_4Stairs2 = [
const LatLng (11.0108804, 124.6047507),
const LatLng (11.0108724, 124.604838),
const LatLng (11.0108456, 124.6048353),
const LatLng (11.0108563, 124.6047453),
];

final List <LatLng> G10Building4F_4Room1 = [
const LatLng (11.0112338, 124.6047957),
const LatLng (11.0112244, 124.6048857),
const LatLng (11.0111415, 124.6048735),
const LatLng (11.0111562, 124.6047848),
];
final List <LatLng> G10Building4F_4Room2 = [
const LatLng (11.0111562, 124.6047848),
const LatLng (11.0111415, 124.6048735),
const LatLng (11.0110625, 124.6048626),
const LatLng (11.0110732, 124.6047753),
];
final List <LatLng> G10Building4F_4Room3 = [
const LatLng (11.0110732, 124.6047753),
const LatLng (11.0110625, 124.6048626),
const LatLng (11.0109768, 124.6048503),
const LatLng (11.0109862, 124.6047644),
];
final List <LatLng> G10Building4F_4Room4 = [
const LatLng (11.0109862, 124.6047644),
const LatLng (11.0109768, 124.6048503),
const LatLng (11.0108911, 124.6048407),
const LatLng (11.0109045, 124.6047535),
];

//COMFORTROOMS  GRADE 10 4TH FLOOR BUILDING 
final List <LatLng> G10Building4F_4Cr1= [
const LatLng (11.0112566, 124.6047971),
const LatLng (11.0112459, 124.6048585),
const LatLng (11.0112298, 124.6048557),
const LatLng (11.0112338, 124.6047957),
];
final List <LatLng> G10Building4F_4Cr2= [
const LatLng (11.0109045, 124.6047535),
const LatLng (11.0108965, 124.6048066),
const LatLng (11.0108764, 124.6048053),
const LatLng (11.0108804, 124.6047507),
]; 
final List<LatLng> FOURTH_FLOOR_LEFT = [
  LatLng(11.010848, 124.6048145),
  LatLng(11.0108749, 124.6048162),
  LatLng(11.0108775, 124.6048032),
  LatLng(11.0108494, 124.6047998),
  LatLng(11.0108513, 124.6047815),
  LatLng(11.0108804, 124.6047835),
  LatLng(11.0108806, 124.6047729),
  LatLng(11.0108532, 124.60477),
];


final List<LatLng> FOURTH_FLOOR_RIGHT_ROOM = [
  LatLng(11.0112546,124.6047981),
  LatLng(11.0112732, 124.6048013),
  LatLng(11.0112704, 124.6048176),
  LatLng(11.0112523,124.6048138),
  LatLng(11.0112508,124.6048289),
  LatLng(11.0112662, 124.6048311),
  LatLng(11.0112643, 124.604847),
  LatLng(11.0112484,124.6048461),
  LatLng(11.0112453,124.6048616),
  LatLng(11.0112638, 124.6048628),
  LatLng(11.0112624, 124.6048773),
  LatLng(11.0112441,124.6048751),
];

// Function to create the PolygonLayer for all these buildings
PolygonLayer createGroundFloorLayer5() {
  Polygon createPolygon(List<LatLng> points, Color color,
      double borderStrokeWidth, Color borderColor) {
    return Polygon(
      points: points,
      color: color,
      borderStrokeWidth: borderStrokeWidth,
      borderColor: borderColor,
    );
  }

  // Create a list of points for similar polygons
  final List<List<LatLng>> FourthLayerPoints = [
G10Building4F_4Room1,
G10Building4F_4Room2,
G10Building4F_4Room3,
G10Building4F_4Room4,
  ];

  // Polygons with similar properties
  final Color FourthLayerColor = const Color.fromARGB(255, 174, 203, 129);
  final Color FourthLayerBorderColor = Colors.green;
  final double borderStrokeWidth = 1.0;

  final List<Polygon> FourthLayerPolygons = FourthLayerPoints.map((points) =>
      createPolygon(points, FourthLayerColor, borderStrokeWidth,
         FourthLayerBorderColor)).toList();

  // Define the polygons with other similar properties in lists
  final List<List<LatLng>> greyPolygonPoints = [
// G10Building4F_4Stairs1,
// G10Building4F_4Stairs2,
FOURTH_FLOOR_RIGHT_ROOM,
//LGU2_STAIRS_BOX,
FOURTH_FLOOR_LEFT,
  ];

  final List<Polygon> greyPolygons = greyPolygonPoints
      .map((points) => createPolygon(
          points, Colors.grey.withOpacity(0.5), borderStrokeWidth, Colors.grey))
      .toList();

  final List<List<LatLng>> whitePolygonPoints = [
G10Building4F_4Cr1,
G10Building4F_4Cr2,
  ];

  final List<Polygon> whitePolygons = whitePolygonPoints
      .map((points) => createPolygon(points, Colors.white.withOpacity(0.9),
          borderStrokeWidth, Colors.grey))
      .toList();

  // Combine all polygons in the final layer
  return PolygonLayer(
    polygons: [
     
      ...greyPolygons,
       ...FourthLayerPolygons,
      ...whitePolygons,
    ],
  );
}
