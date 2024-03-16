import 'package:cred/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final mobileNumber = ''.obs;
  final password = ''.obs;
  final isPasswordVisible = false.obs; // For password visibility toggle

  void togglePasswordVisibility() => isPasswordVisible.toggle();

  // Implement login logic here (replace with your actual implementation)
  // This might involve API calls or backend interaction to validate credentials
  void login(BuildContext context) async {
    if (mobileNumber.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill in all fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Simulate login processing
    await Future.delayed(Duration(seconds: 2));

    // Handle successful login (e.g., navigate to home screen)
    Get.off(HomeScreen()); // Replace with your navigation logic
  }
}
