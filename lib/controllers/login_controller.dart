import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:room_booking_app/api_services/api_service.dart';
import 'package:room_booking_app/controllers/app_controllers/app_main_controller.dart';
import 'package:room_booking_app/models/login_model.dart';

class loginController extends GetxController {
  RxString email = ''.obs;
  RxString password = ''.obs;
  String token = "";
  String role = "";
  UserDetails? user;

  Future<void> loginUser() async {
    // throw Exception();
    http.Response response = await http.post(
      Uri.parse('${ApiService.baseUrl}/api/users/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "email": email.value,
        "password": password.value,
      }),
    );
    if (response.statusCode != 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      String message = result['message'];
      AppController.setmessage(message);
    }
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      user = UserDetails.fromJson(result['userDetails']);
      // AppController.setmessage(null);

      // // List userValue = result['userDeatils'];
      // // emailId.value = userValue[0]['emailId'];

      token = result['token'];
      int mainUid = user!.id;
      AppController.setMainUid(mainUid);
      print('******$token');
      AppController.setaccessToken(token);

      role = user!.role;
      // AppController.setRole(role);
      // // Get.offAll(UserDetailsScreen());
    }
  }

  // void logout() {
  //   user = null;
  //   token = "";
  //   emailId.value = "";
  //   password.value = "";
  //   role = "";
  //   AppController.setaccessToken("");
  //   AppController.setRole("");
  // }

  // void resetControllers() {
  //   Get.reset();
  // }
}
