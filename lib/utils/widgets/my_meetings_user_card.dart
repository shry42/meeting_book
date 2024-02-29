import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class MyMeetingsUserCard extends StatelessWidget {
  const MyMeetingsUserCard({
    Key? key,
    this.ht,
    this.wd,
    this.duration,
    required this.userName,
    required this.roomName,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.suggestion,
    required this.additionalComments,
    required this.purpose,
    required this.meetingType,
  }) : super(key: key);

  final double? ht;
  final double? wd;
  final dynamic duration;
  final String userName;
  final String roomName;
  final String date;
  final String startTime;
  final String endTime;
  final String purpose;
  final String meetingType;
  final String suggestion;
  final String additionalComments;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          elevation: 8,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(25),
          ),
          //  color: Color.fromARGB(243, 199, 80, 11),
          // //color: Colors.red,
          child: AnimatedContainer(
            duration: Duration(milliseconds: duration),
            height: ht,
            width: wd,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(243, 56, 232, 68),
                  Color.fromARGB(255, 151, 223, 126),
                ],
              ),
            ),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 18),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'UserName   :   $userName',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, left: 18),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Room Name :  $roomName',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, left: 18),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Date :  $date',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, left: 18),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'StartTime :  $startTime',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, left: 18),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'EndTime :  $endTime',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, left: 18),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Purpose :  $purpose',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, left: 18),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Meeting Type :  $meetingType',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, left: 18),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Suggestions for improvement :  $suggestion',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, left: 18),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Additional comments :  $additionalComments',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ]),
              //
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
