import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// SPA BUILDING ROOMS
final List <LatLng> SPA_3stairs1 = [
const LatLng (11.0113991, 124.6046542),
const LatLng (11.0113891, 124.6047581),
const LatLng (11.0113663, 124.6047558),
const LatLng (11.0113763, 124.6046519),
];
final List <LatLng> SPA_3room1 = [
const LatLng (11.0113567, 124.6046468),//
const LatLng (11.0113472, 124.6047536),
const LatLng (11.0112752, 124.6047466),
const LatLng (11.0112874, 124.6046405),
];
final List <LatLng> SPA_3room2 = [
const LatLng (11.0112874, 124.6046405),
const LatLng (11.0112755, 124.6047466),
const LatLng (11.0111964, 124.6047382),
const LatLng (11.0112074, 124.6046327),
];
final List <LatLng> SPA_3room3 = [
const LatLng (11.0112074, 124.6046327),
const LatLng (11.0111964, 124.6047382),
const LatLng (11.0111085, 124.6047297),
const LatLng (11.0111228, 124.6046252),
];
final List <LatLng> SPA_3room4 = [
const LatLng (11.0111228, 124.6046252),
const LatLng (11.0111085, 124.6047297),
const LatLng (11.0110137, 124.6047201),
const LatLng (11.0110284, 124.6046161),
];
final List <LatLng> SPA_3stairs2 = [
const LatLng (11.0110064, 124.6046149),
const LatLng (11.010994, 124.6047172),
const LatLng (11.0109715, 124.6047155),
const LatLng (11.0109804, 124.6046109),
];
// GRADE 10 4TH FLOOR BUILDING ROOMS
final List <LatLng> G10Building4F_3Stairs1 = [
const LatLng (11.0112713, 124.6047985),
const LatLng (11.0112633, 124.6048871),
const LatLng (11.0112432, 124.6048857),
const LatLng (11.0112566, 124.6047971),
];
final List <LatLng> G10Building4F_3Stairs2 = [
const LatLng (11.0108804, 124.6047507),
const LatLng (11.0108724, 124.604838),
const LatLng (11.0108456, 124.6048353),
const LatLng (11.0108563, 124.6047453),
];

final List <LatLng> G10Building4F_3Room1 = [
const LatLng (11.0112338, 124.6047957),
const LatLng (11.0112244, 124.6048857),//
const LatLng (11.0111415, 124.6048735),
const LatLng (11.0111562, 124.6047848),
];
final List <LatLng> G10Building4F_3Room2 = [
const LatLng (11.0111562, 124.6047848),
const LatLng (11.0111415, 124.6048735),//
const LatLng (11.0110625, 124.6048626),
const LatLng (11.0110732, 124.6047753),
];
final List <LatLng> G10Building4F_3Room3 = [
const LatLng (11.0110732, 124.6047753),
const LatLng (11.0110625, 124.6048626),//
const LatLng (11.0109768, 124.6048503),
const LatLng (11.0109862, 124.6047644),
];
final List <LatLng> G10Building4F_3Room4 = [
const LatLng (11.0109862, 124.6047644),
const LatLng (11.0109768, 124.6048503),//
const LatLng (11.0108911, 124.6048407),
const LatLng (11.0109045, 124.6047535),
];

//COMFORTROOMS 
final List <LatLng> G10Building4F_3Cr1= [
const LatLng (11.0112566, 124.6047971),
const LatLng (11.0112459, 124.6048585),
const LatLng (11.0112298, 124.6048557),
const LatLng (11.0112338, 124.6047957),
];
final List <LatLng> G10Building4F_3Cr2= [
const LatLng (11.0109045, 124.6047535),
const LatLng (11.0108965, 124.6048066),
const LatLng (11.0108764, 124.6048053),
const LatLng (11.0108804, 124.6047507),
]; 
final List <LatLng> SPA_3cr1 = [
const LatLng (11.0113725, 124.6046867),
const LatLng (11.0113663, 124.6047558),
const LatLng (11.0113472, 124.6047538),
const LatLng (11.0113531, 124.6046862),
];
final List <LatLng> SPA_3cr2 = [
const LatLng (11.0110211, 124.6046592),
const LatLng (11.0110137, 124.6047201),
const LatLng (11.010994, 124.6047172),
const LatLng (11.0110013, 124.6046569),
];

// Function to create the PolygonLayer for all these buildings
PolygonLayer createGroundFloorLayer4() {
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
  final List<List<LatLng>> ThirdLayerPoints = [
SPA_3room1,
SPA_3room2,
SPA_3room3,
SPA_3room4,
G10Building4F_3Room1,
G10Building4F_3Room2,
G10Building4F_3Room3,
G10Building4F_3Room4,


  ];

  // Polygons with similar properties
  final Color ThirdLayerColor = const Color.fromARGB(255, 241, 190, 106);
  final Color ThirdLayerBorderColor = Colors.orange;
  final double borderStrokeWidth = 1.0;

  final List<Polygon> ThirdLayerPolygons = ThirdLayerPoints.map((points) =>
      createPolygon(points, ThirdLayerColor, borderStrokeWidth,
         ThirdLayerBorderColor)).toList();

  // Define the polygons with other similar properties in lists
  final List<List<LatLng>> greyPolygonPoints = [
SPA_3stairs1,
SPA_3stairs2,
G10Building4F_3Stairs1,
G10Building4F_3Stairs2,
  ];

  final List<Polygon> greyPolygons = greyPolygonPoints
      .map((points) => createPolygon(
          points, Colors.grey.withOpacity(0.3), borderStrokeWidth, Colors.grey))
      .toList();

  final List<List<LatLng>> whitePolygonPoints = [
G10Building4F_3Cr1,
G10Building4F_3Cr2,
SPA_3cr1,
SPA_3cr2,
  ];

  final List<Polygon> whitePolygons = whitePolygonPoints
      .map((points) => createPolygon(points, Colors.white.withOpacity(0.3),
          borderStrokeWidth, Colors.white))
      .toList();

  // Combine all polygons in the final layer
  return PolygonLayer(
    polygons: [
      ...ThirdLayerPolygons,
      ...greyPolygons,
      ...whitePolygons,
    ],
  );
}
