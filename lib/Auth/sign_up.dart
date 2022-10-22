import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lagosabuja/Auth/sign_in.dart';
import 'package:lagosabuja/Controllers/sign_up_controller.dart';
import '../Models/sign_in_model.dart';
import '../Utils/constants.dart';
import '../Utils/color_scheme.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late SignInModel user;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final userNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final SignUpController _signUpController = SignUpController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Create New Account',
                      style: TextStyle(
                        color: kGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    textField('First Name', false, firstNameController,
                        onValidate: (v) => v!.isEmpty ? "Required" : null),
                    const SizedBox(
                      height: 15,
                    ),
                    textField('Last Name', false, lastNameController,
                        onValidate: (v) => v!.isEmpty ? "Required" : null),
                    const SizedBox(
                      height: 15,
                    ),
                    textField('Phone No', false, phoneController,
                        onValidate: (v) => v!.isEmpty ? "Required" : null),
                    const SizedBox(
                      height: 15,
                    ),
                    textField('E-mail address', false, emailController,
                        onValidate: (v) => v!.isEmpty ? "Required" : null),
                    const SizedBox(
                      height: 15,
                    ),
                    textField('User Name', false, userNameController,
                        onValidate: (v) => v!.isEmpty ? "Required" : null),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (v) => v!.isEmpty ? "Required" : null,
                        controller: passwordController,
                        obscureText: true,
                        cursorColor: kGreen,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 15, bottom: 20, top: 10),
                            border: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            fillColor: white,
                            labelText: "Password",
                            alignLabelWithHint: true,
                            labelStyle:
                                TextStyle(color: Colors.grey, fontSize: 16)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (v) => v!.isEmpty ? "Required" : null,
                        controller: confirmPasswordController,
                        obscureText: true,
                        cursorColor: kGreen,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 15, bottom: 20, top: 10),
                            border: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            fillColor: white,
                            labelText: "Confirm Password",
                            alignLabelWithHint: true,
                            labelStyle:
                                TextStyle(color: Colors.grey, fontSize: 16)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    defaultButton('Sign Up', () async {
                      if (formKey.currentState!.validate()) {
                        Get.defaultDialog(
                            title: "",
                            content: Container(
                              color: Colors.white,
                              child: Column(
                                children: const [
                                  Center(
                                    child: CircularProgressIndicator(
                                      color: kGreen,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "SigningIn! please wait",
                                    style: TextStyle(color: Colors.black38),
                                  )
                                ],
                              ),
                            ));
                        var response = await _signUpController.signUp(
                            userNameController.text,
                            emailController.text,
                            passwordController.text,
                            firstNameController.text,
                            lastNameController.text,
                            phoneController.text);
                        if (response != null) {
                          user = SignInModel.fromJson(response);
                          Get.back();
                          Get.back();
                        } else {
                          Get.back();
                        }
                      }
                    }),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Have an Account? "),
                        InkWell(
                          onTap: () {
                            Get.to(const SignIn());
                          },
                          child: const Center(
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                color: kGreen,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
