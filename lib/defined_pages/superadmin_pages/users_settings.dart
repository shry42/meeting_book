import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:room_booking_app/controllers/app_controllers/app_main_controller.dart';
import 'package:room_booking_app/controllers/superadmin_controllers/create_room_controller.dart';
import 'package:room_booking_app/defined_pages/login_page.dart';
import 'package:room_booking_app/defined_pages/superadmin_pages/reset_password_dialog.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen({super.key, required this.title});

  final String title;

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 213, 231, 214),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 40),
          GlassContainer(
            height: 50,
            width: double.infinity,
            blur: 10,
            color: Colors.white.withOpacity(0.1),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.withOpacity(0.8),
                const Color.fromARGB(255, 242, 236, 236).withOpacity(0.9),
              ],
            ),
            //--code to remove border
            border: const Border.fromBorderSide(BorderSide.none),
            shadowStrength: 10,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            shadowColor: Colors.white.withOpacity(0.24),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(Get.defaultDialog(
                    backgroundColor: Color.fromARGB(255, 195, 215, 196),
                    title: 'Reset Password !',
                    content: DialogBox(),
                  ));
                },
                child: const ListTile(
                  tileColor: Color.fromARGB(255, 175, 233, 108),
                  leading: Icon(Icons.change_circle_outlined),
                  title: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Change Password',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Get.offAll(LoginPage());
                  AppController.setMainUid(null);
                  AppController.setRole(null);
                  AppController.setParticipantId(null);
                  AppController.setmeetingId(null);
                  AppController.setaccessToken(null);
                  AppController.setmessage(null);
                },
                child: const ListTile(
                  tileColor: Color.fromARGB(255, 175, 233, 108),
                  leading: Icon(Icons.power_settings_new_rounded),
                  title: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Logout',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
