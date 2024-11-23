import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../routes/app_router.dart';

class AuthController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final loginEmailController = TextEditingController();
  final phoneController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var isLoginPasswordObscure = false.obs;
  var isRegisterPasswordObscure = false.obs;
  var isRegisterConfirmPasswordObscure = false.obs;

  // Loading state
  var isLoading = false.obs;

  // Get Supabase instance
  final supabase = Supabase.instance.client;

  // Toggle obscure password
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

  // Validation methods
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
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  // Clear all controllers
  void clearControllers() {
    nameController.clear();
    emailController.clear();
    loginEmailController.clear();
    phoneController.clear();
    loginPasswordController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  // Register a new user
  Future<void> register() async {
    try {
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
        isLoading.value = true;

        // Sign up user with Supabase
        final response = await supabase.auth.signUp(
            email: emailController.text.trim(),
            password: passwordController.text,
            data: {
              'name': nameController.text,
              'phoneNumber': phoneController.text,
            });

        // If signup successful, store additional user data
        if (response.user != null) {
          Get.toNamed(AppRoutes.loginViewPath);
          Get.snackbar(
            'Success',
            'Account created successfully! Please verify your email.',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );

          // Clear controllers
          clearControllers();
        }
      } else {
        Get.snackbar(
          'Error',
          'Please correct the errors in the form',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on AuthException catch (e) {
      Get.snackbar(
        'Error',
        e.message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login() async {
    try {
      final emailError = validateEmail(loginEmailController.text);
      final passwordError = validatePassword(loginPasswordController.text);

      if (emailError == null && passwordError == null) {
        isLoading.value = true;

        final response = await supabase.auth.signInWithPassword(
          email: loginEmailController.text.trim(),
          password: loginPasswordController.text,
        );

        if (response.user != null) {
          Get.snackbar(
            'Success',
            'Logged in successfully!',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );

          // Clear controllers
          clearControllers();

          // Navigate to home screen or dashboard
          Get.offAllNamed(AppRoutes.bottomViewPath); // Replace with your route
        }
      } else {
        print('object object object objectobjectobjectobjectobject3');

        Get.snackbar(
          'Error',
          'Please correct the errors in the form',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on AuthException catch (e) {
      print('object object object objectobjectobjectobjectobject2');
      Get.snackbar(
        'Error',
        e.message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } catch (e) {
      print('object object object objectobjectobjectobjectobject1');

      Get.snackbar(
        'Error',
        'An unexpected error occurred',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      isLoading.value = true;
      await supabase.auth.signOut();
      Get.offAllNamed(AppRoutes.loginViewPath); // Replace with your login route
      Get.snackbar(
        'Success',
        'Logged out successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to logout',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    loginEmailController.dispose();
    phoneController.dispose();
    loginPasswordController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
