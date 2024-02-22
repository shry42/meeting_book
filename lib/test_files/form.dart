// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:room_booking_app/controllers/app_controllers/app_main_controller.dart';
// import 'package:room_booking_app/utils/toast_service.dart';

// class CreditCardForm extends StatefulWidget {
//   const CreditCardForm();

//   @override
//   State<CreditCardForm> createState() => _CreditCardFormState();
// }

// class _CreditCardFormState extends State<CreditCardForm> {
//   bool _companyNameSelection = false;
//   late String companyCategory = '';

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   TextEditingController _fullname = TextEditingController();
//   TextEditingController _pannumber = TextEditingController();
//   TextEditingController _dob = TextEditingController();
//   TextEditingController _mobilenumber =
//       TextEditingController(text: AppController.accessToken);
//   TextEditingController _emailpersonal =
//       TextEditingController(text: AppController.accessToken);
//   TextEditingController _companyname = TextEditingController();
//   TextEditingController _companycategory = TextEditingController();
//   TextEditingController _netsalary = TextEditingController();
//   TextEditingController _workexperience = TextEditingController();
//   TextEditingController _pincode = TextEditingController();
//   TextEditingController _fulladd = TextEditingController();
//   TextEditingController _designation = TextEditingController();
//   TextEditingController _emailofficial = TextEditingController();

//   // Company Search

//   // List<Company> _companyList = [];

//   @override
//   void initState() {
//     super.initState();
//   }

//   Future<void> _fetchCompanyList(String query) async {
//     @override
//     bool isChecked = false;
//     Widget textFormField(
//       String title,
//       String hintText,
//       TextEditingController val,
//       TextInputType inputType,
//       String? Function(String?)? validator,
//       void Function(String)? onChanged,
//       BuildContext context,
//     ) {
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             IntrinsicHeight(
//               child: TextFormField(
//                 enabled: title == 'Company Category' ? false : true,
//                 controller: val,
//                 keyboardType: inputType,
//                 validator: validator,
//                 onChanged: onChanged,
//                 decoration: InputDecoration(
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 10, horizontal: 8),
//                   hintText: hintText,
//                   hintStyle: TextStyle(fontSize: 12),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     Widget build(BuildContext context) {
//       final Size screenSize = MediaQuery.of(context).size;

