import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:room_booking_app/controllers/user_controllers/create_meeting_get_room_users_controller.dart';
import 'package:room_booking_app/models/user_model/get_all_rooms_model.dart';

class CreateMeetingsUser extends StatefulWidget {
  const CreateMeetingsUser({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _CreateMeetingsUserState createState() => _CreateMeetingsUserState();
}

class _CreateMeetingsUserState extends State<CreateMeetingsUser> {
  TextEditingController meetingTypec = TextEditingController();
  TextEditingController selectedRoomc = TextEditingController();
  TextEditingController floorc = TextEditingController();
  TextEditingController seatingCapacityc = TextEditingController();
  TextEditingController meetingRoomSpecificationsc = TextEditingController();
  TextEditingController startTimec = TextEditingController();
  TextEditingController endTimec = TextEditingController();
  TextEditingController purposec = TextEditingController();
  TextEditingController selectedParticipantsc = TextEditingController();
  TextEditingController selectedRoomIdc = TextEditingController();

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

  Time _startTimee = Time(hour: 11, minute: 30);
  Time _endTimee = Time(hour: 11, minute: 30);

  dynamic startValidate;
  dynamic endValidate;

  bool iosStyle = true;

  void startTime(Time newTime) {
    setState(() {
      _startTime = newTime;
      mc.selectedStartTime.value = '${_startTime.hour}:${_startTime.minute}';
      startValidate = newTime;
    });
  }

  void endTime(Time newTime) {
    setState(() {
      _endTime = newTime;
      mc.selectedEndTime.value = '${_endTime.hour}:${_endTime.minute}';
      endValidate = newTime;
    });
  }

  String? validateEndTime() {
    final DateTime startDateTime = DateTime(
      _date.year,
      _date.month,
      _date.day,
      _startTime.hour,
      _startTime.minute,
    );

    final DateTime endDateTime = DateTime(
      _date.year,
      _date.month,
      _date.day,
      _endTime.hour,
      _endTime.minute,
    );

    if (endDateTime.isBefore(startDateTime)) {
      return 'End time must be greater than start time';
    }

    final Duration duration = endDateTime.difference(startDateTime);
    if (duration.inHours > 2) {
      return 'Meeting duration cannot exceed 2 hours';
    } else if (duration.inMinutes < 5) {
      return 'meeting duration cannot be less than 5 minutes';
    }

    // await mc.createMeetingUser();
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
      backgroundColor: const Color.fromARGB(255, 250, 253, 251),
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
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 8),
                                labelText: 'Meeting Type',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              value: _meetingType,
                              onChanged: (value) {
                                setState(() {
                                  _meetingType = value;
                                  mc.selectedMeetingType.value =
                                      value.toString();
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
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 8),
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
                                  // print(_selectedRoomId);
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
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 8),
                                labelText: 'Floor',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              initialValue: _floor ?? 'floor',
                              onChanged: (value) {
                                // setState(() {
                                _floor = value;
                                // });
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
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 8),
                                labelText: 'Seating Capacity',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              initialValue:
                                  _seatingCapacity ?? 'seating capacity',
                              onChanged: (value) {
                                // setState(() {
                                _seatingCapacity = value;
                                // });
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
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 8),
                                labelText: 'Meeting Room Specifications',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              initialValue: _meetingRoomSpecifications ??
                                  'room specifications',
                              onChanged: (value) {
                                // setState(() {
                                _meetingRoomSpecifications = value;
                                // });
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
                                        validator: (value) {
                                          if (value == null ||
                                              mc.selectedStartTime.value ==
                                                  '') {
                                            return 'Please select start time';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 2, horizontal: 8),
                                          // labelText: 'Select Time',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () async {
                                              Navigator.of(context).push(
                                                showPicker(
                                                  is24HrFormat: true,
                                                  // showSecondSelector: true,
                                                  context: context,
                                                  value: _startTimee,
                                                  onChange: startTime,
                                                  minuteInterval:
                                                      TimePickerInterval.FIVE,
                                                  // Optional onChange to receive value as DateTime
                                                ),
                                              );
                                              // if (_startTimee == null) {
                                              //   Get.snackbar(
                                              //     "GeeksforGeeks",
                                              //     "Hello everyone",
                                              //     icon: Icon(Icons.person,
                                              //         color: Colors.white),
                                              //     snackPosition:
                                              //         SnackPosition.BOTTOM,
                                              //   );
                                              // }
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
                                        validator: (value) {
                                          if (value == null ||
                                              mc.selectedEndTime.value == '') {
                                            return 'Please select end time';
                                          }
                                          return validateEndTime();
                                        },
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 2, horizontal: 8),
                                          // labelText: 'Select Time',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () async {
                                              Navigator.of(context).push(
                                                showPicker(
                                                  is24HrFormat: true,
                                                  context: context,
                                                  value: _endTimee,
                                                  onChange: endTime,
                                                  minuteInterval:
                                                      TimePickerInterval.FIVE,
                                                ),
                                              );
                                              // if (_endTime != null) {
                                              //   setState(() {
                                              //     // _endTime = _endTimee;
                                              //     mc.selectedEndTime.value =
                                              //         '${_endTime.hour}:${_endTime.minute}';
                                              //   });
                                              // }
                                            },
                                            icon: const Icon(Icons.access_time),
                                          ),
                                        ),
                                        readOnly: true,
                                        controller: TextEditingController(
                                          text:
                                              '${_endTime.hour}:${_endTime.minute}',
                                        ),
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
                                if (value == null ||
                                    mc.selectedDate.value == '') {
                                  return 'Please select date';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 8),
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
                                  validator: (value) {
                                    if (_purpose == 'Meeting' &&
                                        _selectedParticipants == null) {
                                      return 'Please select participants';
                                    }
                                    return null;
                                  },
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
                                  // if (startValidate == null) {
                                  //   Get.snackbar(
                                  //     "Time Error",
                                  //     "Please select start Time",
                                  //     icon: const Icon(
                                  //         Icons.warning_amber_rounded,
                                  //         color: Colors.white),
                                  //     snackPosition: SnackPosition.BOTTOM,
                                  //   );
                                  // } else if (endValidate == null) {
                                  //   Get.snackbar(
                                  //     "Time Error",
                                  //     "Please select end Time",
                                  //     icon: const Icon(
                                  //         Icons.warning_amber_rounded,
                                  //         color: Colors.white),
                                  //     snackPosition: SnackPosition.BOTTOM,
                                  //   );
                                  // }
                                  await mc.createMeetingUser();
                                }
                              },
                              child: const Text(
                                'Create now',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
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
