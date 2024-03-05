import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:room_booking_app/bottom_navigation/bottom_navigation_bar.dart';
import 'package:room_booking_app/controllers/bottom_nav_controller.dart';
import 'package:room_booking_app/controllers/superadmin_controllers/update_room_controller.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class UpdateRoomsScreen extends StatefulWidget {
  const UpdateRoomsScreen(
      {super.key,
      required this.title,
      required this.name,
      required this.floor,
      required this.seatingCapacity,
      required this.roomDetails,
      required this.meetingType,
      required this.id});

  final String title;
  final String name, floor, roomDetails, meetingType;
  final int seatingCapacity, id;

  @override
  State<UpdateRoomsScreen> createState() => _UpdateRoomsScreenState();
}

class _UpdateRoomsScreenState extends State<UpdateRoomsScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController floorController = TextEditingController();

  final TextEditingController seatingCapacityController =
      TextEditingController();

  final TextEditingController roomDetailsController = TextEditingController();

  final TextEditingController meetingTypeController = TextEditingController();

  final UpdateRoomController urc = UpdateRoomController();

  final BottomNavigationController bnc = BottomNavigationController();

  @override
  void initState() {
    super.initState();
    // Set initial values for the controllers
    nameController.text = widget.name;
    floorController.text = widget.floor;
    seatingCapacityController.text = widget.seatingCapacity.toString();
    roomDetailsController.text = widget.roomDetails;
    meetingTypeController.text = widget.meetingType;
  }

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
                    widget.title,
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
                      onTap: () async {
                        await urc.updateRoomDetails(
                            nameController.text,
                            floorController.text,
                            roomDetailsController.text,
                            meetingTypeController.text,
                            int.parse(seatingCapacityController.text),
                            widget.id,
                            0);
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
                                'Delete',
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
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  child: TextFormField(
                    controller: nameController,
                    onChanged: (value) {
                      // AppController.setemailId(emailController.text);
                      // c.userName.value = emailController.text;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Meeting room name',
                      // hintText: 'username',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty || value == "") {
                        return 'Please enter a valid room name';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          labelText: 'Select Floor',
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: floorController.text,
                            isDense: true,
                            onChanged: (String? newValue) {
                              // Update the value in the controller
                              setState(() {
                                floorController.text = newValue ?? '';
                              });
                            },
                            items: <String>['Ground', 'First', 'Second']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty || value == "") {
                        return 'Please select floor';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: TextFormField(
                    controller: seatingCapacityController,
                    onChanged: (value) {
                      // AppController.setemailId(emailController.text);
                      // c.userName.value = emailController.text;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Seating Capacity',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty || value == "") {
                        return 'Please enter a valid capacity';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: TextFormField(
                    controller: roomDetailsController,
                    onChanged: (value) {
                      // AppController.setemailId(emailController.text);
                      // c.userName.value = emailController.text;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Meeting room specifications',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty || value == "") {
                        return 'Please enter a room specifications';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          labelText: 'Select meeting Type',
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: meetingTypeController.text,
                            isDense: true,
                            onChanged: (String? newValue) {
                              // Update the value in the controller
                              setState(() {
                                meetingTypeController.text = newValue ?? '';
                              });
                            },
                            items: <String>[
                              'External',
                              'Internal',
                              'External/Internal'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty || value == "") {
                        return 'Please meeting type';
                      }
                      return null;
                    },
                  ),
                ),

                // add buttton below

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
                      onPressed: () async {
                        urc.updateRoomDetails(
                            nameController.text,
                            floorController.text,
                            roomDetailsController.text,
                            meetingTypeController.text,
                            int.parse(seatingCapacityController.text),
                            widget.id,
                            1);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'Update',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
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
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
