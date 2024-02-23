import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:room_booking_app/controllers/user_controllers/create_meeting_get_room_controller.dart';
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
  String? _selectParticipant; // New field for Select Participant
  final _formKey = GlobalKey<FormState>();

  final CreateMeetingUserController mc = Get.put(CreateMeetingUserController());

  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
    _startTime = TimeOfDay.now();
    _endTime = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 213, 231, 214),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Create Meeting',
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
                        // setState(() {
                        //   _meetingType = value;
                        // });
                        mc.meetingType.value = value.toString();
                      },
                      items: <String>['External', 'Internal']
                          .map<DropdownMenuItem<String>>((String value) {
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
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Select Room',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      value: _selectedRoom,
                      onChanged: (value) {
                        setState(() {
                          _selectedRoom = value;
                        });
                      },
                      items: <String>['Room 1', 'Room 2', 'Room 3']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select meeting room';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Floor',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      initialValue: _floor,
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
                      decoration: InputDecoration(
                        labelText: 'Seating Capacity',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      initialValue: _seatingCapacity,
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
                      decoration: InputDecoration(
                        labelText: 'Meeting Room Specifications',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      initialValue: _meetingRoomSpecifications,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Start Time'),
                              TextFormField(
                                decoration: InputDecoration(
                                  // labelText: 'Select Time',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () async {
                                      TimeOfDay? result = await showTimePicker(
                                        context: context,
                                        initialTime: _startTime,
                                      );
                                      if (result != null) {
                                        setState(() {
                                          _startTime = result;
                                        });
                                        mc.startTime.value = result.toString();
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('End Time'),
                              TextFormField(
                                decoration: InputDecoration(
                                  // labelText: 'Select Time',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () async {
                                      TimeOfDay? result = await showTimePicker(
                                        context: context,
                                        initialTime: _endTime,
                                      );
                                      if (result != null) {
                                        setState(() {
                                          _endTime = result;
                                        });
                                        mc.endTime.value = result.toString();
                                      }
                                    },
                                    icon: const Icon(Icons.access_time),
                                  ),
                                ),
                                readOnly: true,
                                controller: TextEditingController(
                                  text: '${_endTime.hour}:${_endTime.minute}',
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
                      initialValue: _date.toLocal().toString().split(' ')[0],
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
                          });
                          mc.date.value = pickedDate.toString();
                        }
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
                            _selectParticipant = null;
                          }
                          mc.purpose.value = value.toString();
                        });
                      },
                      items: <String>['Training', 'Meeting', 'Conference']
                          .map<DropdownMenuItem<String>>((String value) {
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
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Select Participant',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        value: _selectParticipant,
                        onChanged: (value) {
                          setState(() {
                            _selectParticipant = value;
                          });
                        },
                        items: <String>[
                          'Participant 1',
                          'Participant 2',
                          'Participant 3'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(content: Text('Form submitted')),
                          // );
                          mc.createMeetingUser();
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
      ),
    );
  }
}
