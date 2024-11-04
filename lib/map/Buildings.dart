import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

//BASKETBALL AREA
final List<LatLng> Basketballcourtgr8 = [
  const LatLng(11.0112138, 124.6042188),
  const LatLng(11.0111995, 124.6043667), //
  const LatLng(11.01110067, 124.6043546),
  const LatLng(11.0109861, 124.6043364),
  const LatLng(11.0110067, 124.6041872),
];
final List<LatLng> BbcStand1 = [
  const LatLng(11.0112130, 124.604273),
  const LatLng(11.0112085, 124.6043073),
  const LatLng(11.011193, 124.6042976),
  const LatLng(11.0111954, 124.6042809),
];
final List<LatLng> BbcRing1 = [
  const LatLng(11.0111927, 124.6042973),
  const LatLng(11.0111859, 124.6043049),
  const LatLng(11.0111775, 124.6043073),
  const LatLng(11.011168, 124.6043058),
  const LatLng(11.0111618, 124.6042976),
  const LatLng(11.0111612, 124.6042843),
  const LatLng(11.0111612, 124.6042843),
  const LatLng(11.0111653, 124.6042743),
  const LatLng(11.0111763, 124.6042694),
  const LatLng(11.0111879, 124.6042727),
  const LatLng(11.0111954, 124.6042809),
];
final List<LatLng> BbcStand2 = [
  const LatLng(11.0110201, 124.6042615),
  const LatLng(11.0110192, 124.6042752),
  const LatLng(11.0109945, 124.6042852),
  const LatLng(11.010999, 124.6042439),
];
final List<LatLng> BbcRing2 = [
  const LatLng(11.0110192, 124.6042752),
  const LatLng(11.0110201, 124.6042615),
  const LatLng(11.0110261, 124.6042524),
  const LatLng(11.0110377, 124.6042497),
  const LatLng(11.0110508, 124.6042533),
  const LatLng(11.0110564, 124.6042649),
  const LatLng(11.0110555, 124.6042773),
  const LatLng(11.0110509, 124.6042858),
  const LatLng(11.0110421, 124.6042902),
  const LatLng(11.0110332, 124.6042909),
  const LatLng(11.0110238, 124.6042858),
];
// Grade 7 Building A
final List<LatLng> grade7BuildingA = [
  const LatLng(11.010692, 124.6047882), //
  const LatLng(11.010668, 124.6051788),
  const LatLng(11.0104856, 124.6051672),
  const LatLng(11.01051, 124.6047765),
];

// Grade 7 Building B
final List<LatLng> grade7BuildingB = [
  const LatLng(11.0104997, 124.6046855), //
  const LatLng(11.0104626, 124.6050595),
  const LatLng(11.0102898, 124.6050417),
  const LatLng(11.0103269, 124.6046677),
];

// ABS-Building A
final List<LatLng> absBuildingA = [
  const LatLng(11.0102962, 124.6046502), //
  const LatLng(11.0102692, 124.6049994),
  const LatLng(11.0101742, 124.6049961),
  const LatLng(11.0101961, 124.604646),
];

// ABS-Building B
final List<LatLng> absBuildingB = [
  const LatLng(11.0101736, 124.6046509), //
  const LatLng(11.0101579, 124.6049735),
  const LatLng(11.0100625, 124.6049713),
  const LatLng(11.010086, 124.6046445),
];

// STE A
final List<LatLng> steA = [
  const LatLng(11.0101108, 124.6045652),
  const LatLng(11.0099807, 124.6047313),
  const LatLng(11.0098953, 124.6046661),
  const LatLng(11.0100262, 124.6044954), //
];

// STE B
final List<LatLng> steB = [
  const LatLng(11.0100435, 124.6048188),
  const LatLng(11.009979, 124.6049068),
  const LatLng(11.009717, 124.6047111),
  const LatLng(11.0097787, 124.6046175),//
];

