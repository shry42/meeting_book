import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:room_booking_app/api_services/api_service.dart';
import 'package:room_booking_app/controllers/app_controllers/app_main_controller.dart';
import 'package:room_booking_app/models/user_model/get_all_rooms_model.dart';
import 'package:room_booking_app/models/user_model/get_all_user_model.dart';

//we have two apis for get and one for createmeet post in this controller

class CreateMeetingUserController extends GetxController {
  RxInt roomId = 0.obs;
  RxString date = "".obs;
  RxString startTime = "".obs;
  RxString endTime = "".obs;
  RxString meetingType = "".obs;
  RxString purpose = "".obs;
  RxList participants = <int>[].obs;

  //
  RxString selectedMeetingType = 'External'.obs;
  var selectedRoomId = 0.obs;
  RxString selectedRoom = ''.obs;
  RxString selectedFloor = ''.obs;

  //For get all RoomsGetModels
  RxInt? id;
  RxString? name;
  RxString? floor;
  RxString? seatingCapacity;
  RxString? roomDetails;

  List<RoomsGetModel> roomListObj = [];
  List<GetAllUserDetailsModel> userListObj = [];

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

      userListObj =
          data.map((e) => GetAllUserDetailsModel.fromJson(e)).toList();

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
      body: json.encode({
        "roomId": 1,
        "date": "2024-02-16",
        "startTime": "13:00",
        "endTime": "13:50",
        "meetingType": "Internal",
        // "meetingType": "External",
        "purpose": "interview",
        // "purpose": "meeting"
        // "participant": "[1, 2, 3]" //these will be particpants id with selected value
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      // updateStatus = result['message'];
      bool? status = result['status'];

      if (status == true) {
        Get.defaultDialog(
          title: "Success",
          middleText: "Meeting created successfully\n  click to view meetings",
          textConfirm: "OK",
          confirmTextColor: Colors.white,
          onConfirm: () async {
            Get.back(); // Close the dialog
            // Get.offAll(QRScannerScreen());
          },
        );
      } else {
        Get.defaultDialog(
          title: "Error",
          middleText: "Could not create",
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
