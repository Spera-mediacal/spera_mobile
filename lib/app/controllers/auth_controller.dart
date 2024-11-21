import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // Text Editing Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Validation messages String? Function(String?)?
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+").hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (!RegExp(r"^[0-9]{10}$").hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  // Register logic
  void register() {
    final emailError = validateEmail(emailController.text);
    final passwordError = validatePassword(passwordController.text);
    final confirmPasswordError =
        validatePassword(confirmPasswordController.text);
    final nameError = validateName(nameController.text);
    final phoneError = validatePhone(phoneController.text);

    if (emailError == null &&
        passwordError == null &&
        confirmPasswordError == null &&
        nameError == null &&
        phoneError == null &&
        passwordController.text == confirmPasswordController.text) {
      // Add your register API logic here
      Get.snackbar('Success', 'Account created successfully!');
    } else {
      Get.snackbar('Error', 'Please correct the errors in the form');
    }
  }

  // Login logic
  void login() {
    final emailError = validateEmail(emailController.text);
    final passwordError = validatePassword(passwordController.text);

    if (emailError == null && passwordError == null) {
      // Add your login API logic here
      Get.snackbar('Success', 'Logged in successfully!');
    } else {
      Get.snackbar('Error', 'Please correct the errors in the form');
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
