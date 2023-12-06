import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/app/modules/appwrite/controllers/client_controller.dart';
import 'package:pet/app/routes/app_pages.dart';

class AccountController extends ClientController {
  Account? account;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
// appwrite
    account = Account(client);
  }

  Future createAccount(Map map) async {
    try {
      if (map['email'] == null || map['password'] == null) {
        throw "Email and password cannot be null";
      }
      print("Debug: userId: ${map['userId']}");
      print("Debug: email: ${map['email']}");
      print("Debug: password: ${map['password']}");
      print("Debug: name: ${map['name']}");

      final result = await account!.create(
        userId: map['userId'] ?? '',
        email: map['email']!,
        password: map['password']!,
        name: map['name'] ?? '',
      );
      print("AccountController:: createAccount $result");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Account",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  Future createEmailSession(Map map) async {
    try {
      final result = await account!.createEmailSession(
        email: map['email'],
        password: map['password'],
      );
      print("AccountController:: createEmailSession $result");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Account",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  Future<void> registerAppWrite(
      String email, String password, String name) async {
    try {
      isLoading.value = true;
      final result = await createAccount({
        'userId': ID.unique(),
        'email': email,
        'password': password,
        'name': name,
      });
      print(result);
      Get.snackbar('Success', 'Registration successful',
          backgroundColor: Colors.green);
      Get.toNamed(Routes.HOMEPAGE);
    } catch (error) {
      Get.snackbar('Error', 'Registration failed', backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginAppWrite(String email, String password) async {
    try {
      isLoading.value = true;

      final result = await createEmailSession({
        'email': email,
        'password': password,
      });
      if (result.statusCode == 200) {
        Get.snackbar('Success', 'Login successful',
            backgroundColor: Colors.green);
        Get.toNamed(Routes.HOMEPAGE);
      } else {
        Get.snackbar('Error', 'Login failed', backgroundColor: Colors.red);
      }
    } catch (error) {
      Get.snackbar('Error', 'An unexpected error occurred',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }
}
