import 'dart:ui';

import 'package:course/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthController extends GetxController {

  bool isVisibilty = false; // هنا نستخدمها مع الباسوورد
  bool isCheckBox = false; //هنا مع التشك بوكس
  var disUserName = ''.obs;
  var displayUserEmail = ''.obs;
  var displayUserPhoto = ''.obs;
  FirebaseAuth auth = FirebaseAuth
      .instance; // استخدم فار اذا ماكنت اعرف نوع المتغير ايش هو بالضبط
  var googleSignIn = GoogleSignIn();

  var isSignedIn = false;
  final GetStorage autBox = GetStorage();
 User? get userProfiloe => auth.currentUser;

  @override
  void onInit() {
 disUserName.value =
(userProfiloe != null ? userProfiloe!.displayName : "")!;
 displayUserPhoto.value =
 (userProfiloe != null ? userProfiloe!.photoURL : "")!;
 displayUserEmail.value = (userProfiloe != null ? userProfiloe!.email : "")!;

    super.onInit();
  }

  void visibilty() {
    isVisibilty = !isVisibilty;

    update(); //هنا معناته استمع للفنكشن تشبه الليسنر وتستخدم مع GetxBuilder
  }

  void checkBox() {
    isCheckBox = !isCheckBox;

    update(); //هنا معناته استمع للفنكشن تشبه الليسنر وتستخدم مع GetxBuilder
  }

  void signUpUsingFirebade({
    required String name,
    required String email,
    required String password,

  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email,
          password: password).then((value) {
        disUserName.value = name;
        auth.currentUser!.updateDisplayName(name);
      });
      update();
    } on FirebaseAuthException catch (e) {
      String title = e.code
          .replaceAll(RegExp('-'), '')
          .capitalize!; //هذي عشان تطلع لنا العلامة الخضرا الي في اسفل البوتون
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = e.message.toString();
      }

      Get.snackbar(
          title,
          message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white
      );
    } catch (e) {
      Get.snackbar(
          'Error!',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white
      );


      //print(e);
    }
  }

  void loginUpUsingFirebade({
    required String email,
    required String password,
  }) async {
    try {

      await auth.signInWithEmailAndPassword(email: email,
          password: password).then((value) =>
      disUserName.value = auth.currentUser!.displayName!);

      isSignedIn = true;
      autBox.write("auth",isSignedIn);
      update();

    } on FirebaseAuthException catch (e) {
      String title = e.code
          .replaceAll(RegExp('-'), '')
          .capitalize!;
      String message = '';

      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(
          title,
          message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white
      );
    } catch (e) {
      Get.snackbar(
          'Error?',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white
      );
    }
  }

  Future<void> googleSignUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      disUserName.value = googleUser!.displayName!;
      displayUserPhoto.value = googleUser.photoUrl!;
      GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken
      );
      await auth.signInWithCredential(credential);
      isSignedIn = true;
      autBox.write("auth",isSignedIn);
      update();

    } catch (e) {
      Get.snackbar(
          'Error?',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white
      );
    }
  }

  void facebookSignUpApp() {}

  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);

      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      String title = e.code
          .replaceAll(RegExp('-'), '')
          .capitalize!;
      String message = '';

      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(
          title,
          message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white
      );
    } catch (e) {
      Get.snackbar(
          'Error?',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white
      );
    }
  }

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      disUserName.value = '';
      displayUserPhoto.value = '';
      isSignedIn = false;

      autBox.remove("auth");
      update();
      Get.offNamed(Routes.welcomeScreen);

    } catch(e) {
      Get.snackbar(
          'Error?',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white
      );
    }
  }

}