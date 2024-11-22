import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
//import 'taplandmark.dart';

// School Area
final List<LatLng> SchoolArea = [
  const LatLng(11.0113497, 124.6030998),
  const LatLng(11.0121861, 124.6042421),
  const LatLng(11.0118229, 124.6059374),
  const LatLng(11.0116965, 124.6061944),
  const LatLng(11.0114577, 124.6061021),
  const LatLng(11.0114621, 124.6057486),
  const LatLng(11.0113073, 124.6057529),
  const LatLng(11.0107234, 124.6056074),
  const LatLng(11.0107323, 124.6052959),
  const LatLng(11.0100426, 124.6049893),
  const LatLng(11.0095532, 124.6046644),
  const LatLng(11.0100609, 124.6037898),
  const LatLng(11.0099577, 124.6036622),
  const LatLng(11.010025, 124.6035099),
];
//SWIMMING POOL AREA
final List<LatLng> SwimmingPoolGate = [
  const LatLng(11.0108615, 124.6038295),
  const LatLng(11.0106544, 124.604397), //v
  const LatLng(11.0102759, 124.6042515),
  const LatLng(11.0104997, 124.603684),
];
final List<LatLng> SwimmingPool = [
  const LatLng(11.010752, 124.6038586),
  const LatLng(11.010602, 124.6042903), //
  const LatLng(11.010383, 124.6042151),
  const LatLng(11.0105378, 124.6037835),
];
//SPECIAL BUILDING AREA
final List<LatLng> SpecialBuildingMain = [
  LatLng(11.0098955, 124.6041888),
  LatLng(11.0099962, 124.6040625),
  LatLng(11.0101796, 124.6042099), //
  LatLng(11.0100792, 124.6043362),
];
final List<LatLng> SpecialEducBuilding = [
  const LatLng(11.0101706, 124.603898),
  const LatLng(11.0100162, 124.6040681), //v
  const LatLng(11.009976, 124.604031),
  const LatLng(11.0101348, 124.6038596),
];
final List<LatLng> SpecialEducBuilding2 = [
  const LatLng(11.0102661, 124.6039383),
  const LatLng(11.0100921, 124.6041347), //
  const LatLng(11.0100287, 124.6040765),
  const LatLng(11.0102033, 124.6038794),
];

//DEPED BUILDING AREA
final List<LatLng> DepEd1 = [
  const LatLng(11.0114871, 124.6035387),
  const LatLng(11.0113438, 124.6036388),
  const LatLng(11.0112827, 124.6035577),
  const LatLng(11.0111712, 124.6036415),
  const LatLng(11.0110623, 124.6034982),
  const LatLng(11.0113146, 124.6033088), //
];
final List<LatLng> DepEd2 = [
  const LatLng(11.0111446, 124.6036632),
  const LatLng(11.0109853, 124.6037957),
  const LatLng(11.0108552, 124.6036091),
  const LatLng(11.0110145, 124.6034765), //
];
//NIGHT HIGH AREA
final List<LatLng> NightHigh1 = [
  const LatLng(11.0106548, 124.6036009), //
  const LatLng(11.0103773, 124.6036848),
  const LatLng(11.0103468, 124.603582),
  const LatLng(11.0106269, 124.6034982),
];
final List<LatLng> NightHigh2 = [
  const LatLng(11.0108871, 124.6033521),
  const LatLng(11.0107304, 124.6034062), //
  const LatLng(11.0106959, 124.6033196),
  const LatLng(11.0108685, 124.6032682),
];
final List<LatLng> NightHigh3 = [
  const LatLng(11.0112322, 124.6032547),
  const LatLng(11.0109136, 124.6033521), //
  const LatLng(11.0108818, 124.6032574),
  const LatLng(11.0112004, 124.6031546),
];
//OCSHS AREA
final List<LatLng> ocshsCourt = [
  const LatLng(11.0111438, 124.6049764), //
  const LatLng(11.0111385, 124.6052777),
  const LatLng(11.0109294, 124.6052723),
  const LatLng(11.0109368, 124.6049721),
];
final List<LatLng> ocshsBuildingA = [
  const LatLng(11.0112833, 124.6049796),
  const LatLng(11.0112721, 124.6055775),
  const LatLng(11.0111565, 124.6055737),
  const LatLng(11.0111628, 124.6049753), //
];
final List<LatLng> ocshsBuildingB = [
  const LatLng(11.0109156, 124.6049312), //
  const LatLng(11.0108797, 124.605437),
  const LatLng(11.0107593, 124.6054284),
  const LatLng(11.0107952, 124.6049226),
];
// final List<LatLng> ocshsWorkshopRoom = [
//   const LatLng(11.0111238, 124.6053703),
//   const LatLng(11.0111164, 124.6054601),
//   const LatLng(11.0109077, 124.6054424),
//   const LatLng(11.0109154, 124.6053526),
// ];
// final List<LatLng> besideocshsBldgA = [
//   const LatLng(11.0112813, 124.605586),
//   const LatLng(11.0112804, 124.6056572),
//   const LatLng(11.0111761, 124.605658),
//   const LatLng(11.0111766, 124.6055871),
// ];
// final List<LatLng> BesideocshsCourt = [
//   const LatLng(11.0110757, 124.6052931),
//   const LatLng(11.0110744, 124.6053315),
//   const LatLng(11.0109934, 124.6053306),
//   const LatLng(11.0109953, 124.6052917),
// ];
//STUDENT GATE AREA

