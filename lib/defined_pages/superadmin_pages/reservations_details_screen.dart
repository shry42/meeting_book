import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:room_booking_app/utils/widgets/reservation_card.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // automaticallyImplyLeading: false,
      // shadowColor: Colors.black87,
      // elevation: 1,

      body: SingleChildScrollView(
        child: Column(
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
                  fillColor: Color.fromARGB(255, 233, 239, 226),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search for PoTxnId",
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const reservation_card(
                ht: 200,
                wd: 350,
                duration: 1,
                userName: 'Shravan Yadav',
                roomName: 'Separator',
                date: 'Feb 22, 2024',
                startTime: '20:43',
                endTime: '21:43',
                suggestion: 'All good',
                additionalComments: 'Nothing yet'),
          ],
        ),
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
