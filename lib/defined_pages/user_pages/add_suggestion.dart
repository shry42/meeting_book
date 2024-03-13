import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:room_booking_app/bottom_navigation/bottom_navigation_bar.dart';
import 'package:room_booking_app/controllers/superadmin_controllers/create_room_controller.dart';
import 'package:room_booking_app/controllers/user_controllers/suggestionControllers.dart';
import 'package:room_booking_app/defined_pages/superadmin_pages/rooms_list.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class AddSuggestionScreen extends StatefulWidget {
  const AddSuggestionScreen({super.key, required this.title});

  final String title;

  @override
  State<AddSuggestionScreen> createState() => _AddSuggestionScreenState();
}

class _AddSuggestionScreenState extends State<AddSuggestionScreen> {
  final _formKey = GlobalKey<FormState>();
  //suggestioncontroller
  final TextEditingController sgc = TextEditingController();
  //additionalComment controller
  final TextEditingController adc = TextEditingController();
  final AddSuggestionController adscont = AddSuggestionController();

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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    child: TextFormField(
                      controller: sgc,
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
                        labelText: 'Add Suggestion',
                        // hintText: 'username',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty || value == "") {
                          return 'Please enter your suggestion';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 35),
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    child: TextFormField(
                      controller: adc,
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
                        labelText: 'Additional Comments',
                        // hintText: 'username',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty || value == "") {
                          return 'Please enter additional comments';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // minimumSize: const Size(100, 45), //////// HERE
                      maximumSize: const Size(120, 45),
                      backgroundColor: const Color.fromARGB(255, 241, 245, 241),
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(15.0)),
                    ),
                    onPressed: () async {
                      // Retrieve values from controllers
                      if (_formKey.currentState!.validate()) {
                        String suggestions = sgc.text;
                        String additionalComments = adc.text;

                        // Call addSuggestionCont method
                        await adscont.addSuggestion(
                          suggestions,
                          additionalComments,
                        );
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'Add',
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.energy_savings_leaf,
                          color: Color.fromARGB(255, 78, 225, 83),
                        )
                      ],
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