final List<LatLng> StudentGateGuardHouse = [
  const LatLng(11.0119199, 124.6039139),
  const LatLng(11.011959, 124.6039673),
  const LatLng(11.0119279, 124.6039884),
  const LatLng(11.0118882, 124.6039392), //
];
final List<LatLng> WaitingShed = [
  LatLng(11.0118527, 124.603787),
  LatLng(11.0118373, 124.6037983), //
  LatLng(11.0118152, 124.6037692),
  LatLng(11.0118305, 124.6037565),
];
//GATE AREA
final List<LatLng> GuardHouse = [
  LatLng(11.0120281, 124.6047649), //
  LatLng(11.0120505, 124.6047693),
  LatLng(11.0120429, 124.6048067),
  LatLng(11.0120201, 124.6048016),
];
// final List<LatLng> Gate = [
//   const LatLng(11.0120734, 124.6047402),
//   const LatLng(11.0120656, 124.604769),
//   const LatLng(11.0120528, 124.6047356), //
// ];
final List<LatLng> OldStage = [
  LatLng(11.011965, 124.6048526), //
  LatLng(11.0120286, 124.604865),
  LatLng(11.0120053, 124.6049773),
  LatLng(11.0119417, 124.6049636),
];
final List<LatLng> OldCourt = [
  LatLng(11.0117912, 124.6047395),
  LatLng(11.0119581, 124.6047751),
  LatLng(11.0118919, 124.6050942),
  LatLng(11.011726, 124.605058), //
];

final List<LatLng> InnerWaitingShed1 = [
  LatLng(11.0120631, 124.6047246),
  LatLng(11.0120283, 124.604717), //
  LatLng(11.0120364, 124.604678),
  LatLng(11.0120719, 124.604684),
];

//COVERED COURT AREA
final List<LatLng> Coveredcourt = [
  const LatLng(11.0119209, 124.6051463),
  const LatLng(11.0118636, 124.6054333),
  const LatLng(11.0116917, 124.6053993),
  const LatLng(11.0117418, 124.6051147), //
];
final List<LatLng> MaterialRoom = [
  LatLng(11.011947, 124.6051628), //
  LatLng(11.011973, 124.6051671),
  LatLng(11.0119682, 124.6051909),
  LatLng(11.0119422, 124.6051865),
];

