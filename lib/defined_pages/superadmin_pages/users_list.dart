import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:room_booking_app/defined_pages/superadmin_pages/update_user.dart';
import 'package:room_booking_app/utils/widgets/update_user_card.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class UserLists extends StatelessWidget {
  const UserLists({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // automaticallyImplyLeading: false,
      // shadowColor: Colors.black87,
      // elevation: 1,
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
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const UpdateUserScreen(title: 'Update user'));
                  },
                  child: const UpdateUserCard(
                    ht: 120,
                    wd: 300,
                    duration: 1,
                    name: 'Shravan Yadav',
                    emailId: 'shravan.y@gegadyne.com',
                    mobile: '9892813430',
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),

      backgroundColor: Colors.transparent,
      // body: Center(
      //   child: Text(
      //     title,
      //     style: const TextStyle(
      //       fontSize: 100,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
    );
  }
}
