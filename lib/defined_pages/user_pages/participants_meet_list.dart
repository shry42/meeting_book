import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:http/http.dart' as http;
import 'package:room_booking_app/controllers/app_controllers/app_main_controller.dart';
import 'package:room_booking_app/controllers/user_controllers/delete_meeting_controller.dart';
import 'package:room_booking_app/controllers/user_controllers/delete_participant_controller.dart';
import 'package:room_booking_app/controllers/user_controllers/get_meeting_participants_controller.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ParticipantsMeetListScreen extends StatefulWidget {
  ParticipantsMeetListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ParticipantsMeetListScreen> createState() =>
      _ParticipantsMeetListScreenState();
}

class _ParticipantsMeetListScreenState
    extends State<ParticipantsMeetListScreen> {
  final GetMeetingParticipantsController pc =
      GetMeetingParticipantsController();

  final DeleteMeetingController dc = DeleteMeetingController();

  final DeleteParticipantController dpc = DeleteParticipantController();

  // get doNothing => null;
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
                  if (AppController.role == 'user')
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
                        onTap: () async {
                          await dc.deleteMeeting();
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
                                  'Delete meeting',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
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
          FutureBuilder(
            future: pc.getParticipantsMeetList(),
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
                      Text('Loading Participants...'),
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
                          '    Error loading participants\nPlease try again by logging out'),
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
                      Text('No participants to show\n              try again!'),
                    ],
                  ),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (ctx, index) => Container(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      child: ListTile(
                        tileColor: const Color.fromARGB(255, 175, 233, 108),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                '${snapshot.data[index].firstName} ${snapshot.data[index].lastName}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        trailing: GestureDetector(
                            onTap: () async {
                              int userId = snapshot.data[index].id;
                              AppController.setParticipantId(userId);
                              await dpc.deleteParticipantMeeting();
                              setState(() {});
                            },
                            child: (snapshot.data[index].id !=
                                        AppController.mainUid) &&
                                    AppController.role != 'superAdmin'
                                ? const Icon(Icons.delete)
                                : const SizedBox()),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