// ROAD
final List<LatLng> Road1 = [
  LatLng(11.0115764, 124.6035296),
  LatLng(11.0120499, 124.6041683),
  LatLng(11.0121051, 124.604254),
  LatLng(11.0121074, 124.6042554),
  LatLng(11.0121097, 124.6042866),
  LatLng(11.0120832, 124.6043397),
  LatLng(11.0120695, 124.6043946),
  LatLng(11.0120252, 124.6047149),
  LatLng(11.0120713, 124.6047223),
  LatLng(11.0120645, 124.604754),
  LatLng(11.0120654, 124.6047535),
  LatLng(11.01207, 124.6047209),
  LatLng(11.012064, 124.604754),
  LatLng(11.0119951, 124.6047444),
  LatLng(11.0117903, 124.6047102),
  LatLng(11.0116981, 124.6051514),
  LatLng(11.0116965, 124.6051795),
  LatLng(11.0117275, 124.6051846),
  LatLng(11.0116842, 124.6054064),
  LatLng(11.0117787, 124.6054208),
  LatLng(11.0117595, 124.6055289),
  LatLng(11.0116931, 124.6055166),
  LatLng(11.0116558, 124.605728),
  LatLng(11.0116001, 124.6061251),
  LatLng(11.011578, 124.6061294),
  LatLng(11.0116274, 124.6057205),
  LatLng(11.0113516, 124.6057098),
  LatLng(11.0113522, 124.6056815),
  LatLng(11.011463, 124.6056793),
  LatLng(11.0114667, 124.6047969),
  LatLng(11.0115087, 124.6047979),
  LatLng(11.0115008, 124.6056782),
  LatLng(11.0116316, 124.6056831),
  LatLng(11.01165, 124.6055193),
  LatLng(11.0116127, 124.6055172),
  LatLng(11.0116132, 124.6051731),
  LatLng(11.0116584, 124.6050559),
  LatLng(11.0117272, 124.6046995),
  LatLng(11.0114704, 124.6046535),
  LatLng(11.0114097, 124.6046246),
  LatLng(11.0107623, 124.6045603),
  LatLng(11.0107476, 124.6045764),
  LatLng(11.0107434, 124.6046765),
  LatLng(11.0106241, 124.6047583),
  LatLng(11.010621, 124.604769),
  LatLng(11.0105947, 124.6047664),
  LatLng(11.0105968, 124.6047436),
  LatLng(11.0105306, 124.6046888),
  LatLng(11.0103105, 124.6046642),
  LatLng(11.0103147, 124.6046144),
  LatLng(11.01053609, 124.6046438),
  LatLng(11.010559, 124.6045357),
  LatLng(11.0105495, 124.6045207),
  LatLng(11.010331, 124.604490),
  LatLng(11.0102998, 124.6044495),
  LatLng(11.0101763, 124.6044346),
  LatLng(11.0101434, 124.6044607),
  LatLng(11.0101105, 124.6044607),
  LatLng(11.0100813, 124.6043583),
  LatLng(11.0101891, 124.6042316),
  LatLng(11.0102988, 124.6039654),
  LatLng(11.0103701, 124.6039877),
  LatLng(11.0102165, 124.604362),
  LatLng(11.0105017, 124.6044644),
  LatLng(11.0106114, 124.6044626),
  LatLng(11.0106607, 124.6044179),
  LatLng(11.0108782, 124.6038369),
  LatLng(11.0106351, 124.6037345),
  LatLng(11.0106845, 124.6035948),
  LatLng(11.0106534, 124.6034961),
  LatLng(11.0114193, 124.6031944),
  LatLng(11.0114631, 124.603254),
  LatLng(11.010849, 124.6035296),
  LatLng(11.0108197, 124.6035743),
  LatLng(11.010966, 124.603768),
  LatLng(11.0109906, 124.6037968),
  LatLng(11.0111862, 124.6036469),
  LatLng(11.0115892, 124.6041441),
  LatLng(11.0116094, 124.6042037),
  LatLng(11.0116094, 124.6042689),
  LatLng(11.0117556, 124.6043033),
  LatLng(11.0119735, 124.604153),
  LatLng(11.0115326, 124.603552),
];
final List<LatLng> Road2 = [
  LatLng(11.0111917, 124.6036907),
  LatLng(11.0115666, 124.6041832),
  LatLng(11.0115748, 124.6042154),
  LatLng(11.0114997, 124.6045799),
  LatLng(11.0113809, 124.6045538),
  LatLng(11.0114156, 124.6041702),
  LatLng(11.0113955, 124.6041609),
  LatLng(11.011379, 124.6042019),
  LatLng(11.0113333, 124.6045501),
  LatLng(11.010743, 124.6044681),
  LatLng(11.0109294, 124.6038276),
  LatLng(11.0109623, 124.6038439),
  LatLng(11.0111314, 124.604065),
  LatLng(11.0111428, 124.6040506),
  LatLng(11.0109915, 124.6038457),
  LatLng(11.0109975, 124.603836),
];
final List<LatLng> Road3 = [
  LatLng(11.0120517, 124.6044011),
  LatLng(11.0119859, 124.6046953),
  LatLng(11.0115207, 124.6046059),
  LatLng(11.0115801, 124.6043015),
  LatLng(11.0115911, 124.6042959),
];
final List<LatLng> Road4 = [
  LatLng(11.0119859, 124.6042149),
  LatLng(11.0120553, 124.6043341),
  LatLng(11.0120471, 124.604375),
  LatLng(11.0117812, 124.6043099),
  LatLng(11.0118972, 124.6042223),
  LatLng(11.0119192, 124.6042512),
];

