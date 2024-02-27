import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:room_booking_app/controllers/user_controllers/my_meetings_get_controller.dart';
import 'package:room_booking_app/defined_pages/user_pages/create_meeting_user.dart';
import 'package:room_booking_app/utils/widgets/my_meetings_user_card.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class MyMeetingsScreen extends StatelessWidget {
  MyMeetingsScreen({super.key, required this.title});

  final String title;

  final MyMeetingsGetController meetCont = MyMeetingsGetController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // automaticallyImplyLeading: false,
      // shadowColor: Colors.black87,
      // elevation: 1,
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
                    title,
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
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 45,
            width: 360,
            child: TextField(
              // controller: searchController,
              onChanged: (value) {
                // setState(() {
                //   if (value.isEmpty) {
                //     dataList = mainDataList; // Reset to show all data
                //   } else {
                //     dataList = mainDataList
                //         ?.where((element) => element.POTxnID.toString()
                //             .contains(value.toString()))
                //         .toList();
                //   }
                // });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 233, 239, 226),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search for meeting",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
              child: Expanded(
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
                        Text('No Meetings to show\nCreate one!'),
                      ],
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (ctx, index) => MyMeetingsUserCard(
                            ht: 200,
                            wd: 350,
                            duration: 1,
                            userName:
                                '${snapshot.data[index].firstName} ${snapshot.data[index].lastName}',
                            roomName: snapshot.data[index].name.toString(),
                            date: snapshot.data[index].date.toString(),
                            startTime:
                                snapshot.data[index].startTime.toString(),
                            endTime: snapshot.data[index].endTime.toString(),
                            suggestion:
                                snapshot.data[index].suggestion.toString(),
                            additionalComments: snapshot
                                .data[index].additionalComments
                                .toString(),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ))
        ],
      ),
    );
  }
}