// STE C
final List<LatLng> steC = [
  const LatLng(11.0098774, 124.6042597),
  const LatLng(11.0099509, 124.6043129),//
  const LatLng(11.009664, 124.6047097),
  const LatLng(11.0095904, 124.6046565),
];

// Green A
final List<LatLng> greenA = [
  const LatLng(11.0107614, 124.6045753),
  const LatLng(11.0107567, 124.604663),
  const LatLng(11.0109587, 124.6046744),
  const LatLng(11.0109635, 124.6045867),//
];

// Greenery B
final List<LatLng> greeneryB = [
  const LatLng(11.0105492, 124.6045339),//
  const LatLng(11.0105395, 124.6046038),
  const LatLng(11.0103084, 124.6045707),
  const LatLng(11.0103181, 124.6045007),
];

// Greenery C
final List<LatLng> greeneryC = [
  const LatLng(11.010306, 124.6044705), //
  const LatLng(11.0102933, 124.604562),
  const LatLng(11.0101639, 124.6045434),
  const LatLng(11.0101765, 124.6044519),
];
final List<LatLng> Grade104FBuilding = [ //diri
  const LatLng(11.0112724, 124.6048009),//
  const LatLng(11.0112586, 124.6049137), 
  const LatLng(11.0108417, 124.6048609),
  const LatLng(11.0108555, 124.604748),
];
// Building Swimming Pool
final List<LatLng> buildingSwimmingpool = [
  const LatLng(11.0102579, 124.6042735),
  const LatLng(11.0105126, 124.6043748),
  const LatLng(11.0104825, 124.6044535), //v
  const LatLng(11.0102277, 124.6043523),
];
// Building Grade 9 A
final List<LatLng> buildingGrade9A = [
  const LatLng(11.0114419, 124.6047948),//
  const LatLng(11.0113509, 124.6047945),
  const LatLng(11.0113486, 124.6056636),
  const LatLng(11.0114436, 124.6056648),
];

// Building Grade 9 B
final List<LatLng> buildingGrade9B = [
  const LatLng(11.0116088, 124.6051829),
  const LatLng(11.0116089, 124.6052845),
  const LatLng(11.0115087, 124.6052822),
  const LatLng(11.0115094, 124.6051815),//
];

// Grade 9  C
final List<LatLng> grade9BuildingC = [
  const LatLng(11.0116049, 124.6053209),
  const LatLng(11.0116088, 124.605669),
  const LatLng(11.0115173, 124.6056686),
  const LatLng(11.0115124, 124.6053209), //
];
// Grade 9  D
final List<LatLng> G9Lab1 = [
  const LatLng(11.0116004, 124.6057432),//
  const LatLng(11.0115866, 124.6059154),
  const LatLng(11.0115241, 124.6059121),
  const LatLng(11.0115363, 124.6057361),
];

