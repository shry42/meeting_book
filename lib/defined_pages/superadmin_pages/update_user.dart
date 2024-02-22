import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:room_booking_app/defined_pages/superadmin_pages/reset_password_dialog.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class UpdateUserScreen extends StatelessWidget {
  const UpdateUserScreen({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // automaticallyImplyLeading: false,
      // shadowColor: Colors.black87,
      // elevation: 1,
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
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Shimmer(
                    duration: const Duration(seconds: 2),
                    // This is NOT the default value. Default value: Duration(seconds: 0)
                    interval: const Duration(milliseconds: 20),
                    // This is the default value
                    color: Colors.white,
                    // This is the default value
                    colorOpacity: 1,
                    // This is the default value
                    enabled: true,
                    // This is the default value
                    direction: const ShimmerDirection.fromLTRB(),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(Get.defaultDialog(
                          backgroundColor:
                              const Color.fromARGB(255, 213, 231, 214),
                          title: 'Change Password',
                          content: DialogBox(),
                        ));
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(6)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Change Password',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: TextFormField(
              // controller: emailController,
              onChanged: (value) {
                // AppController.setemailId(emailController.text);
                // c.userName.value = emailController.text;
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: 'First Name',
                // hintText: 'username',
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value == "") {
                  return 'Please enter a valid Name';
                }

                return null;
              },
            ),
          ),
          Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: TextFormField(
              // controller: emailController,
              onChanged: (value) {
                // AppController.setemailId(emailController.text);
                // c.userName.value = emailController.text;
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: 'Last Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value == "") {
                  return 'Please enter a valid lastName';
                }

                return null;
              },
            ),
          ),
          Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: TextFormField(
              // controller: emailController,
              onChanged: (value) {
                // AppController.setemailId(emailController.text);
                // c.userName.value = emailController.text;
              },
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: 'Email address',
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value == "") {
                  return 'Please enter a valid emailid';
                }

                return null;
              },
            ),
          ),
          Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: TextFormField(
              // controller: emailController,
              onChanged: (value) {
                // AppController.setemailId(emailController.text);
                // c.userName.value = emailController.text;
              },
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: 'MobileNumber',
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value == "") {
                  return 'Please enter a valid mobile number';
                }

                return null;
              },
            ),
          ),
          const SizedBox(height: 35),
          Shimmer(
            duration: const Duration(seconds: 2),
            // This is NOT the default value. Default value: Duration(seconds: 0)
            interval: const Duration(seconds: 1),
            // This is the default value
            color: Colors.white,
            // This is the default value
            colorOpacity: 1,
            // This is the default value
            enabled: true,
            // This is the default value
            direction: const ShimmerDirection.fromLTRB(),
            child: Container(
              height: 42,
              width: 160,
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(30)),
              child: ElevatedButton(
                onPressed: () async {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ),
                    Icon(
                      Icons.energy_savings_leaf,
                      color: Color.fromARGB(255, 78, 225, 83),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ]),
      ),

      // backgroundColor: Colors.transparent,
    );
  }
}
