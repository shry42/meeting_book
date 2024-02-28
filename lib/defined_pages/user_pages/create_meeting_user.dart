import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:room_booking_app/controllers/user_controllers/create_meeting_get_room_users_controller.dart';
import 'package:room_booking_app/defined_pages/user_pages/my_meetings_user.dart';
import 'package:room_booking_app/models/user_model/get_all_rooms_model.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CreateMeetingsUser extends StatefulWidget {
  const CreateMeetingsUser({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _CreateMeetingsUserState createState() => _CreateMeetingsUserState();
}

class _CreateMeetingsUserState extends State<CreateMeetingsUser> {
  String? _meetingType;
  String? _selectedRoom;
  late DateTime _date;
  String? _floor;
  String? _seatingCapacity;
  String? _meetingRoomSpecifications;
  late TimeOfDay _startTime;
  late TimeOfDay _endTime;
  String? _purpose;
  List<String>? _selectedParticipants; // New field for Select Participant
  dynamic _selectedRoomId;
  final _formKey = GlobalKey<FormState>();

  final CreateMeetingUserController mc = Get.put(CreateMeetingUserController());
  // final GetAllRoomsController allRoomCont = GetAllRoomsController();
  // List<String> participantsList = [
  //   'Participant 1',
  //   'Participant 2',
  //   'Participant 3',
  //   // ... Add more participants
  // ];

  List<dynamic> participantsList = [];

  Future<void> fetchData() async {
    // Call multiple asynchronous methods using Future.wait
    await Future.wait([mc.getRooms(), mc.getUsers()]);

    // setState(() {
    participantsList = mc.userListObj;
    // });
  }

  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
    _startTime = TimeOfDay.now();
    _endTime = TimeOfDay.now();
    // allRoomCont.getRooms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 213, 231, 214),
      body: FutureBuilder(
          // future: mc.getRooms(), // Assuming getRooms returns a Future
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child:
                      CircularProgressIndicator()); // Or any loading indicator
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return SingleChildScrollView(
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
                          const Color.fromARGB(255, 242, 236, 236)
                              .withOpacity(0.9),
                        ],
                      ),
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
                              interval: const Duration(milliseconds: 20),
                              color: Colors.white,
                              colorOpacity: 1,
                              enabled: true,
                              direction: const ShimmerDirection.fromLTRB(),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          'Create Meeting',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12),
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
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Meeting Type',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              value: _meetingType,
                              onChanged: (value) {
                                setState(() {
                                  _meetingType = value;
                                  mc.meetingType.value = value.toString();
                                });
                              },
                              items: <String>[
                                'External',
                                'Internal'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select meeting type';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            DropdownButtonFormField<int>(
                              decoration: InputDecoration(
                                labelText: 'Select Room',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              value: _selectedRoomId
                                  ?.id, // Use the id as the value
                              onChanged: (value) {
                                setState(() {
                                  _selectedRoomId = mc.roomListObj.firstWhere(
                                    (element) => element.id == value,
                                  );

                                  _selectedRoom = _selectedRoomId
                                      ?.name; // Update _selectedRoom with the name

                                  setRoomDetails(_selectedRoom);
                                  // mc.selectedRoomId.value = _selectedRoomId;

                                  mc.selectedRoomId.value = _selectedRoomId?.id;
                                  print(_selectedRoomId);
                                });
                                // Fetch and set room details based on the selected room
                              },
                              items: mc.roomListObj
                                  .map(
                                    (item) => DropdownMenuItem(
                                      value: item.id,
                                      child: Text(item.name),
                                    ),
                                  )
                                  .toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select meeting room';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: 'Floor',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              initialValue: _floor ?? 'floor',
                              onChanged: (value) {
                                setState(() {
                                  _floor = value;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter floor';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: 'Seating Capacity',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              initialValue:
                                  _seatingCapacity ?? 'seating capacity',
                              onChanged: (value) {
                                setState(() {
                                  _seatingCapacity = value;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter seating capacity';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              readOnly: true,
                              maxLines: null,
                              decoration: InputDecoration(
                                labelText: 'Meeting Room Specifications',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              initialValue: _meetingRoomSpecifications ??
                                  'room specifications',
                              onChanged: (value) {
                                setState(() {
                                  _meetingRoomSpecifications = value;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter meeting room specifications';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Start Time'),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          // labelText: 'Select Time',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () async {
                                              TimeOfDay? result =
                                                  await showTimePicker(
                                                context: context,
                                                initialTime: _startTime,
                                              );
                                              if (result != null) {
                                                setState(() {
                                                  _startTime = result;
                                                  mc.selectedStartTime = result;
                                                });
                                              }
                                            },
                                            icon: const Icon(Icons.access_time),
                                          ),
                                        ),
                                        readOnly: true,
                                        controller: TextEditingController(
                                          text:
                                              '${_startTime.hour}:${_startTime.minute}',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('End Time'),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          // labelText: 'Select Time',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () async {
                                              TimeOfDay? result =
                                                  await showTimePicker(
                                                context: context,
                                                initialTime: _endTime,
                                              );
                                              if (result != null) {
                                                setState(() {
                                                  _endTime = result;
                                                  mc.selectedEndTime = result;
                                                });
                                              }
                                            },
                                            icon: const Icon(Icons.access_time),
                                          ),
                                        ),
                                        readOnly: true,
                                        controller: TextEditingController(
                                          text:
                                              '${_endTime.hour}:${_endTime.minute}',
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please select end time';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Date',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              initialValue:
                                  _date.toLocal().toString().split(' ')[0],
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: _date,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2101),
                                );

                                if (pickedDate != null && pickedDate != _date) {
                                  setState(() {
                                    _date = pickedDate;
                                    mc.selectedDate.value =
                                        pickedDate.toString();
                                  });
                                }
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select date';
                                } else if (_date.isBefore(DateTime.now())) {
                                  return 'Please select date';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Please Select Purpose',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              value: _purpose,
                              onChanged: (value) {
                                setState(() {
                                  _purpose = value;
                                  if (_purpose != 'Meeting') {
                                    _selectedParticipants = null;
                                  }
                                  mc.selectedPurpose.value = value.toString();
                                });
                              },
                              items: <String>[
                                'Interview',
                                'Meeting',
                                'Vendor Meeting',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select purpose';
                                }
                                return null;
                              },
                            ),
                            if (_purpose == 'Meeting') ...[
                              const SizedBox(height: 17),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors
                                          .grey), // Customize the border color
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: MultiSelectDialogField<String>(
                                  searchable: true,
                                  items: participantsList
                                      .map(
                                        (participant) =>
                                            MultiSelectItem<String>(
                                          '${participant.firstName} ${participant.lastName}',
                                          '${participant.firstName} ${participant.lastName}',
                                        ),
                                      )
                                      .toList(),
                                  initialValue: [],
                                  onConfirm: (values) {
                                    setState(() {
                                      _selectedParticipants = values;
                                      // Assuming participantsList is a List<GetAllUserDetailsModel>
                                      mc.selectedParticipantsId.value =
                                          _selectedParticipants!
                                              .map((selectedName) =>
                                                  participantsList
                                                      .firstWhere(
                                                        (participant) =>
                                                            '${participant.firstName} ${participant.lastName}' ==
                                                            selectedName,
                                                      )
                                                      .id)
                                              .toList();

                                      // Now, selectedIds contains the ids of the selected participants
                                      // print(selectedIds);
                                    });
                                  },
                                  title: const Text('Select Participants'),
                                  buttonText: const Text('Select Participants'),
                                  chipDisplay: MultiSelectChipDisplay<String>(
                                    onTap: (item) {
                                      setState(() {
                                        _selectedParticipants!.remove(item);
                                      });
                                    },
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors
                                            .grey), // Customize the border color
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  buttonIcon: const Icon(
                                      Icons.arrow_drop_down_outlined),
                                ),
                              ),
                              // Display selected participants
                              if (_selectedParticipants != null &&
                                  _selectedParticipants!.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Wrap(
                                    spacing: 8,
                                    children: _selectedParticipants!
                                        .map((participant) {
                                      return Chip(
                                        label: Text(participant),
                                        onDeleted: () {
                                          setState(() {
                                            _selectedParticipants!
                                                .remove(participant);
                                          });
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                            ],
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await mc.createMeetingUser();
                                  if (mc.status == true) {
                                    Get.defaultDialog(
                                      title: "Success",
                                      middleText:
                                          "Meeting created successfully\n  click to view meetings",
                                      textConfirm: "OK",
                                      confirmTextColor: Colors.white,
                                      onConfirm: () async {
                                        Get.offAll(MyMeetingsScreen(
                                          title: 'My Meetings',
                                        ));
                                      },
                                    );
                                  }
                                }
                              },
                              child: const Text('Submit'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }

  // Function to fetch and set room details based on the selected room
  void setRoomDetails(String? roomName) {
    if (roomName != null) {
      // Find the selected room in the roomList
      RoomsGetModel? selectedRoom = mc.roomListObj.firstWhere(
        (room) => room.name.toString() == roomName,
      );

      if (selectedRoom != null) {
        // Set room details to corresponding variables
        setState(() {
          _floor = selectedRoom.floor;
          _seatingCapacity = selectedRoom.seatingCapacity.toString();
          _meetingRoomSpecifications = selectedRoom.roomDetails;
        });
      }
    }
  }
}
