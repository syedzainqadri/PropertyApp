// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:country_code_picker/country_localizations.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import '../Utils/color_scheme.dart';
// import 'package:get/get.dart';

// import '../Utils/constants.dart';
// import 'verify_phone.dart';

// class SignInPhone extends StatefulWidget {
//   const SignInPhone({Key? key}) : super(key: key);

//   @override
//   State<SignInPhone> createState() => _SignInPhoneState();
// }

// class _SignInPhoneState extends State<SignInPhone> {
//   final _phoneFocus = FocusNode();
//   @override
//   Widget build(BuildContext context) {

//  // FocusScopeNode currentFocus = FocusScope.of(context);
//     return MaterialApp(
//       supportedLocales: const [
//         Locale("af"),
//         Locale("am"),
//         Locale("ar"),
//         Locale("az"),
//         Locale("be"),
//         Locale("bg"),
//         Locale("bn"),
//         Locale("bs"),
//         Locale("ca"),
//         Locale("cs"),
//         Locale("da"),
//         Locale("de"),
//         Locale("el"),
//         Locale("en"),
//         Locale("es"),
//         Locale("et"),
//         Locale("fa"),
//         Locale("fi"),
//         Locale("fr"),
//         Locale("gl"),
//         Locale("ha"),
//         Locale("he"),
//         Locale("hi"),
//         Locale("hr"),
//         Locale("hu"),
//         Locale("hy"),
//         Locale("id"),
//         Locale("is"),
//         Locale("it"),
//         Locale("ja"),
//         Locale("ka"),
//         Locale("kk"),
//         Locale("km"),
//         Locale("ko"),
//         Locale("ku"),
//         Locale("ky"),
//         Locale("lt"),
//         Locale("lv"),
//         Locale("mk"),
//         Locale("ml"),
//         Locale("mn"),
//         Locale("ms"),
//         Locale("nb"),
//         Locale("nl"),
//         Locale("nn"),
//         Locale("no"),
//         Locale("pl"),
//         Locale("ps"),
//         Locale("pt"),
//         Locale("ro"),
//         Locale("ru"),
//         Locale("sd"),
//         Locale("sk"),
//         Locale("sl"),
//         Locale("so"),
//         Locale("sq"),
//         Locale("sr"),
//         Locale("sv"),
//         Locale("ta"),
//         Locale("tg"),
//         Locale("th"),
//         Locale("tk"),
//         Locale("tr"),
//         Locale("tt"),
//         Locale("uk"),
//         Locale("ug"),
//         Locale("ur"),
//         Locale("uz"),
//         Locale("vi"),
//         Locale("zh")
//       ],
//       localizationsDelegates: const [
//         CountryLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//       ],
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: transparent,
//           elevation: 0.0,
//           leading: GestureDetector(
//               onTap: () {
//                 Get.back();
//               },
//               child: const Icon(
//                 Icons.navigate_before,
//                 size: 35,
//                 color: lightGreen,
//               )),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Sign In',
//                   style: TextStyle(
//                     color: lightGreen,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 30,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 Container(
//                   width: double.infinity,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     border: Border.all(color: _phoneFocus.hasPrimaryFocus?lightGreen:darkGrey),
//                   ),
//                   child: Row(
//                     children: [
//                       CountryCodePicker(
//                         onChanged: print,
//                         initialSelection: '+27',
//                         flagDecoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(7),
//                         ),
//                       ),
//                        Expanded(
//                         child: TextField(
//                           focusNode: _phoneFocus,
//                           cursorColor: lightGreen,
//                           decoration: const InputDecoration(
//                             enabledBorder: InputBorder.none,
//                             focusedBorder: InputBorder.none,
//                             hintText: 'Phone number',
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 35,
//                 ),
//                 defaultButton('Send Code', const VerifyPhone()),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 const Center(child: Text('OR')),
//                 const SizedBox(
//                   height: 15,
//                 ),
//               socialButton('Facebook Login', const FaIcon(FontAwesomeIcons.facebook), darkBlue),
//               const SizedBox(
//                 height: 15,
//               ),
//               socialButton('Google Login', const FaIcon(FontAwesomeIcons.google), brightRed),
//               const SizedBox(
//                 height: 15,
//               ),
//               socialButton('LinkedIn Login',  const FaIcon(FontAwesomeIcons.linkedin),mediumBlue),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: const Center(
//                     child: Text(
//                       'Login with E-mail',
//                       style: TextStyle(
//                         color: lightBlue,
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
