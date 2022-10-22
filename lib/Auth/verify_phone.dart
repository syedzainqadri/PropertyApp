// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/otp_field_style.dart';
// import 'package:otp_text_field/style.dart';
// import '../Home/home.dart';
// import '../Utils/color_scheme.dart';
// import '../Utils/constants.dart';
// import 'sign_in.dart';

// class VerifyPhone extends StatefulWidget {
//   const VerifyPhone({Key? key}) : super(key: key);

//   @override
//   State<VerifyPhone> createState() => _VerifyPhoneState();
// }

// class _VerifyPhoneState extends State<VerifyPhone> {
//   OtpFieldController otpController = OtpFieldController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: transparent,
//         elevation: 0.0,
//         leading: GestureDetector(
//             onTap: () {
//               Get.back();
//             },
//             child: const Icon(
//               Icons.navigate_before,
//               size: 35,
//               color: kGreen,
//             )),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Sign In',
//                 style: TextStyle(
//                   color: kGreen,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 30,
//                 ),
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 child: OTPTextField(
//                     controller: otpController,
//                     otpFieldStyle: OtpFieldStyle(
//                       focusBorderColor: kGreen,
//                     ),
//                     length: 6,
//                     width: MediaQuery.of(context).size.width,
//                     textFieldAlignment: MainAxisAlignment.spaceAround,
//                     fieldWidth: 35,
//                     fieldStyle: FieldStyle.box,
//                     outlineBorderRadius: 8,
//                     style: const TextStyle(fontSize: 17),
//                     onChanged: (pin) {},
//                     onCompleted: (pin) {
//                       if(pin == '123456'){
//                        // Get.to(const Home());
//                       }
//                     }),
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//               const Center(child: Text('OR')),
//               const SizedBox(
//                 height: 15,
//               ),
//               socialButton('Facebook Login', const FaIcon(FontAwesomeIcons.facebook), darkBlue),
//               const SizedBox(
//                 height: 15,
//               ),
//               socialButton('Google Login', const FaIcon(FontAwesomeIcons.google), brightRed),
//               const SizedBox(
//                 height: 15,
//               ),
//               socialButton('LinkedIn Login',  const FaIcon(FontAwesomeIcons.linkedin),mediumBlue),
//               const SizedBox(
//                 height: 40,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Get.to(const SignIn());
//                 },
//                 child: const Center(
//                   child: Text(
//                     'Login with Email',
//                     style: TextStyle(
//                       color: lightBlue,
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