// Grade 9 E
final List<LatLng> grade9BuildingE = [
  const LatLng(11.0116964, 124.606065),
  const LatLng(11.0116889, 124.6061489),
  const LatLng(11.011614, 124.6061424),
  const LatLng(11.0116198, 124.6060585),//
];
// Grade 9  F
final List<LatLng> Grade9BuildingF = [
  LatLng(11.0117133, 124.6059008),
  LatLng(11.0116868, 124.6060531),
  LatLng(11.0116136, 124.6060412),
  LatLng(11.0116412, 124.6058889), //
];
// Grade 9  G
final List<LatLng> Grade9BuildingG = [
  const LatLng(11.0117931, 124.6055574),
  const LatLng(11.0117557, 124.605751),
  const LatLng(11.0116548, 124.6057308),
  const LatLng(11.0116922, 124.6055372), //
];
// GRADE 9 H
final List<LatLng> Grade_9BuildingH = [ //diri
  const LatLng(11.0118649, 124.6054563),
  const LatLng(11.0118465, 124.6055482),
  const LatLng(11.0117621, 124.6055305), 
  const LatLng(11.0117805, 124.6054387), //okay na
];
// SPS
final List<LatLng> SPSBuilding = [
  const LatLng(11.0113447, 124.6044237),
  const LatLng(11.011333, 124.6045176), //
  const LatLng(11.0107804, 124.6044502),
  const LatLng(11.0107923, 124.6043538),
];
// GRADE 8 2ND FLOOR
final List<LatLng> Grade8Building2ndfloor = [
  const LatLng(11.0112846, 124.6040902),
  const LatLng(11.0112714, 124.6041956),
  const LatLng(11.0110649, 124.604170), //v
  const LatLng(11.0110799, 124.6040613),
];
// PASTRY TLE
final List<LatLng> PastryTLEBuilding = [
  const LatLng(11.0113625, 124.6042018),
  const LatLng(11.0113498, 124.6043549), //
  const LatLng(11.011236, 124.60435),
  const LatLng(11.011244, 124.6041961),
];
//  CARPENTRY STAGE
final List<LatLng> CarpentryStage = [
  LatLng(11.0109231, 124.6040754),
  LatLng(11.0108934, 124.6041402),
  LatLng(11.0108471, 124.6041184),
  LatLng(11.0108765, 124.6040529),//
];
// CARPENTRY A

final List<LatLng> CarpentryTLEA = [ //diri kutob
  const LatLng(11.0108889, 124.6041597),
  const LatLng(11.0108778, 124.6042371),
  const LatLng(11.0108306, 124.6042296),
  const LatLng(11.0108415, 124.6041508),//
];
// GRADE 8 A
final List<LatLng> Grade8BuildingA = [
  const LatLng(11.0109456, 124.603967),
  const LatLng(11.011064, 124.6040832),
  const LatLng(11.0110111, 124.6041391),
  const LatLng(11.0108927, 124.604023), //
];
// GRADE 8 B
final List<LatLng> Grade8BuildingB = [
  const LatLng(11.0103139, 124.6038497), //
  const LatLng(11.0102673, 124.6039054),
  const LatLng(11.010183, 124.6038323),
  const LatLng(11.0102296, 124.6037766),
];
final List<LatLng> Grade8BuildingC = [
  const LatLng(11.0100482, 124.6035891),
  const LatLng(11.0101689, 124.603703), //
  const LatLng(11.0101019, 124.6037766),
  const LatLng(11.0099812, 124.6036627),
];
final List<LatLng> Grade8BuildingD = [
  const LatLng(11.0102368, 124.6034723),
  const LatLng(11.0102725, 124.6035576),
  const LatLng(11.0101251, 124.6036216), //
  const LatLng(11.0100894, 124.6035364),
];
final List<LatLng> Grade8BuildingE = [
  const LatLng(11.0104775, 124.6033826),
  const LatLng(11.0105059, 124.603467),
  const LatLng(11.0102951, 124.6035405), //
  const LatLng(11.0102667, 124.6034562),
];
final List<LatLng> Grade8BuildingF = [ //kutob diri
  const LatLng(11.0106977, 124.6033201),
  const LatLng(11.0107295, 124.6034025),
  const LatLng(11.0105181, 124.6034668), //
  const LatLng(11.0104924, 124.6033807),
];
final List<LatLng> TLEBuildingA = [
  const LatLng(11.0116826, 124.6040905),
  const LatLng(11.01161, 124.6041486), //
  const LatLng(11.0113926, 124.6038776),
  const LatLng(11.011473, 124.603814),
];
final List<LatLng> TLEBuildingB = [
  const LatLng(11.0112766, 124.6035774),
  const LatLng(11.0114549, 124.6037975),
  const LatLng(11.011376, 124.6038596), //
  const LatLng(11.0111986, 124.6036367),
];