//CANTEEN
final List<LatLng> MainCanteen = [
  LatLng(11.0114472, 124.6041691),
  LatLng(11.011553, 124.6041883),
  LatLng(11.0115148, 124.6044048), //
  LatLng(11.0114165, 124.6043829),
];
final List<LatLng> grade7Canteen = [
  LatLng(11.0106018, 124.6045319),
  LatLng(11.0106433, 124.6045344), //
  LatLng(11.0106354, 124.6046226),
  LatLng(11.0105963, 124.6046209),
];
final List<LatLng> G8bldCanteen = [
  LatLng(11.0103249, 124.6038822),
  LatLng(11.0102811, 124.6039326), //
  LatLng(11.0102623, 124.6039158),
  LatLng(11.0103045, 124.6038652),
];
final List<LatLng> STECanteen = [
  LatLng(11.0099887, 124.6042912),
  LatLng(11.0099668, 124.6043217), //
  LatLng(11.0098796, 124.6042566),
  LatLng(11.0099017, 124.6042264),
];

// OUTDOOR CR

final List<LatLng> CrNearMainBuilding = [
  const LatLng(11.0119752, 124.6042355),
  const LatLng(11.0120431, 124.60432), //
  const LatLng(11.0120074, 124.6043499),
  const LatLng(11.0119406, 124.6042648),
];
final List<LatLng> OldStageCR = [
  LatLng(11.0119647, 124.6049733),
  LatLng(11.0119904, 124.6049781),
  LatLng(11.0119865, 124.6049981),
  LatLng(11.01196, 124.6049927), //
];
final List<LatLng> CR1OldStage = [
  LatLng(11.0119348, 124.6050192),
  LatLng(11.0119912, 124.6050319),
  LatLng(11.0119841, 124.6050618),
  LatLng(11.0119271, 124.6050483), //
];
// OLD STAGE CR 2
final List<LatLng> CR2OldStage = [
  LatLng(11.0119258, 124.6050526),
  LatLng(11.011982, 124.6050656),
  LatLng(11.0119767, 124.6050958),
  LatLng(11.0119189, 124.6050818), //
];
// BESIDE COVERED COURT CR
final List<LatLng> BesideCoveredCourtCR = [
  const LatLng(11.0117287, 124.6051389),
  const LatLng(11.0117244, 124.6051802),
  const LatLng(11.0117015, 124.6051783),
  const LatLng(11.0117044, 124.6051365), //
];
// NEAR STUDENT GATE CR
final List<LatLng> CrNearStudentGate = [
  const LatLng(11.0120938, 124.6041627),
  const LatLng(11.0121364, 124.6042179),
  const LatLng(11.0121111, 124.6042355),
  const LatLng(11.0120731, 124.6041827), //
];
// STE CR
final List<LatLng> STEWashroom = [
  LatLng(11.0100445, 124.6044806),
  LatLng(11.0100702, 124.6044542), //
  LatLng(11.0101322, 124.6045141),
  LatLng(11.0101073, 124.6045384),
];
// CARPENTRY CR
final List<LatLng> Carpentry_Cr = [
  LatLng(11.0108563, 124.6042363),
  LatLng(11.0108497, 124.6042911),
  LatLng(11.0108238, 124.6042882), //
  LatLng(11.0108309, 124.6042331),
];
// SPS CR
final List<LatLng> SPS_Cr = [
  LatLng(11.0107659, 124.6043953),
  LatLng(11.0107835, 124.6043955),
  LatLng(11.0107815, 124.6044158),
  LatLng(11.0107645, 124.604416), //
];
//  GRADE 9 CR
final List<LatLng> CrNrG9 = [
  LatLng(11.0117122, 124.6057669),
  LatLng(11.0116995, 124.6058781),
  LatLng(11.0116656, 124.6058738),
  LatLng(11.0116751, 124.6057626), //
];
//gr 8
final List<LatLng> CrNrG8A = [
  LatLng(11.010211, 124.603789), //
  LatLng(11.0101788, 124.6038265),
  LatLng(11.0101602, 124.6038095),
  LatLng(11.0101915, 124.6037727),
];
final List<LatLng> CrNrG8B = [
  LatLng(11.0100313, 124.603603), //
  LatLng(11.0099991, 124.6036376),
  LatLng(11.0099807, 124.6036211),
  LatLng(11.0100123, 124.6035859),
];

