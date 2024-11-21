import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final loginEmailController = TextEditingController();
  final phoneController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var isPositive = true.obs; // Stores the Rh factor (true for positive, false for negative)
  var isLoginPasswordObscure = false.obs;
  var isRegisterPasswordObscure = false.obs;
  var isRegisterConfirmPasswordObscure = false.obs;

  var selectedBloodType = ''.obs;

  void selectBloodType(String bloodType) {
    selectedBloodType.value = bloodType;
  }

  void toggleSign() {
    isPositive.value = !isPositive.value;
  }

  toggleLoginPasswordObscure() {
    isLoginPasswordObscure.value = !isLoginPasswordObscure.value;
  }

  toggleRegisterPasswordObscure() {
    isRegisterPasswordObscure.value = !isRegisterPasswordObscure.value;
  }

  toggleRegisterConfirmPasswordObscure() {
    isRegisterConfirmPasswordObscure.value =
        !isRegisterConfirmPasswordObscure.value;
  }

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
