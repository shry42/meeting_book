import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:room_booking_app/api_services/api_service.dart';
import 'package:room_booking_app/controllers/app_controllers/app_main_controller.dart';
import 'package:room_booking_app/models/user_model/get_all_user_model.dart';

import '../../models/user_model/get_all_rooms_model.dart';

class GetAllUsersController extends GetxController {
  // RxInt id = 0.obs;
  // RxString name = ''.obs;
  // RxInt createdBy = 0.obs;
  // RxString createdAt = ''.obs;
  // RxInt isActive = 0.obs;
  // RxString floor = ''.obs;
  // RxInt seatingCapacity = 0.obs;
  // RxString RoomsGetModelDetails = ''.obs;
  // RxString meetingType = ''.obs;

  List<GetAllUserDetailsModel> userListObj = [];

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
}
