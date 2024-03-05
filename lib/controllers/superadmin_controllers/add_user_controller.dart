import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:room_booking_app/api_services/api_service.dart';
import 'package:room_booking_app/bottom_navigation/bottom_navigation_bar.dart';
import 'package:room_booking_app/controllers/app_controllers/app_main_controller.dart';

class AddUserController extends GetxController {
  Future addUser(String firstName, lastName, email, mobileNo, password,
      confirmPassword) async {
    http.Response response = await http.post(
      Uri.parse('${ApiService.baseUrl}/api/users/registerUser'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.accessToken}',
      },
      body: json.encode({
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "mobileNo": mobileNo,
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      bool? status = result['status'];
      String message = result['message'];

      if (status == true) {
        Get.defaultDialog(
          title: "Success",
          // middleText: "$message",
          middleText: 'User added successfully\n check in users section',
          textConfirm: "OK",
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.offAll(const BottomNaviagtionBarScreen(
              initialIndex: 1,
            ));
            // Get.back(); // Close the dialog
            // Get.offAll(const UserLists(title: 'UsersList'));
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
              Get.back(); // Close the dialog
            },
          );
        }
      }
    }
  }
}