PolygonLayer createSchoolArea() {
  return PolygonLayer(
    polygons: [
      Polygon(
        points: SchoolArea,
        color: const Color.fromARGB(255, 255, 255, 229),
        borderStrokeWidth: 2,
        borderColor: const Color.fromARGB(255, 147, 156, 63),
      ),
      Polygon(
        points: SwimmingPoolGate,
        color: const Color.fromARGB(148, 224, 221, 219),
        borderStrokeWidth: 1.0,
        borderColor: const Color.fromARGB(255, 217, 208, 201),
      ),
      Polygon(
        points: SwimmingPool,
        color: const Color.fromARGB(255, 170, 211, 223),
        borderStrokeWidth: 1.0,
        borderColor: Colors.blue.shade300,
      ),
      Polygon(
        points: SpecialBuildingMain,
        color: const Color.fromARGB(255, 255, 255, 229),
        borderStrokeWidth: 1.0,
        borderColor: Colors.black26,
      ),
      Polygon(
        points: SpecialEducBuilding,
        color: const Color.fromARGB(255, 255, 255, 229),
        borderStrokeWidth: 1.0,
        borderColor: Colors.black26,
      ),
      Polygon(
        points: SpecialEducBuilding2,
        color: const Color.fromARGB(255, 255, 255, 229),
        borderStrokeWidth: 1.0,
        borderColor: Colors.black26,
      ),

      Polygon(
        points: DepEd1,
        color: const Color.fromARGB(255, 255, 255, 229),
        borderStrokeWidth: 1.0,
        borderColor: Colors.black26,
      ),
      Polygon(
        points: DepEd2,
        color: const Color.fromARGB(255, 255, 255, 229),
        borderStrokeWidth: 1.0,
        borderColor: Colors.black26,
      ),
      Polygon(
        points: NightHigh1,
        color: const Color.fromARGB(255, 255, 255, 229),
        borderStrokeWidth: 1.0,
        borderColor: Colors.black26,
      ),
      Polygon(
        points: NightHigh2,
        color: const Color.fromARGB(255, 255, 255, 229),
        borderStrokeWidth: 1.0,
        borderColor: Colors.black26,
      ),
      Polygon(
        points: NightHigh3,
        color: const Color.fromARGB(255, 255, 255, 229),
        borderStrokeWidth: 1.0,
        borderColor: Colors.black26,
      ),
      Polygon(
        points: ocshsCourt,
        color: const Color.fromARGB(255, 255, 255, 229),
        borderStrokeWidth: 1.0,
        borderColor: Colors.black26,
      ),
      Polygon(
        points: ocshsBuildingA,
        color: const Color.fromARGB(255, 255, 255, 229),
        borderStrokeWidth: 1.0,
        borderColor: Colors.black26,
      ),
      Polygon(
        points: ocshsBuildingB,
        color: const Color.fromARGB(255, 255, 255, 229),
        borderStrokeWidth: 1.0,
        borderColor: Colors.black26,
      ),

      // City High Area
      Polygon(
        points: StudentGateGuardHouse,
        color: Colors.blueGrey[300],
        borderStrokeWidth: 1.0,
        borderColor: Colors.blueGrey,
      ),
      Polygon(
        points: WaitingShed,
        color: Colors.blueGrey[300],
        borderStrokeWidth: 1.0,
        borderColor: Colors.blueGrey,
      ),

      Polygon(
        points: GuardHouse,
        color: Colors.blueGrey[300],
        borderStrokeWidth: 1.0,
        borderColor: Colors.blueGrey,
      ),
     
      Polygon(
        points: InnerWaitingShed1,
        color: Colors.blueGrey[300],
        borderStrokeWidth: 1.0,
        borderColor: Colors.blueGrey,
      ),

      //
      Polygon(
        points: OldStage,
        color: const Color.fromARGB(148, 224, 221, 219),
        borderStrokeWidth: 1.0,
        borderColor: Colors.black38,
      ),
      Polygon(
        points: OldCourt,
        color: const Color.fromARGB(148, 224, 221, 219),
        borderStrokeWidth: 1.0,
        borderColor: Colors.black38,
      ),

      Polygon(
        points: Coveredcourt,
        color: const Color.fromARGB(148, 224, 221, 219),
        borderStrokeWidth: 1.0,
        borderColor: Colors.black38,
      ),
      Polygon(
        points: MaterialRoom,
        color: const Color.fromARGB(148, 224, 221, 219),
        borderStrokeWidth: 1.0,
        borderColor: Colors.black38,
      ),
      // ROAD
      Polygon(
        points: Road1,
        color: Colors.white,
        borderStrokeWidth: 2.0,
        borderColor: const Color.fromARGB(255, 197, 196, 194),
      ),
      Polygon(
        points: Road2,
        color: Colors.white,
        borderStrokeWidth: 2.0,
        borderColor: const Color.fromARGB(255, 197, 196, 194),
      ),
      Polygon(
        points: Road3,
        color: Colors.white,
        borderStrokeWidth: 2.0,
        borderColor: const Color.fromARGB(255, 197, 196, 194),
      ),
      Polygon(
        points: Road4,
        color: Colors.white,
        borderStrokeWidth: 2.0,
        borderColor: const Color.fromARGB(255, 197, 196, 194),
      ),
     
    
      // canteen
      Polygon(
        points: MainCanteen,
        color: const Color.fromARGB(255, 163, 139, 130),
        borderStrokeWidth: 1.0,
        borderColor: const Color.fromARGB(255, 138, 125, 120),
      ),
      Polygon(
        points: grade7Canteen,
        color: const Color.fromARGB(255, 163, 139, 130),
        borderStrokeWidth: 1.0,
        borderColor: const Color.fromARGB(255, 138, 125, 120),
      ),
      Polygon(
        points: G8bldCanteen,
        color: const Color.fromARGB(255, 163, 139, 130),
        borderStrokeWidth: 1.0,
        borderColor: const Color.fromARGB(255, 138, 125, 120),
      ),

      Polygon(
        points: STECanteen,
        color: const Color.fromARGB(255, 163, 139, 130),
        borderStrokeWidth: 1.0,
        borderColor: const Color.fromARGB(255, 138, 125, 120),
      ),

// cr
//MAIN BUILDING CR
      Polygon(
        points: CrNearMainBuilding,
        color: const Color.fromARGB(255, 216, 209, 143),
        borderStrokeWidth: 1.0,
        borderColor: const Color.fromARGB(185, 158, 154, 152),
      ),
      // OLD STAGE CR
      Polygon(
        points: OldStageCR,
        color: const Color.fromARGB(255, 216, 209, 143),
        borderStrokeWidth: 1.0,
        borderColor: const Color.fromARGB(185, 158, 154, 152),
      ),
      // OLD STAGE CR 1
      Polygon(
        points: CR1OldStage,
        color: const Color.fromARGB(255, 216, 209, 143),
        borderStrokeWidth: 1.0,
        borderColor: const Color.fromARGB(185, 158, 154, 152),
      ),
      // OLD STAGE CR 2
      Polygon(
        points: CR2OldStage,
        color: const Color.fromARGB(255, 216, 209, 143),
        borderStrokeWidth: 1.0,
        borderColor: const Color.fromARGB(185, 158, 154, 152),
      ),
      // CR BESIDE COVERED COURT
      Polygon(
        points: BesideCoveredCourtCR,
        color: const Color.fromARGB(255, 216, 209, 143),
        borderStrokeWidth: 1.0,
        borderColor: const Color.fromARGB(185, 158, 154, 152),
      ),
      // NEAR STUDENT GATE CR
      Polygon(
        points: CrNearStudentGate,
        color: const Color.fromARGB(255, 216, 209, 143),
        borderStrokeWidth: 1.0,
        borderColor: const Color.fromARGB(185, 158, 154, 152),
      ),
      // STE CR
      Polygon(
        points: STEWashroom,
        color: const Color.fromARGB(255, 216, 209, 143),
        borderStrokeWidth: 1.0,
        borderColor: const Color.fromARGB(185, 158, 154, 152),
      ),
      // CARPENTRY CR
      Polygon(
        points: Carpentry_Cr,
        color: const Color.fromARGB(255, 216, 209, 143),
        borderStrokeWidth: 1.0,
        borderColor: const Color.fromARGB(185, 158, 154, 152),
      ),
      // SPS CR
      Polygon(
        points: SPS_Cr,
        color: const Color.fromARGB(255, 216, 209, 143),
        borderStrokeWidth: 1.0,
        borderColor: const Color.fromARGB(185, 158, 154, 152),
      ),
//GRADE 9 CR
      Polygon(
        points: CrNrG9,
        color: const Color.fromARGB(255, 216, 209, 143),
        borderStrokeWidth: 1.0,
        borderColor: const Color.fromARGB(185, 158, 154, 152),
      ),
      Polygon(
        points: CrNrG8A,
        color: const Color.fromARGB(255, 216, 209, 143),
        borderStrokeWidth: 1.0,
        borderColor: const Color.fromARGB(185, 158, 154, 152),
      ),
      Polygon(
        points: CrNrG8B,
        color: const Color.fromARGB(255, 216, 209, 143),
        borderStrokeWidth: 1.0,
        borderColor: const Color.fromARGB(185, 158, 154, 152),
      ),
    ],
  );
}