final List<LatLng> Grade10Buildingwith2ndFloor = [
  const LatLng(11.01134, 124.603904),
  const LatLng(11.0114763, 124.6040838), //
  const LatLng(11.0113807, 124.6041589),
  const LatLng(11.0112445, 124.6039792),
];
//SUPPLY OFFICE
final List<LatLng> SupplyOfficeBuilding = [
  const LatLng(11.0118065, 124.6042336),
  const LatLng(11.0117249, 124.6042952), //
  const LatLng(11.0116215, 124.6041615), 
  const LatLng(11.011702, 124.6040954),
];

final List<LatLng> TLECarpentryB = [
  const LatLng(11.0119348, 124.6042973),
  const LatLng(11.0118847, 124.6043346),
  const LatLng(11.0118391, 124.6042709), //
  const LatLng(11.0118913, 124.6042326),
];
//Grade 10 room near guardhouse 2
final List<LatLng> Grade10BuildingA = [
  const LatLng(11.0114955, 124.6035588),
  const LatLng(11.0119572, 124.6041568), //
  const LatLng(11.0118468, 124.6042336),
  const LatLng(11.0113917, 124.6036442),
];
final List<LatLng> Grade10BuildingB = [
  const LatLng(11.0112319, 124.603983), //
  const LatLng(11.0111465, 124.6040509),
  const LatLng(11.0109996, 124.6038525),
  const LatLng(11.01108862, 124.603786),
];
//GRADE 10 LAB
final List<LatLng> Grade10LabCanteen = [ //kutob diri
  LatLng(11.0107206, 124.6045395), //
  LatLng(11.0107115, 124.6046267),
  LatLng(11.0106354, 124.6046226),
  LatLng(11.0106433, 124.6045344),
];
final List<LatLng> SPA_Building = [
  LatLng(11.0114016, 124.6046294), //
  LatLng(11.0113891, 124.6047581),
  LatLng(11.0109705, 124.6047139),
  LatLng(11.010983, 124.6045871),
];
//OFFICES beside waiting shed
final List<LatLng> InnerWaitingShedBuilding = [
  LatLng(11.0120719, 124.604684),
  LatLng(11.0120364, 124.604678), //
  LatLng(11.0120554, 124.6045861),
  LatLng(11.0120915, 124.6045917),
];
final List<LatLng> BesideInnerWaitingShed = [
  LatLng(11.0120911, 124.6045843),
  LatLng(11.0120562, 124.6045782),
  LatLng(11.0120844, 124.6044406), //v
  LatLng(11.0121196, 124.6044471),
];
final List<LatLng> PastryLab = [ //kutob ari
  LatLng(11.0121216, 124.604435),
  LatLng(11.0120897, 124.6044291), //v
  LatLng(11.012109, 124.6043291),
  LatLng(11.0121398, 124.6043351),
];
final List<LatLng> ssgoffice = [
  LatLng(11.0119919, 124.6048044),//
  LatLng(11.0120405, 124.604814),
  LatLng(11.0120302, 124.604858),
  LatLng(11.0119818, 124.6048482),
];
final List<LatLng> OfficeTpdSsg = [
  LatLng(11.0119009, 124.6047622),
  LatLng(11.0119581, 124.6047751), //
  LatLng(11.0119443, 124.6048394),
  LatLng(11.0118876, 124.604827),
];

final List<LatLng> PTAOffice = [
  LatLng(11.0117912, 124.6047395), //
  LatLng(11.0118511, 124.6047525),
  LatLng(11.0118383, 124.6048162),
  LatLng(11.0117782, 124.6048021),
];
final List<LatLng> Mainbuilding = [
  const LatLng(11.0120455, 124.6044041),
  const LatLng(11.0119848, 124.604689), //
  const LatLng(11.0118395, 124.6046515),
  const LatLng(11.0118744, 124.6044978),
  const LatLng(11.0116776, 124.604451),
  const LatLng(11.0116481, 124.6045934),
  const LatLng(11.0115304, 124.604569),
  const LatLng(11.0115893, 124.6043048),
];
// final List <LatLng> Office_1 = [
// LatLng (11.0119876, 124.6047807),
// LatLng (11.0119777, 124.6048313),
// LatLng (11.0119241, 124.6048218),
// LatLng (11.0119334, 124.6047698),
// ];
// final List <LatLng> Office_2 = [
// LatLng (11.0118556, 124.6047533),
// LatLng (11.011846, 124.604802),
// LatLng (11.0117825, 124.6047889),
// LatLng (11.0117928, 124.6047397),
// ];

