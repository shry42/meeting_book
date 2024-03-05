import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:room_booking_app/controllers/superadmin_controllers/add_user_controller.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class AddUserScreen extends StatelessWidget {
  AddUserScreen({super.key, required this.title});

  final String title;

  final AddUserController auc = AddUserController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassCont = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
          const SizedBox(height: 50),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    child: TextFormField(
                      controller: firstNameController,
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: TextFormField(
                      controller: lastNameController,
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: TextFormField(
                      controller: emailController,
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: TextFormField(
                      controller: mobileNoController,
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
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: TextFormField(
                      controller: passwordController,
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
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty || value == "") {
                          return 'Please enter a valid password';
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
                      controller: confirmPassCont,
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
                        labelText: 'Confirm Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty || value == "") {
                          return 'Please enter a valid password';
                        } else if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ),
                  // submit buttton below

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
                          if (_formKey.currentState!.validate()) {
                            await auc.addUser(
                                firstNameController.text.toString(),
                                lastNameController.text,
                                emailController.text,
                                mobileNoController.text,
                                passwordController.text,
                                confirmPassCont.text);
                          }
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
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
          ),
        ]),
      ),
    );
  }
}
