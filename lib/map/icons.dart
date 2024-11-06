import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'Landmarks.dart';

//main gate
final List<LatLng> MainGate = [
  const LatLng(11.012073, 124.60474),
];
//student gate
final List<LatLng> STUDENTGATE = [
  const LatLng(11.011902, 124.603884),
];
final List<LatLng> ACACIA = [
  const LatLng(11.011599, 124.604801),
];

final List<LatLng> flagPole = [
  const LatLng(11.0117732, 124.6046028),
];
// final List<LatLng> ACACIA = [
//   const LatLng(11.011433, 124.603243),
// ];
//student gate
final List<LatLng> DEPEDGATE = [
  const LatLng(11.011436, 124.603238),
];
final List<LatLng> OCSHSGATE = [
  const LatLng(11.011834, 124.605845),
];
//ICONS FOR TREES AND FLAGPOLE
//DI PA MUGANA HAHAHAHHA
MarkerLayer createMarkers() {
  return MarkerLayer(
    markers: [
      // Tree 1 Marker
      Marker(
        width: 40.0,
        height: 40.0,
        point: MainGate[0],
        child: const Icon(
          Icons.fence_outlined, // Tree icon
          color: Color.fromARGB(255, 82, 82, 82),
          size: 20.0,
        ),
      ),
      // Tree 2 Marker
      Marker(
        width: 40.0,
        height: 40.0,
        point: STUDENTGATE[0],
        child: const Icon(
          Icons.fence_outlined, // Tree icon
          color: Color.fromARGB(255, 82, 82, 82),
          size: 20.0,
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: DEPEDGATE[0],
        child: const Icon(
          Icons.fence_outlined, // Tree icon
          color: Color.fromARGB(255, 82, 82, 82),
          size: 20.0,
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: OCSHSGATE[0],
        child: const Icon(
          Icons.fence_outlined, // Tree icon
          color: Color.fromARGB(255, 82, 82, 82),
          size: 20.0,
        ),
      ),

      // // Tree 3 Marker
      Marker(
        width: 40.0,
        height: 40.0,
        point: ACACIA[0],
        child: const Icon(
          Icons.nature, // Tree icon
          color: Colors.green,
          size: 20.0,
        ),
      ),
      // Flagpole Marker
      Marker(
        width: 40.0,
        height: 40.0,
        point: flagPole[0],
        child: const Icon(
          Icons.flag, // Flagpole icon
          color: Colors.blue,
          size: 20.0,
        ),
      ),
    ],
  );
}