// final Map<String, List<LatLng>> buildingPolygons = {
//   "Grade 7 Building A": grade7BuildingA,
//   "Grade 7 Building B": grade7BuildingB,
//   // "Grade 7 Canteen": grade7Canteen,
//   "ABS Building A": absBuildingA,
//   "ABS Building B": absBuildingB,
//   "STE A": steA,
//   "STE B": steB,
//   "STE C": steC,
//   "Green A": greenA,
//   "Greenery B": greeneryB,
//   "Greenery C": greeneryC,
//   "Grade 10 Building Last": Grade104FBuilding,
//   "Building Swimming Pool": buildingSwimmingpool,
//   "Building Grade 9 A": buildingGrade9A,
//   "Building Grade 9 B": buildingGrade9B,
//   "Grade 9 Building C": grade9BuildingC,
//   "Grade 9 Lab 1": G9Lab1,
//   "Grade 9 Building E": grade9BuildingE,
//   "Grade 9 Building F": Grade9BuildingF,
//   "Grade 9 Building G": Grade9BuildingG,
//   "Grade 9 Building H" : Grade_9BuildingH,
//   "SPS Building": SPSBuilding,
//   "Grade 8 Building 2nd Floor": Grade8Building2ndfloor,
//   "Pastry TLE A": CarpentryTLEA,
//   "Grade 8 Building A": Grade8BuildingA,
//   "Carpentry TLE A": CarpentryTLEA,
//   "Grade 8 Building B": Grade8BuildingB,
//   "Grade 8 Building C": Grade8BuildingC,
//   "Grade 8 Building D": Grade8BuildingD,
//   "Grade 8 Building E": Grade8BuildingE,
//    "Grade 8 Building F": Grade8BuildingF,
//   "TLE Building B": TLEBuildingB,
//   "TLE Building A": TLEBuildingA,
//   "Grade 10 Building with 2nd Floor": Grade10Buildingwith2ndFloor,
//   "Supply Office": SupplyOfficeBuilding,
//   "TLE Carpentry B": TLECarpentryB,
//   "Grade 10 Building A": Grade10BuildingA,
//   "Grade 10 Building B": Grade10BuildingB,
//   "Grade 10 Lab":  Grade10LabCanteen,
//   "SPA Building":SPA_Building,
//   "OfficeTpdSsg": OfficeTpdSsg,
//   "PTA Office": PTAOffice,
//   "Main Building": Mainbuilding,
//   "SSG Office": ssgoffice,

