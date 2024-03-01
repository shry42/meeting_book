import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:room_booking_app/controllers/app_controllers/app_main_controller.dart';
import 'package:room_booking_app/controllers/superadmin_controllers/all_meet_list.dart';
import 'package:room_booking_app/defined_pages/superadmin_pages/reset_password_dialog.dart';
import 'package:room_booking_app/defined_pages/user_pages/participants_meet_list.dart';
import 'package:room_booking_app/utils/widgets/my_meetings_user_card.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ReservationScreen extends StatelessWidget {
  ReservationScreen({super.key, required this.title});
  final AllMeetingsGetController amc = AllMeetingsGetController();

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            border: Border.fromBorderSide(BorderSide.none),
            shadowStrength: 10,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            shadowColor: Colors.white.withOpacity(0.24),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            height: 45,
            width: 360,
            child: TextField(
              // controller: searchController,
              onChanged: (value) {},
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 233, 239, 226),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search for Name",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: FutureBuilder(
              future: amc.getAllMeetDetails(),
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
                        Text('No Meetings to show'),
                      ],
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      // const Text('click on card to view participants'),
                      // SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (ctx, index) => GestureDetector(
                            onTap: () async {
                              int meetingId = snapshot.data[index].id;
                              AppController.setmeetingId(meetingId);
                              Get.to(ParticipantsMeetListScreen(
                                  title: 'Participants List'));
                            },
                            child: MyMeetingsUserCard(
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
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
