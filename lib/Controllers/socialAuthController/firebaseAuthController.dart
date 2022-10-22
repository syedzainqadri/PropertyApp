// ignore_for_file: file_names, unused_field, prefer_typing_uninitialized_variables, unused_local_variable, unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lagosabuja/Controllers/socialAuthController/socialAuthController.dart';
import 'package:lagosabuja/Utils/color_scheme.dart';

class FirebaseAuthController extends GetxController {
  var isDataSubmitting = false.obs;
  final SocialSignInController socialSignInController =
      SocialSignInController();
  var isDataReadingCompleted = false.obs;
  final box = GetStorage();
  var isLoading = false.obs;
  var verId = '';
  var authStatus = ''.obs;
  var auth = FirebaseAuth.instance;
  var _accessToken;
  var _userData;

  Rxn<User> firebaseUser = Rxn<User>();

  User? get userGetter => firebaseUser.value;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
    ],
    clientId:
        "731281729322-lclrlu4hciptch7vaa2csquqbqc1sk6i.apps.googleusercontent.com",
  );

  Future googleLogin() async {
    try {
      var googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      UserCredential authResult =
          await auth.signInWithCredential(authCredential);
      Get.snackbar("SignedIn", "Signedin Successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kGreen,
          colorText: white);
      await socialSignInController.signInWithGoogle(googleAuth.idToken);
    } catch (error) {
      Get.snackbar(
        'Failed',
        "Google sign in cancelled",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }

  _checkIfisLoggedIn() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    isLoading.value = false;
    if (accessToken != null) {
      final userData = await FacebookAuth.instance.getUserData();
      _accessToken = accessToken;
      _userData = userData;
    } else {
      signInWithFacebook();
    }
  }

  Future signInWithFacebook() async {
    isLoading.value = true;
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.status == LoginStatus.success) {
        _accessToken = loginResult.accessToken;
        final userData = await FacebookAuth.instance.getUserData();
        _userData = userData;
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);
        final UserCredential authResult =
            await auth.signInWithCredential(facebookAuthCredential);
      }
    } on FirebaseAuthException catch (e) {
      var title = '';
      switch (e.code) {
        case 'account-exists-with-different-credential':
          title = 'You all ready have an account';
          break;
        case 'invalid-credential':
          title = 'Invalid credentials';
          break;
        case 'opration-not-allowed':
          title = 'This opration is not allowed';
          break;
        case 'user-disabled':
          title = 'the user you tried to lof into is disabled';
          break;
        case 'user-not-found':
          title = 'the user you tried to log into was not found';
          break;
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      final googleSignin = GoogleSignIn();
      await googleSignin.signOut();
      await auth.signOut();
      await FacebookAuth.instance.logOut();
      _accessToken = null;
      _userData = null;
    } catch (e) {
      Get.snackbar("Error in Signing Out", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: white);
    }
  }
}
