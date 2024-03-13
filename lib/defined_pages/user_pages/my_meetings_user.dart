import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:room_booking_app/controllers/app_controllers/app_main_controller.dart';
import 'package:room_booking_app/controllers/login_controller.dart';
import 'package:room_booking_app/controllers/user_controllers/my_meetings_get_controller.dart';
import 'package:room_booking_app/defined_pages/login_page.dart';
import 'package:room_booking_app/defined_pages/superadmin_pages/reset_password_dialog.dart';
import 'package:room_booking_app/defined_pages/user_pages/create_meeting_user.dart';
import 'package:room_booking_app/defined_pages/user_pages/participants_meet_list.dart';
import 'package:room_booking_app/utils/widgets/my_meetings_user_card.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class MyMeetingsScreen extends StatefulWidget {
  const MyMeetingsScreen({super.key, required this.title});

  final String title;

  @override
  State<MyMeetingsScreen> createState() => _MyMeetingsScreenState();
}

class _MyMeetingsScreenState extends State<MyMeetingsScreen> {
  // TutorialCoachMark? tutorialCoachMark;
  // List<TargetFocus> targets = [];
  // GlobalKey profileKey = GlobalKey();
  // GlobalKey cardKey = GlobalKey();
  final MyMeetingsGetController meetCont = MyMeetingsGetController();

  // @override
  // void initState() {
  //   Future.delayed(const Duration(seconds: 1), () {
  //     _showTutorialCoachMark();
  //   });
  //   super.initState();
  // }

