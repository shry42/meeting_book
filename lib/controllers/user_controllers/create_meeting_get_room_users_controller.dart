import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:room_booking_app/api_services/api_service.dart';
import 'package:room_booking_app/controllers/app_controllers/app_main_controller.dart';
import 'package:room_booking_app/defined_pages/user_pages/my_meetings_user.dart';
import 'package:room_booking_app/models/user_model/get_all_rooms_model.dart';
import 'package:room_booking_app/models/user_model/get_all_user_model.dart';

//we have two apis for get and one for createmeet post in this controller

class CreateMeetingUserController extends GetxController {
  RxInt roomId = 0.obs;
  RxString date = "".obs;
  late TimeOfDay startTime;
  late TimeOfDay endTime;
  RxString meetingType = "".obs;
  RxString purpose = "".obs;
  RxList participants = <int>[].obs;

  //
  RxString selectedMeetingType = ''.obs;
  var selectedRoomId = 0.obs;
  RxString selectedRoom = ''.obs;
  RxString selectedFloor = ''.obs;
  RxString selectedStartTime = ''.obs;
  RxString selectedEndTime = ''.obs;
  RxString selectedDate = ''.obs;
  RxString selectedPurpose = ''.obs;
  RxList selectedParticipantsId = [].obs;

  //For get all RoomsGetModels
  RxInt? id;
  RxString? name;
  RxString? floor;
  RxString? seatingCapacity;
  RxString? roomDetails;

  RxBool status = false.obs;

  List<RoomsGetModel> roomListObj = [];
  List<GetAllUserDetailsModel> userListObj = [];

  String _formatTime(TimeOfDay timeOfDay) {
    // Format TimeOfDay as HH:mm
    return '${timeOfDay.hour}:${timeOfDay.minute}';
  }

//For GET ROOMS
  Future getRooms() async {
    // throw Exception();
    http.Response response = await http.get(
      Uri.parse('${ApiService.baseUrl}/api/rooms/getRooms'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      List<dynamic> data = result['data'];

      roomListObj = data.map((e) => RoomsGetModel.fromJson(e)).toList();

      return roomListObj;
    }
  }

//FOR GET USERS

  Future getUsers() async {
    // throw Exception();
    http.Response response = await http.get(
      Uri.parse('${ApiService.baseUrl}/api/users/allUser'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      List<dynamic> data = result['data'];

      // userListObj =
      //     data.map((e) => GetAllUserDetailsModel.fromJson(e)).toList();
      userListObj = data
          .map((e) => GetAllUserDetailsModel.fromJson(e))
          .where((participant) =>
              participant.id != AppController.mainUid &&
              !(participant.role == 'superAdmin'))
          .toList();

      return userListObj;
    }
  }

// FOR CREATE USERS
  Future<void> createMeetingUser() async {
    http.Response response = await http.post(
      Uri.parse('${ApiService.baseUrl}/api/rooms/createBooking'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.accessToken}',
      },
      // body: json.encode({
      //   "roomId": 1,
      //   "date": "2024-02-16",
      //   "startTime": "13:00",
      //   "endTime": "13:50",
      //   "meetingType": "Internal",
      //   // "meetingType": "External",
      //   "purpose": "interview",
      //   // "purpose": "meeting"
      //   // "participant": "[1, 2, 3]" //these will be particpants id with selected value
      // }),

      //Testing below json encode

      body: json.encode({
        "roomId": selectedRoomId.value,
        "date": selectedDate.value.split(' ')[0],
        "startTime": selectedStartTime.value,
        "endTime": selectedEndTime.value,
        "meetingType": selectedMeetingType.value,

        "purpose": selectedPurpose.value,

        "participant": selectedParticipantsId.value.toString() ??
            '[]' //these will be particpants id with selected value
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      bool? status = result['status'];
      // String title = result['title'];
      String message = result['message'];

      if (status == true) {
        Get.defaultDialog(
          title: "Success",
          middleText: "Meeting created successfully\n  click to view meetings",
          textConfirm: "OK",
          confirmTextColor: Colors.white,
          onConfirm: () async {
            Get.offAll(MyMeetingsScreen(
              title: 'My Meetings',
            ));
          },
        );
      }
    } else if (response.statusCode != 200) {
      Map<String, dynamic> result = json.decode(response.body);
      bool? status = result['status'];
      String title = result['title'];
      String message = result['message'];

      if (title == 'Validation Failed') {
        Get.defaultDialog(
          title: "Error",
          middleText: "$message",
          textConfirm: "OK",
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back(); // Close the dialog
          },
        );
      } else if (title == 'Unauthorized') {
        Get.defaultDialog(
          title: "Error",
          middleText: "$message \nplease re login",
          textConfirm: "OK",
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back(); // Close the dialog
          },
        );
      }
    }
  }
}
