
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
//import 'package:flutter_openstreetmapnocnhs/icons.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import '1stFlooRoom.dart';
import '2ndFloorRoom.dart';
import '3rdfloorRoom.dart';
import '4thFloorRoom.dart';
import 'Buildings.dart';
import 'Landmarks.dart';
import 'icons.dart';

List<Widget> build_MapLayers(
  MapController mapController,
  List<Marker> _markers,
  List<LatLng> polylines,
  List<Marker> markers,
   List<Marker> tapmarkers,
  List<Polygon> polygons,
    List<Polygon> tap_polygons,
  bool isLayer1Visible,
  bool isLayer2Visible,
  bool isLayer3Visible,
  bool isLayer4Visible,

  // bool _isTapped,
 

) {
  return [
    TileLayer(
      tileProvider: CancellableNetworkTileProvider(),
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
     // subdomains: ['a', 'b', 'c'],
    ),
    // Ensure this returns a LayerOptions or Layer
    createSchoolArea(),
   createMarkers(),
    createGroundFloorLayer(),
    if (isLayer1Visible) createGroundFloorLayer2(),
    if (isLayer2Visible) createGroundFloorLayer3(),
    if (isLayer3Visible) createGroundFloorLayer4(),
    if (isLayer4Visible) createGroundFloorLayer5(),
    // Add other layers if needed
    PolygonLayer(
      polygons: polygons,
    ),
    PolygonLayer(
      polygons: tap_polygons,
    ), // polygons para sa sa gitap tong yellow na mo pop up
    
    MarkerLayer(markers: markers), // markers para sa gisearch
  
         
            
             MarkerLayer(
            markers: _markers, //markers para sa categories
          ),
              MarkerLayer(
            markers: tapmarkers, //markers para sa tap
          ),
         
    
  ];
}
