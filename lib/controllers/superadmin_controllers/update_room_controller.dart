import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:room_booking_app/api_services/api_service.dart';
import 'package:room_booking_app/bottom_navigation/bottom_navigation_bar.dart';
import 'package:room_booking_app/controllers/app_controllers/app_main_controller.dart';
import 'package:room_booking_app/defined_pages/superadmin_pages/users_list.dart';

class UpdateRoomController extends GetxController {
  Future updateRoomDetails(String name, floor, roomDetails, meetingType,
      int seatingCapacity, id, isActive) async {
    http.Response response = await http.post(
      Uri.parse('${ApiService.baseUrl}/api/rooms/updateRoom'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.accessToken}',
      },
      body: json.encode({
        "name": name,
        "id": id,
        "isActive": isActive,
        "floor": floor,
        "roomDetails": roomDetails,
        "meetingType": meetingType,
        "seatingCapacity": seatingCapacity,
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      bool? status = result['status'];
      String message = result['message'];

      if (status == true) {
        Get.defaultDialog(
          title: "Success",
          middleText: message,
          textConfirm: "OK",
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.offAll(const BottomNaviagtionBarScreen(
              initialIndex: 2,
            ));
            // Close the dialog
          },
        );
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
              Get.offAll(const BottomNaviagtionBarScreen());
            },
          );
        }
      }
    }
  }
}
