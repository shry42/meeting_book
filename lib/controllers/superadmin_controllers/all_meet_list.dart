import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:room_booking_app/api_services/api_service.dart';
import 'package:room_booking_app/controllers/app_controllers/app_main_controller.dart';
import 'package:room_booking_app/models/user_model/my_meetings_get_model.dart';

class AllMeetingsGetController extends GetxController {
  List<MyMeetingsGetModel> allMeetListObj = [];

  Future getAllMeetDetails() async {
    http.Response response = await http.get(
      Uri.parse('${ApiService.baseUrl}/api/rooms/getAllMeetings'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppController.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      List<dynamic> data = result['data'];

      allMeetListObj = data.map((e) => MyMeetingsGetModel.fromJson(e)).toList();

      return allMeetListObj;
    }
  }
}
