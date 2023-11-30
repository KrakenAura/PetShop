import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pet/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet/style.dart';
import 'package:flutter/material.dart';
import '../views/login_page.dart';
import 'package:pet/app/routes/app_pages.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  Future<void> registerUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar('Success', 'Registration successful',
          backgroundColor: Colors.green);
      Get.off(LoginPage()); //Navigate ke Login Page
    } catch (error) {
      Get.snackbar('Error', 'Registration failed: $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar('Success', 'Login successful',
          backgroundColor: Colors.green);
      Get.toNamed(Routes.HOMEPAGE);
    } catch (error) {
      Get.snackbar('Error', 'Login failed: $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.snackbar('Success', 'Logout successful',
          backgroundColor: Colors.green);
      Get.toNamed(Routes.HOME);
    } catch (error) {
      Get.snackbar('Error', 'Logout failed: $error',
          backgroundColor: Colors.red);
    }
  }
}
