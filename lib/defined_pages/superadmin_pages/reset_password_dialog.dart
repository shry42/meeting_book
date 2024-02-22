import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_booking_app/utils/toast_service.dart';

class DialogBox extends StatelessWidget {
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  // final PasswordController pc = Get.put(PasswordController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'NewPassword',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            obscureText: true,
            controller: newPassController,
            onChanged: (value) {
              // pc.newPassword.value = newPassController.text;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'ConfirmPassword',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            controller: confirmPassController,
            obscureText: true,
            onChanged: (value) {
              // pc.confirmPssword.value = confirmPassController.text;
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () async {
            if (newPassController.text == confirmPassController.text) {
              // await pc.changePassword();
              Get.back();
            } else {
              toast("Both passwords did not match!");
            }
          },
          child: const Text("Update password"),
        ),
      ],
    );
  }
}
