import 'package:latlong2/latlong.dart';
import '1stFlooRoom.dart';
import '2ndFloorRoom.dart';
import '3rdfloorRoom.dart';
import '4thFloorRoom.dart';

List<LatLng> getRoomPolygonForRoom(String polygonName) {
  switch (polygonName) {
    case 'InnerRoom1':
      return InnerRoom1;
    case 'InnerRoom2':
      return InnerRoom2;
    case 'InnerRoom3':
      return InnerRoom3;
    case 'InnerOffice2R1':
      return InnerOffice2R1; 
    case 'InnerOffice2R2':
      return InnerOffice2R2;
    case 'PastryLab1':
      return PastryLab1;
    case 'G7ARoom1':
      return G7ARoom1;
    case 'G7BRoom1':
      return G7BRoom1;
    case 'G7ARoom3':
      return G7ARoom3;
    case 'G7ARoom4':
      return G7ARoom4;
    case 'G7ARoom5':
      return G7ARoom5;
    case 'G7ARoom6':
      return G7ARoom6;
    case 'G7ARoom7':
      return G7ARoom7;
    case 'G7ARoom8':
      return G7ARoom8;
    case 'G7BRoom1':
      return G7BRoom1;
    case 'G7BRoom2':
      return G7BRoom2;
    case 'G7BRoom3':
      return G7BRoom3;
    case 'G7BRoom4':
      return G7BRoom4;
    case 'G7BRoom5':
      return G7BRoom5;
    case 'G7BRoom6':
      return G7BRoom6;
    case 'G7BRoom7':
      return G7BRoom7;
    case 'G7BRoom8':
      return G7BRoom8;
    case 'G82ndFLRoom1':
      return G82ndFLRoom1;
    case 'G82ndFLRoom2':
      return G82ndFLRoom2; 
    case 'PastryTLEBuildingRoom':
      return PastryTLEBuildingRoom; 
    case 'G8bldARoom1':
      return G8bldARoom1;
    case 'G8bldARoom2':
      return G8bldARoom2;
    case 'G8bldBRoom1':
      return G8bldBRoom1;
    case 'G8bldBRoom2':
      return G8bldBRoom2;
    case 'G8bldCRoom1':
      return G8bldCRoom1;
    case 'G8bldCRoom2':
      return G8bldCRoom2;
    case 'G8Room1':
      return G8Room1;
    case 'G8Rooms2':
      return G8Rooms2;
    case 'G8Room3':
      return G8Room3;
    case 'G8Room4':
      return G8Room4;
    case 'G8Room5':
      return G8Room5;
    case 'G8Room6':
      return G8Room6;
    case 'G8Room7':
      return G8Room7;
    case 'G8Room8':
      return G8Room8;
    case 'ABSA_Room1':
      return ABSA_Room1;
    case 'ABSA_Room2':
      return ABSA_Room2;
    case 'ABSA_Room3':
      return ABSA_Room3;
    case 'ABSA_Room4':
      return ABSA_Room4;
    case 'ABSB_Room1':
      return ABSB_Room1;
    case 'ABSB_Room2':
      return ABSB_Room2;
    case 'ABSB_Room3':
      return ABSB_Room3;
    case 'ABSB_Room4':
      return ABSB_Room4;
    case 'GreeneryA_Room1':
      return GreeneryA_Room1;
    case 'GreeneryA_Room2':
      return GreeneryA_Room2;
    case 'GreeneryA_Room3':
      return GreeneryA_Room3;
    case 'GreeneryB_Room1':
      return GreeneryB_Room1;
    case 'GreeneryB_Room2':
      return GreeneryB_Room2;
    case 'GreeneryB_Room3':
      return GreeneryB_Room3;
    case 'GreeneryC_Room1':
      return GreeneryC_Room1;
    case 'GreeneryC_Room1':
      return GreeneryC_Room1;
    case 'swimmingPoolRoom1':
      return swimmingPoolRoom1;
    case 'swimmingPoolRoom2':
      return swimmingPoolRoom2;
    case 'swimmingPoolRoom3':
      return swimmingPoolRoom3;
    case 'grade9AClinic':
      return grade9AClinic;
    case 'grade9AOffice1':
      return grade9AOffice1;
    case 'grade9ARoom1':
      return grade9ARoom1;
    case 'grade9ARoom2':
      return grade9ARoom2;
    case 'grade9ARoom3':
      return grade9ARoom3;
    case 'grade9ARoom4':
      return grade9ARoom4;
    case 'grade9ARoom5':
      return grade9ARoom5;
    case 'grade9ARoom6':
      return grade9ARoom6;
    case 'grade9ARoom7':
      return grade9ARoom7;
    case 'grade9ARoom8':
      return grade9ARoom8;
    case 'grade9ARoom9':
      return grade9ARoom9;
    case 'grade9ARoom10':
      return grade9ARoom10;
    case 'grade9ARoom11':
      return grade9ARoom11;
    case 'buildingGrade9B':
      return buildingGrade9B;
    case 'grade9BuildingCRoom1':
      return grade9BuildingCRoom1;
    case 'grade9BuildingCRoom2':
      return grade9BuildingCRoom2;
    case 'grade9BuildingCRoom3':
      return grade9BuildingCRoom3;
    case 'grade9BuildingCRoom4':
      return grade9BuildingCRoom4;
    case 'G9DLAB1':
      return G9DLAB1;
    case 'G9DLAB2':
      return G9DLAB2;
    case 'grade9ERoom':
      return grade9ERoom;
    case 'grade9BuildingFRoom1':
      return grade9BuildingFRoom1;
    case 'grade9BuildingFRoom2':
      return grade9BuildingFRoom2;
    case 'grade9BuildingFRoom3':
      return grade9BuildingFRoom3;
    case 'Grade9BuildingG1':
      return Grade9BuildingG1;
    case 'Grade9BuildingG2':
      return Grade9BuildingG2;
    case 'Grade9BuildingG3':
      return Grade9BuildingG3;
    case 'Grade_9BuildingH':
      return Grade_9BuildingH;
    case 'CarpentryStage':
      return CarpentryStage;
    case 'CarpentryA':
      return CarpentryA;
    case 'SPSroom1':
      return SPSroom1;
    case 'SPSroom2':
      return SPSroom2;
    case 'SPSroom3':
      return SPSroom3;
    case 'SPSroom4':
      return SPSroom4;
    case 'SPSroom5':
      return SPSroom5;
    case 'SPSroom6':
      return SPSroom6;
    case 'SPSroom7':
      return SPSroom7;
    case 'tleBuildingARoom1':
      return tleBuildingARoom1;
    case 'tleBuildingARoom2':
      return tleBuildingARoom2;
    case 'tleBuildingARoom3':
      return tleBuildingARoom3;
    case 'tleBuildingARoom4':
      return tleBuildingARoom4;
    case 'TLE_BUILDING_2_ROOM_1':
      return TLE_BUILDING_2_ROOM_1;
    case 'TLE_BUILDING_2_ROOM_2':
      return TLE_BUILDING_2_ROOM_2;
    case 'TLE_BUILDING_2_ROOM_3':
      return TLE_BUILDING_2_ROOM_3;
    case 'TLE_BUILDING_2_ROOM_4':
      return TLE_BUILDING_2_ROOM_4;
    case 'SOBuildingRoom1':
      return SOBuildingRoom1;
    case 'SOBuildingRoom2':
      return SOBuildingRoom2;
    case 'SOBuildingRoom3':
      return SOBuildingRoom3;
    case 'Grade10Buildingwith2ndFloor':
      return Grade10Buildingwith2ndFloor;
    case 'TLECarpentryB':
      return TLECarpentryB;
    case 'grade10Room1':
      return grade10Room1;
    case 'grade10Room2':
      return grade10Room2;
    case 'grade10Room3':
      return grade10Room3;
    case 'conferenceHall':
      return conferenceHall;
    case 'grade10Room4':
      return grade10Room4;
    case 'grade10Room5':
      return grade10Room5;
    case 'grade10Room6':
      return grade10Room6;
    case 'grade10Room7':
      return grade10Room7;
    case 'Grade10YellowBSP':
      return Grade10YellowBSP;
    case 'GRADE10YELLOW_room1':
      return GRADE10YELLOW_room1;
    case 'GRADE10YELLOW_room2':
      return GRADE10YELLOW_room2;
    case 'Grade10BuildingB1':
      return Grade10BuildingB1;
    case 'Grade10BuildingB2':
      return Grade10BuildingB2;
    case 'GR10LAB':
      return GR10LAB;
    case 'ssgoffice':
      return ssgoffice;
    case 'OfficeTpdSsg':
      return OfficeTpdSsg;
    case 'PTAOffice':
      return PTAOffice;
    case 'principalOffice':
      return principalOffice;
    case 'guidanceOffice':
      return guidanceOffice;
    case 'registrarOffice':
      return registrarOffice;
    case 'complab1':
      return complab1;
    case 'complab2':
      return complab2;
    case 'complab3':
      return complab3;
    case 'library':
      return library;
    case 'AVR':
      return AVR;
    case 'fth_floorcr1':
      return fth_floorcr1;
    case 'fth_floorcr2':
      return fth_floorcr2;
    case 'STEA_ComfortRoom1':
      return STEA_ComfortRoom1;
    case 'STEB_CR':
      return STEB_CR;
    case 'STEC_CR':
      return STEC_CR;
    case 'G7AComfortRoomFemale1':
      return G7AComfortRoomMale1;
    case 'G7BComfortRoomFemale1':
      return G7BComfortRoomFemale1;
    case 'G7BComfortRoom':
      return G7BComfortRoom;
    case 'SPA_room1':
      return SPA_room1;
    case 'SPA_room2':
      return SPA_room2;
    case 'SPA_room3':
      return SPA_room3;
    case 'SPA_room4':
      return SPA_room4; 
    case 'G10Building4F_Room1':
      return G10Building4F_Room1; 
    case 'G10Building4F_Room2':
      return G10Building4F_Room2;
    case 'G10Building4F_Room3':
      return G10Building4F_Room3;
    case 'G10Building4F_Room4':
      return G10Building4F_Room4;
    case 'G10Building4F_Cr1':
      return G10Building4F_Cr1;
    case 'G10Building4F_Cr2':
      return G10Building4F_Cr2;
    case 'SPA_cr1':
      return SPA_cr1;
    case 'SPA_cr2':
      return SPA_cr2;
    case 'STEA_Room1':
      return STEA_Room1;
    case 'STEA_Room2':
      return STEA_Room2;
    case 'STEB_R1':
      return STEB_R1;
    case 'STEB_R2':
      return STEB_R2;
    case 'STEB_R3':
      return STEB_R3;
    case 'STEC_R1':
      return STEC_R1;
    case 'STEC_R2':
      return STEC_R2;
    case 'STEC_R3':
      return STEC_R3;
    case 'STEC_R4':
      return STEC_R4;
    case 'STEC_R5':
      return STEC_R5;
    case 'G7A2Room1':
      return G7A2Room1;
    case 'G7A2Room2':
      return G7A2Room2;
    case 'G7A2Room3':
      return G7A2Room3;
    case 'G7A2Room4':
      return G7A2Room4;
    case 'G7A2Room5':
      return G7A2Room5;
    case 'G7A2Room6':
      return G7A2Room6;
    case 'G7A2Room7':
      return G7A2Room7;
    case 'G7A2Room8':
      return G7A2Room8;
    case 'G7A2Room9':
      return G7A2Room9;
    case 'G7B2Room1':
      return G7B2Room1;
    case 'G7B2Room2':
      return G7B2Room2;
    case 'G7B2Room3':
      return G7B2Room3;
    case 'G7B2Room4':
      return G7B2Room4;
    case 'G7B2Room5':
      return G7B2Room5;
    case 'G7B2Room6':
      return G7B2Room6;
    case 'G7B2Room7':
      return G7B2Room7;
    case 'G7B2Room8':
      return G7B2Room8;
    case 'G7B2Room9':
      return G7B2Room9;
    case 'G82ndFL2Room1':
      return G82ndFL2Room1;
    case 'G82ndFL2Room2':
      return G82ndFL2Room2; //DIRI
    case 'SPA_2room1':
      return SPA_2room1;
    case 'SPA_2room2':
      return SPA_2room2;
    case 'SPA_2room3':
      return SPA_2room3;
    case 'SPA_2room4':
      return SPA_2room4; //DIRI
    case 'GRADE10YELLOW_2room1':
      return GRADE10YELLOW_2room1;
    case 'GRADE10YELLOW_2room2':
      return GRADE10YELLOW_2room2;
    case 'G10Building4F_2Room1':
      return G10Building4F_2Room1; //DIRI
    case 'G10Building4F_2Room2':
      return G10Building4F_2Room2;
    case 'G10Building4F_2Room3':
      return G10Building4F_2Room3;
    case 'G10Building4F_2Room4':
      return G10Building4F_2Room4;
    case 'G10Building4F_2Cr1':
      return G10Building4F_2Cr1;
    case 'G10Building4F_2Cr2':
      return G10Building4F_2Cr2;
    case 'SPA_2cr1':
      return SPA_2cr1;
    case 'SPA_2cr2':
      return SPA_2cr2;
    case 'CRGrade10YellowBuilding2ndFloor2':
      return CRGrade10YellowBuilding2ndFloor2;
    case 'CRGR10YELLOWBUILDING2':
      return CRGR10YELLOWBUILDING2;
    case 'STEA_2Room1':
      return STEA_2Room1;
    case 'STEA_2Room2':
      return STEA_2Room2;
    case 'STEB_2R1':
      return STEB_2R1;
    case 'STEB_2R2':
      return STEB_2R2;
    case 'STEB_2R3':
      return STEB_2R3;
    case 'STEC_2R1':
      return STEC_2R1;
    case 'STEC_2R2':
      return STEC_2R2;
    case 'STEC_2R3':
      return STEC_2R3;
    case 'STEC_2R4':
      return STEC_2R4;
    case 'STEC_2R5':
      return STEC_2R5;
    case 'G10Building4F_3Room1':
      return G10Building4F_3Room1;
    case 'G10Building4F_3Room2':
      return G10Building4F_3Room2;
    case 'G10Building4F_3Room3':
      return G10Building4F_3Room3;
    case 'G10Building4F_3Room4':
      return G10Building4F_3Room4;
    case 'G10Building4F_4Cr1':
      return G10Building4F_3Cr1;
    case 'G10Building4F_4Cr2':
      return G10Building4F_3Cr2;
    case 'SPA_3room1':
      return SPA_3room1;
    case 'SPA_3room2':
      return SPA_3room2;
    case 'SPA_3room3':
      return SPA_3room3;
    case 'SPA_3room4':
      return SPA_3room4;
    case 'SPA_3cr1':
      return SPA_3cr1;
    case 'SPA_3cr2':
      return SPA_3cr2;
    case 'G10Building4F_4Room1':
      return G10Building4F_4Room1;
    case 'G10Building4F_4Room2':
      return G10Building4F_4Room2;
    case 'G10Building4F_4Room3':
      return G10Building4F_4Room3;
    case 'G10Building4F_4Room4':
      return G10Building4F_4Room4;

    // Add cases for other room polygons
    default:
      return [];
  }
}
