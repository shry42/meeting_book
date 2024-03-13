// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:glassmorphism_ui/glassmorphism_ui.dart';
// import 'package:room_booking_app/controllers/app_controllers/app_main_controller.dart';
// import 'package:room_booking_app/controllers/superadmin_controllers/all_meet_list.dart';
// import 'package:room_booking_app/controllers/user_controllers/create_meeting_get_room_users_controller.dart';
// import 'package:room_booking_app/controllers/user_controllers/my_meetings_get_controller.dart';
// import 'package:room_booking_app/defined_pages/login_page.dart';
// import 'package:room_booking_app/defined_pages/superadmin_pages/reset_password_dialog.dart';
// import 'package:room_booking_app/defined_pages/user_pages/my_meetings_user.dart';

// class UserSettingsScreen extends StatefulWidget {
//   const UserSettingsScreen({super.key, required this.title});
//   final String title;

//   @override
//   State<UserSettingsScreen> createState() => _UserSettingsScreenState();
// }

// final CreateMeetingUserController mc = Get.put(CreateMeetingUserController());
// final MyMeetingsGetController meetCont = MyMeetingsGetController();

// // final AllMeetingsGetController amc = AllMeetingsGetController();

// List<dynamic> usersList = [];
// List<dynamic> roomsList = [];
// List<dynamic> meetingsList = [];

// class _UserSettingsScreenState extends State<UserSettingsScreen> {
//   Future<void> fetchData() async {
//     // Call multiple asynchronous methods using Future.wait
//     await Future.wait(
//         [mc.getRooms(), mc.getUsers(), meetCont.getMeetDetails()]);
//     setState(() {
//       usersList = mc.userListObj;
//       roomsList = mc.roomListObj;
//       meetingsList = meetCont.myMeetListObj;
//     });
//   }

//   @override
//   void initState() {
//     fetchData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 213, 231, 214),
//       body: Stack(children: [
//         Column(children: [
//           GlassImage(
//             height: 250,
//             width: double.infinity,
//             blur: 4,
//             image: Image.network(
//               "https://img.freepik.com/free-vector/gradient-background-with-green-tones_23-2148357100.jpg",
//               fit: BoxFit.cover,
//             ),
//             overlayColor: Colors.white.withOpacity(0.1),
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Colors.white.withOpacity(0.2),
//                 Colors.blue.withOpacity(0.3),
//               ],
//             ),
//             border: const Border.fromBorderSide(BorderSide.none),
//             shadowStrength: 5,
//             borderRadius: BorderRadius.circular(25),
//             shadowColor: Colors.white.withOpacity(0.24),
//           ),
//         ]),
//         Positioned(
//           top: 60,
//           left: 50,
//           right: 50,
//           child: Column(
//             children: [
//               const CircleAvatar(
//                 backgroundColor: Colors.white,
//                 radius: 40,
//                 child: CircleAvatar(
//                   backgroundColor: Color.fromARGB(179, 232, 230, 230),
//                   radius: 35,
//                   backgroundImage: AssetImage('assets/images/user.png'),
//                 ),
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 '${AppController.userName}',
//                 style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 '${AppController.email}',
//                 style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           top: 200,
//           left: 30,
//           right: 30,
//           child: Container(
//             // height: 180,
//             height: 285,
//             width: 300,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(30),
//             ),
//             child: Column(
//               children: [
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Column(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: const Color.fromARGB(255, 235, 249, 234),
//                           ),
//                           height: 90,
//                           width: 80,
//                           child: const Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               CircleAvatar(
//                                 backgroundColor: Colors.white,
//                                 radius: 30,
//                                 child: CircleAvatar(
//                                   radius: 25,
//                                   child: Icon(Icons.people),
//                                 ),
//                               ),
//                               Text('users')
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: const Color.fromARGB(255, 235, 249, 234),
//                           ),
//                           height: 30,
//                           width: 80,
//                           child: Center(child: Text('${usersList.length}')),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: const Color.fromARGB(255, 235, 249, 234),
//                           ),
//                           height: 90,
//                           width: 80,
//                           child: const Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               CircleAvatar(
//                                 backgroundColor: Colors.white,
//                                 radius: 30,
//                                 child: CircleAvatar(
//                                   radius: 25,
//                                   child: Icon(Icons.meeting_room),
//                                 ),
//                               ),
//                               Text('meetings')
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: const Color.fromARGB(255, 235, 249, 234),
//                           ),
//                           height: 30,
//                           width: 80,
//                           child: Center(
//                             // child: Text('${AppController.noOfMeetings}'),
//                             child: Text(meetingsList.length.toString()),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: const Color.fromARGB(255, 235, 249, 234),
//                           ),
//                           height: 90,
//                           width: 80,
//                           child: const Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               CircleAvatar(
//                                 backgroundColor: Colors.white,
//                                 radius: 30,
//                                 child: CircleAvatar(
//                                   radius: 25,
//                                   child: Icon(Icons.roofing_outlined),
//                                 ),
//                               ),
//                               Text('rooms')
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: const Color.fromARGB(255, 235, 249, 234),
//                           ),
//                           height: 30,
//                           width: 80,
//                           child: Center(child: Text('${roomsList.length}')),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(270, 45), //////// HERE
//                       backgroundColor: const Color.fromARGB(255, 235, 249, 234),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0)),
//                     ),
//                     onPressed: () async {
//                       await Get.offAll(MyMeetingsScreen(title: 'My Meetings'));
//                     },
//                     child: const Text(
//                       'View My Meetings',
//                       style: TextStyle(color: Colors.black),
//                     )),
//                 const SizedBox(height: 10),
//                 ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 235, 249, 234),
//                       minimumSize: const Size(270, 45), //////// HERE
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0)),
//                     ),
//                     onPressed: () {},
//                     child: const Text('Create Meetings',
//                         style: TextStyle(color: Colors.black))),
//                 // Container(
//                 //   decoration: BoxDecoration(
//                 //     borderRadius: BorderRadius.circular(10),
//                 //     color: const Color.fromARGB(255, 235, 249, 234),
//                 //   ),
//                 //   height: 40,
//                 //   width: 270,
//                 //   child: Center(child: Text('role :  ${AppController.role}')),
//                 // ),
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//             top: 510,
//             left: 40,
//             right: 40,
//             child: Column(
//               children: [
//                 ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(300, 50), //////// HERE
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0)),
//                     ),
//                     onPressed: () {
//                       Get.to(Get.defaultDialog(
//                         backgroundColor:
//                             const Color.fromARGB(255, 195, 215, 196),
//                         title: 'Reset Password !',
//                         content: DialogBox(),
//                       ));
//                     },
//                     child: const Text('Change Password')),
//                 const SizedBox(height: 15),
//                 ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(300, 50), //////// HERE
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0)),
//                     ),
//                     onPressed: () {
//                       AppController.setMainUid(null);
//                       AppController.setRole(null);
//                       AppController.setParticipantId(null);
//                       AppController.setmeetingId(null);
//                       AppController.setaccessToken(null);
//                       AppController.setmessage(null);
//                       Get.offAll(LoginPage());
//                     },
//                     child: const Text('Log out')),
//               ],
//             )),
//       ]),
//     );
//   }
// }
