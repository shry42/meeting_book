import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:room_booking_app/controllers/superadmin_controllers/update_user_controller.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class UpdateUserScreen extends StatefulWidget {
  UpdateUserScreen(
      {super.key,
      required this.title,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.mobileNo,
      required this.id});

  final String title, firstName, lastName, email, mobileNo;
  final int id;

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  final UpdateUserController uuc = UpdateUserController();

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController mobileNoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with the provided values
    firstNameController.text = widget.firstName;
    lastNameController.text = widget.lastName;
    emailController.text = widget.email;
    mobileNoController.text = widget.mobileNo;
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
                  const Spacer(),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          Column(children: [
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: TextFormField(
                // controller: emailController,
                controller: firstNameController,
                // initialValue: widget.firstName,
                onChanged: (value) {
                  // AppController.setemailId(emailController.text);
                  // c.userName.value = emailController.text;
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'First Name',

                  // hintText: 'username',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a name";
                  } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                    return "Name can only contain alphabets and spaces";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: TextFormField(
                controller: lastNameController,
                // initialValue: widget.lastName,
                onChanged: (value) {
                  // AppController.setemailId(emailController.text);
                  // c.userName.value = emailController.text;
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Last Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a name";
                  } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                    return "Name can only contain alphabets and spaces";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: TextFormField(
                controller: emailController,
                // initialValue: widget.email,
                onChanged: (value) {
                  // AppController.setemailId(emailController.text);
                  // c.userName.value = emailController.text;
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Email address',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter an email";
                  } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: TextFormField(
                controller: mobileNoController,
                // initialValue: widget.mobileNo,
                onChanged: (value) {
                  // AppController.setemailId(emailController.text);
                  // c.userName.value = emailController.text;
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'MobileNumber',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a phone number';
                  } else if (value.length != 10) {
                    return 'Please enter a valid 10-digit phone number';
                  }
                  return null;
                },
              ),
            ),
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
                    // if (_formKey.currentState!.validate()) {
                    await uuc.updateUserDetails(
                      firstNameController.text,
                      lastNameController.text,
                      emailController.text,
                      mobileNoController.text,
                      widget.id,
                    );
                    // }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.black, fontSize: 25),
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
          ]),
          const SizedBox(
            height: 30,
          ),
        ]),
      ),

      // backgroundColor: Colors.transparent,
    );
  }
}
