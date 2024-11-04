import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
//import 'Landmarks.dart';


//main gate
final List<LatLng> Tree1 = [
  const LatLng(11.0120734, 124.6047402),
];
//student gate
final List<LatLng> Tree2 = [
  const LatLng(11.011902, 124.603884),
];
final List<LatLng> Tree3 = [
  const LatLng(11.0115616, 124.6047049),
];

final List<LatLng> flagPole = [
  const LatLng(11.0117732, 124.6046028),
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
        point: Tree1[0],
        child: const Icon(
          Icons.fence, // Tree icon
          color: Color.fromARGB(255, 82, 82, 82),
          size: 20.0,
        ),
      ),
      // Tree 2 Marker
      Marker(
        width: 40.0,
        height: 40.0,
        point: Tree2[0],
        child: const Icon(
          Icons.fence_outlined, // Tree icon
          color: Color.fromARGB(255, 82, 82, 82),
          size: 20.0,
        ),
      ),
      
      // // Tree 3 Marker
      // Marker(
      //   width: 40.0,
      //   height: 40.0,
      //   point: Tree3[0],
      //   child: const Icon(
      //     Icons.nature, // Tree icon
      //     color: Colors.green,
      //     size: 30.0,
      //   ),
      // ),
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