// };
// final Map<String, LatLng> buildingMarkers = {
//   "Grade 7 Building A": const LatLng(11.0111, 124.6041),
//   "Grade 7 Building B": const LatLng(11.0112, 124.6042),
//   // Add more buildings and their coordinates here
// };
// Function to create the PolygonLayer for all these buildings
PolygonLayer createGroundFloorLayer() {
  return PolygonLayer(
    polygons: [
      Polygon(
        points: Basketballcourtgr8,
        color: const Color.fromARGB(148, 224, 221, 219),
        borderStrokeWidth: 1.0,
        borderColor: Colors.black38,
      ),

      Polygon(
        points: BbcStand1,
        color: const Color.fromARGB(148, 224, 221, 219),
        borderStrokeWidth: 1.0,
        borderColor: Colors.black38,
      ),
      Polygon(
        points: BbcRing1,
        color: const Color.fromARGB(148, 224, 221, 219),
        borderStrokeWidth: 1.0,
        borderColor: Colors.black38,
      ),
      Polygon(
        points: BbcStand2,
        color: const Color.fromARGB(148, 224, 221, 219),
        borderStrokeWidth: 1.0,
        borderColor: Colors.black38,
      ),
      Polygon(
        points: BbcRing2,
        color: const Color.fromARGB(148, 224, 221, 219),
        borderStrokeWidth: 1.0,
        borderColor: Colors.black38,
      ),
      Polygon(
        points: grade7BuildingA,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      Polygon(
        points: grade7BuildingB,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      Polygon(
        points: absBuildingA,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      Polygon(
        points: absBuildingB,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      Polygon(
        points: steA,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      Polygon(
        points: steB,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      Polygon(
        points: steC,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      Polygon(
        points: greenA,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      Polygon(
        points: greeneryB,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      Polygon(
        points: greeneryC,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      Polygon(
        points: Grade104FBuilding,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      Polygon(
        points: buildingSwimmingpool,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // GRADE 9 A
      Polygon(
        points: buildingGrade9A,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // GRADE 9 B
      Polygon(
        points: buildingGrade9B,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // GRADE 9 C
      Polygon(
        points: grade9BuildingC,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),

      // GRADE 9 D
      Polygon(
        points: G9Lab1,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // GRADE 9 E
      Polygon(
        points: grade9BuildingE,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // GRADE 9 F
      Polygon(
        points: Grade9BuildingF,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // GRADE 9 G
      Polygon(
        points: Grade9BuildingG,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // GRADE 9 H
      Polygon(
        points: Grade_9BuildingH,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // SPS
      Polygon(
        points: SPSBuilding,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // GRADE 8 2ND FLOOR
      Polygon(
        points: Grade8Building2ndfloor,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // GRADE 8 A
      Polygon(
        points: Grade8BuildingA,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // GRADE 8 B
      Polygon(
        points: Grade8BuildingB,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // GRADE 8 C
      Polygon(
        points: Grade8BuildingC,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // GRADE 8 D
      Polygon(
        points: Grade8BuildingD,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // GRADE 8 E
      Polygon(
        points: Grade8BuildingE,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // GRADE 8 F
      Polygon(
        points: Grade8BuildingF,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // GRADE 10 A
      Polygon(
        points: Grade10BuildingA,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // GRADE 10 B
      Polygon(
        points: Grade10BuildingB,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // GRADE 10 LAB
      Polygon(
        points: Grade10LabCanteen,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // GRADE 10 2ND FLOOR
      Polygon(
        points: Grade10Buildingwith2ndFloor,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // TLE A
      Polygon(
        points: TLEBuildingA,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // TLE B
      Polygon(
        points: TLEBuildingB,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // PASTRY
      Polygon(
        points: PastryTLEBuilding,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // CARPENTRY STAGE
      Polygon(
        points: CarpentryStage,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // CARPENTRY
      Polygon(
        points: CarpentryTLEA,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // CARPENTRY B
      Polygon(
        points: TLECarpentryB,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // SUPPLY OFFICE
      Polygon(
        points: SupplyOfficeBuilding,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // SPA
      Polygon(
        points: SPA_Building,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // SSG OFFICE
      Polygon(
        points: ssgoffice,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      Polygon(
        points: InnerWaitingShedBuilding,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      Polygon(
        points: BesideInnerWaitingShed,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      Polygon(
        points: PastryLab,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),

      //OfficeTpdSsg
      Polygon(
        points: OfficeTpdSsg,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      //PTAOffice
      Polygon(
        points: PTAOffice,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
      // MAIN BUILDING
      Polygon(
        points: Mainbuilding,
        color: const Color.fromARGB(255, 217, 208, 201),
        borderStrokeWidth: 1.0,
        borderColor: Colors.grey.withOpacity(1),
      ),
    ],
  );
}