//       return Scaffold(
//         body: SafeArea(
//             child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                           onPressed: () {
//                             Get.back();
//                           },
//                           icon: Icon(Icons.arrow_back_ios)),
//                       const Text(
//                         'Credit card Form',
//                         style: TextStyle(
//                             fontSize: 19, fontWeight: FontWeight.w500),
//                       ),
//                       const SizedBox(width: 25),
//                     ],
//                   ),
//                 ),
//               ),
//               Image.asset('assets/creditcard.png',
//                   height: screenSize.height * 0.26),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Form(
//                     key: _formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         textFormField(
//                             'Full Name As Per PAN Card',
//                             // '${AppController.userName}',
//                             '',
//                             _fullname,
//                             TextInputType.name, (value) {
//                           if (value!.isEmpty) {
//                             return "Please enter your name";
//                           } else if (!RegExp(r'^[a-zA-Z\s]+$')
//                               .hasMatch(value)) {
//                             return "Name should only contain Alphabets";
//                           }
//                           return null;
//                         }, (value) {
//                           _formKey.currentState?.validate();
//                         }, context),
//                         textFormField('PAN Number', 'HOHPP2950', _pannumber,
//                             TextInputType.text, (value) {
//                           if (value!.isEmpty) {
//                             return "Please enter your pan number";
//                           } else if (!RegExp(r'^[A-Z]{5}\d{4}[A-Z]{1}$')
//                               .hasMatch(value)) {
//                             return "Please Enter Correct pan number";
//                           }
//                           return null;
//                         }, (value) {
//                           _formKey.currentState?.validate();
//                         }, context),
//                         textFormField(
//                             'DOB', '26/03/1996', _dob, TextInputType.datetime,
//                             (value) {
//                           if (value!.isEmpty) {
//                             // toast('Kindly Enter Your DOB');
//                             return "Please enter your DOB";
//                           }
//                           return null;
//                         }, (value) {
//                           _formKey.currentState?.validate();
//                         }, context),
//                         textFormField(
//                             'Mobile Number',
//                             // '${AppController.mobile}',
//                             '',
//                             _mobilenumber,
//                             TextInputType.number, (value) {
//                           if (value!.isEmpty) {
//                             return "Please enter your mobile number";
//                           } else if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
//                             return "Please Enter Correct Mobile number";
//                           }
//                           return null;
//                         }, (value) {
//                           _formKey.currentState?.validate();
//                         }, context),
//                         textFormField(
//                             'Email ID',
//                             // '${AppController.emailId}',
//                             '',
//                             _emailpersonal,
//                             TextInputType.emailAddress, (value) {
//                           if (value!.isEmpty) {
//                             return "Please enter your email address";
//                           } else if (!RegExp(
//                                   r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
//                               .hasMatch(value)) {
//                             return "Please Enter Correct email address";
//                           }
//                           return null;
//                         }, (value) {
//                           _formKey.currentState?.validate();
//                         }, context),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   'Company Name',
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 4,
//                                 ),
//                                 SizedBox(
//                                   height:
//                                       MediaQuery.of(context).size.height * 0.07,
//                                   child: TextFormField(
//                                     controller: _companyname,
//                                     style: TextStyle(fontSize: 12),
//                                     decoration: InputDecoration(
//                                       hintText: 'Enter Company Name...',
//                                       hintStyle: TextStyle(fontSize: 12),
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(12),
//                                         borderSide:
//                                             BorderSide(color: Colors.black),
//                                       ),
//                                     ),
//                                     onChanged: (query) {},
//                                     onTap: () {
//                                       setState(() {
//                                         _companyNameSelection = true;
//                                       });
//                                     },
//                                   ),
//                                 ),
//                                 if (_companyNameSelection)
//                                   Container(
//                                     height: 150,
//                                   ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         textFormField(
//                             'Company Category',
//                             companyCategory != '' ? companyCategory : 'Others',
//                             _companycategory,
//                             TextInputType.name, (value) {
//                           if (value!.isEmpty) {
//                             // toast('Kindly Enter Your Full Name');
//                             return null;
//                           }
//                           return null;
//                         }, (value) {
//                           _formKey.currentState?.validate();
//                         }, context),
//                         textFormField('Net Salary', 'xyz', _netsalary,
//                             TextInputType.number, (value) {
//                           if (value!.isEmpty) {
//                             return "Please enter your Salary";
//                           }
//                           return null;
//                         }, (value) {
//                           _formKey.currentState?.validate();
//                         }, context),
//                         textFormField('Current Work Experience', 'xyz',
//                             _workexperience, TextInputType.number, (value) {
//                           if (value!.isEmpty) {
//                             return "Please enter your work experience";
//                           }
//                           return null;
//                         }, (value) {
//                           _formKey.currentState?.validate();
//                         }, context),
//                         textFormField('Pin Code', '000000', _pincode,
//                             TextInputType.number, (value) {
//                           if (value!.isEmpty) {
//                             return "Please enter your pincode";
//                           } else if (!RegExp(r'^\d{6}$').hasMatch(value)) {
//                             return "Please Enter Correct pincode";
//                           }
//                           return null;
//                         }, (value) {
//                           _formKey.currentState?.validate();
//                         }, context),
//                         textFormField('Full Address', '', _fulladd,
//                             TextInputType.streetAddress, (value) {
//                           if (value!.isEmpty) {
//                             return "Please enter your address";
//                           }
//                           return null;
//                         }, (value) {
//                           _formKey.currentState?.validate();
//                         }, context),
//                         textFormField(
//                             'Designation', '', _designation, TextInputType.text,
//                             (value) {
//                           if (value!.isEmpty) {
//                             return "Please enter your Designation";
//                           }
//                           return null;
//                         }, (value) {
//                           _formKey.currentState?.validate();
//                         }, context),
//                         textFormField('Official Email ID', '', _emailofficial,
//                             TextInputType.emailAddress, (value) {
//                           if (value!.isEmpty) {
//                             return "Please enter your official email address";
//                           } else if (!RegExp(
//                                   r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
//                               .hasMatch(value)) {
//                             return "Please Enter Correct email address";
//                           }
//                           return null;
//                         }, (value) {
//                           _formKey.currentState?.validate();
//                         }, context),
//                         Row(
//                           children: [
//                             Checkbox(
//                               value: isChecked,
//                               onChanged: (newValue) {
//                                 setState(() {
//                                   isChecked = newValue ?? false;
//                                 });
//                               },
//                             ),
//                             const Flexible(
//                               child: Text(
//                                 'I confirm that the accuracy of my personal data. I agree with the terms of service.',
//                                 softWrap: true,
//                               ),
//                             )
//                           ],
//                         ),
//                         InkWell(
//                           onTap: () async {},
//                           child: Container(
//                             height: 40,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                                 color: Color(0xFFEF5924),
//                                 borderRadius: BorderRadius.circular(7)),
//                             child: const Center(
//                               child: Text(
//                                 'PROCEED',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     )),
//               )
//             ],
//           ),
//         )),
//       );
//     }
//   }
// }