  // void _showTutorialCoachMark() {
  //   _initTarget();
  //   tutorialCoachMark = TutorialCoachMark(
  //     targets: targets,
  //   )..show(context: context);
  // }

//   void _initTarget() {
//     targets = [
// //profile
//       TargetFocus(
//           identify: "card-key",
//           // shape: ShapeLightFocus.RRect,
//           keyTarget: cardKey,
//           contents: [
//             TargetContent(
//                 align: ContentAlign.bottom,
//                 builder: (context, controller) {
//                   // return Container();
//                   return Center(
//                     child: CoachmarkDesc(
//                       text: '                          Tap to view details',
//                       onNext: () {
//                         controller.next();
//                       },
//                       onSkip: () {
//                         controller.skip();
//                       },
//                     ),
//                   );
//                 }),
//           ]),

// //profiile
//       TargetFocus(
//           identify: "profile-key",
//           // shape: ShapeLightFocus.RRect,
//           keyTarget: profileKey,
//           contents: [
//             TargetContent(
//                 align: ContentAlign.bottom,
//                 builder: (context, controller) {
//                   // return Container();
//                   return Center(
//                     child: CoachmarkDesc(
//                       text: 'click to choose profile action',
//                       onNext: () {
//                         controller.next();
//                       },
//                       onSkip: () {
//                         controller.skip();
//                       },
//                     ),
//                   );
//                 }),
//           ]),
//     ];
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 213, 231, 214),
      body: Column(
        children: [
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
                        Get.to(
                            const CreateMeetingsUser(title: 'Create Meetings'));
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
                                'Create Meetings',
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
                  // Shimmer(
                  //   duration: const Duration(seconds: 2),
                  //   // This is NOT the default value. Default value: Duration(seconds: 0)
                  //   interval: const Duration(milliseconds: 20),
                  //   // This is the default value
                  //   color: Colors.white,
                  //   // This is the default value
                  //   colorOpacity: 1,
                  //   // This is the default value
                  //   enabled: true,
                  //   // This is the default value
                  //   direction: const ShimmerDirection.fromLTRB(),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       Get.to(Get.defaultDialog(
                  //         backgroundColor: Color.fromARGB(255, 195, 215, 196),
                  //         title: 'Reset Password !',
                  //         content: DialogBox(),
                  //       ));
                  //     },
                  //     child: Container(
                  //       height: 30,
                  //       width: 100,
                  //       decoration: BoxDecoration(
                  //           border: Border.all(),
                  //           color: Colors.white70,
                  //           borderRadius: BorderRadius.circular(6)),
                  //       child: const Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           Center(
                  //             child: Text(
                  //               'Reset Password',
                  //               style: TextStyle(
                  //                   color: Colors.black, fontSize: 12),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  PopupMenuButton<String>(
                    // key: profileKey,
                    onSelected: (value) {
                      // Handle menu item selection
                      if (value == 'changePassword') {
                        Get.to(Get.defaultDialog(
                          backgroundColor:
                              const Color.fromARGB(255, 195, 215, 196),
                          title: 'Reset Password !',
                          content: DialogBox(),
                        ));
                      } else if (value == 'logout') {
                        Get.offAll(LoginPage());
                        AppController.setMainUid(null);
                        AppController.setRole(null);
                        AppController.setParticipantId(null);
                        AppController.setmeetingId(null);
                        AppController.setaccessToken(null);
                        AppController.setmessage(null);
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem<String>(
                        value: 'changePassword',
                        child: Text('Change Password'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'logout',
                        child: Text('Logout'),
                      ),
                    ],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: const Color.fromARGB(255, 233, 239, 227),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // SizedBox(
          //   height: 45,
          //   width: 360,
          //   child: TextField(
          //     // controller: searchController,
          //     onChanged: (value) {
          //       // setState(() {
          //       //   if (value.isEmpty) {
          //       //     dataList = mainDataList; // Reset to show all data
          //       //   } else {
          //       //     dataList = mainDataList
          //       //         ?.where((element) => element.POTxnID.toString()
          //       //             .contains(value.toString()))
          //       //         .toList();
          //       //   }
          //       // });
          //     },
          //     decoration: InputDecoration(
          //       filled: true,
          //       fillColor: const Color.fromARGB(255, 233, 239, 226),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(8),
          //         borderSide: BorderSide.none,
          //       ),
          //       hintText: "Search for meeting",
          //       prefixIcon: const Icon(Icons.search),
          //       prefixIconColor: Colors.black,
          //     ),
          //   ),
          // ),
          const SizedBox(height: 12),
          Expanded(
            child: FutureBuilder(
              future: meetCont.getMeetDetails(),
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
                        Text('Loading Meetings...'),
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
                            'Error loading meetings\nPlease try again by logging out'),
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
                        Text('No Meetings to show\n       Create one!'),
                      ],
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (ctx, index) => GestureDetector(
                            onTap: () async {
                              int meetingId = snapshot.data[index].id;
                              AppController.setmeetingId(meetingId);
                              Get.to(const ParticipantsMeetListScreen(
                                  title: 'Participants'));
                            },
                            child: MyMeetingsUserCard(
                              // key: cardKey,
                              ht: 250,
                              wd: 350,
                              duration: 1,
                              userName:
                                  '${snapshot.data[index].firstName} ${snapshot.data[index].lastName}',
                              roomName: snapshot.data[index].name.toString(),
                              date: snapshot.data[index].date.toString(),
                              startTime:
                                  snapshot.data[index].startTime.toString(),
                              endTime: snapshot.data[index].endTime.toString(),
                              purpose: snapshot.data[index].purpose.toString(),
                              meetingType:
                                  snapshot.data[index].meetingType.toString(),
                              suggestion:
                                  snapshot.data[index].suggestion.toString(),
                              additionalComments: snapshot
                                  .data[index].additionalComments
                                  .toString(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class CoachmarkDesc extends StatefulWidget {
  const CoachmarkDesc({
    super.key,
    required this.text,
    this.skip = "Skip",
    this.next = "Next",
    this.onSkip,
    this.onNext,
  });

  final String text;
  final String skip;
  final String next;
  final void Function()? onSkip;
  final void Function()? onNext;

  @override
  State<CoachmarkDesc> createState() => _CoachmarkDescState();
}

class _CoachmarkDescState extends State<CoachmarkDesc> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        // color: const Color.fromARGB(255, 67, 65, 65),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                onPressed: widget.onSkip,
                child: Text(widget.skip),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(66, 118, 116, 116)),
                onPressed: widget.onNext,
                child: const Text('next'),
              ),
            ]),
          ]),
    );
  }
}
