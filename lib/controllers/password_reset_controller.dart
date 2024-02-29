import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:room_booking_app/api_services/api_service.dart';
import 'package:room_booking_app/controllers/app_controllers/app_main_controller.dart';
import 'package:room_booking_app/utils/toast_service.dart';

class PasswordResetcontroller extends GetxController {
  RxString newPassword = "".obs;
  RxString confirmPssword = "".obs;

  Future<void> changePassword() async {
    http.Response response = await http.post(
      Uri.parse('${ApiService.baseUrl}/api/users/updatePassword'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.accessToken}',
      },
      body: json.encode({
        "newPassword": newPassword.value,
        "confirmPassword": confirmPssword.value,
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      // updateStatus = result['message'];
      bool? status = result['status'];

      if (status == true) {
        toast("Pssword changed Successfully");
      } else {
        toast("Unable to change password");
      }
    } else {
      toast("Something went wrong");
    }
  }
}
