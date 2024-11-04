import 'package:latlong2/latlong.dart';
import 'Landmarks.dart';
List<LatLng> getLandmarkPolygonForLandmark(String polygonName) {
  switch (polygonName) {
    case 'SwimmingPoolGate':
      return SwimmingPoolGate;
    case 'Coveredcourt':
      return Coveredcourt;
    // case 'Basketballcourtgr8':
    //   return Basketballcourtgr8;
    default:
      return [];
  }
}
