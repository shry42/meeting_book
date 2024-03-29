import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:room_booking_app/controllers/user_controllers/getall_users_controller.dart';
import 'package:room_booking_app/defined_pages/superadmin_pages/add_user_screen.dart';
import 'package:room_booking_app/defined_pages/superadmin_pages/update_user.dart';

import 'package:room_booking_app/utils/widgets/users_list_card.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class UserLists extends StatefulWidget {
  const UserLists({super.key, required this.title});

  final String title;

  @override
  State<UserLists> createState() => _UserListsState();
}

final GetAllUsersController gauc = GetAllUsersController();

class _UserListsState extends State<UserLists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 213, 231, 214),
      // automaticallyImplyLeading: false,
      // shadowColor: Colors.black87,
      // elevation: 1,
      body: Column(children: [
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
                const Spacer(),
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
                      Get.to(AddUserScreen(title: 'Add User'));
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
                              'Add Users',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: FutureBuilder(
            future: gauc.getUsers(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 50),
                      CircularProgressIndicator(),
                      SizedBox(height: 10),
                      Text('Loading users...'),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 100),
                      Icon(Icons.error, color: Colors.red),
                      SizedBox(height: 60),
                      Text(
                          '    Error loading users\nPlease try again by logging out'),
                    ],
                  ),
                );
              } else if (snapshot.data == null || snapshot.data.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 65),
                      Text('No users to show\ncreate users first!'),
                    ],
                  ),
                );
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        // reverse: true,
                        itemBuilder: (ctx, index) => GestureDetector(
                          onTap: () async {
                            String firstName = snapshot.data[index].firstName;
                            String lastName = snapshot.data[index].lastName;
                            String email = snapshot.data[index].email;
                            String mobileNo = snapshot.data[index].mobileNo;
                            int id = snapshot.data[index].id;
                            Get.to(UpdateUserScreen(
                              title: 'Update user',
                              firstName: firstName,
                              lastName: lastName,
                              email: email,
                              mobileNo: mobileNo,
                              id: id,
                            ));
                          },
                          child: UsersListCard(
                            ht: 121,
                            wd: 350,
                            duration: 1,
                            name:
                                '${snapshot.data[index].firstName} ${snapshot.data[index].lastName}',
                            emailId: snapshot.data[index].email.toString(),
                            mobile: snapshot.data[index].mobileNo.toString(),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ]),
    );
  }
}
