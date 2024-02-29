import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:room_booking_app/controllers/superadmin_controllers/create_room_controller.dart';
import 'package:room_booking_app/defined_pages/superadmin_pages/rooms_list.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CreateRoomScreen extends StatefulWidget {
  CreateRoomScreen({super.key, required this.title});

  final String title;

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  TextEditingController roomNameController = TextEditingController();

  TextEditingController floorController = TextEditingController();

  TextEditingController seatingCapacityController = TextEditingController();

  TextEditingController roomDetailsController = TextEditingController();

  TextEditingController meetingTypeController = TextEditingController();

  final CreateRoomController crc = CreateRoomController();

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
                    controller: roomNameController,
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
                            value: state.value,
                            isDense: true,
                            onChanged: (String? newValue) {
                              state.didChange(newValue);
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
                          labelText: 'Select Meeting Type',
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: state.value,
                            isDense: true,
                            onChanged: (String? newValue) {
                              state.didChange(newValue);
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
                        return 'Please select meeting type';
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
                        // Retrieve values from controllers
                        String roomName = roomNameController.text;
                        String floor = floorController.text;
                        int seatingCapacity =
                            int.tryParse(seatingCapacityController.text) ?? 0;
                        String roomDetails = roomDetailsController.text;
                        String meetingType = meetingTypeController.text;

                        // Call createRoom method
                        await crc.createRoom(
                          roomName,
                          floor,
                          roomDetails,
                          meetingType,
                          seatingCapacity,
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'Add',
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
