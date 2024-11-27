import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../routes/app_router.dart';
import '../services/shared_pref_service/sahred_pref_service.dart';

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

  var isLoading = false.obs;

  final supabase = Supabase.instance.client;

  Future<void> saveUserData(
      {required String name, required String phone, required String id}) async {
    await SharedPreferencesHelper.saveName(name);
    await SharedPreferencesHelper.savePhone(phone);
    await SharedPreferencesHelper.saveId(id);
  }

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

        final response = await supabase.auth.signUp(
          email: emailController.text.trim(),
          password: passwordController.text,
          data: {
            'name': nameController.text,
            'phoneNumber': phoneController.text,
          },
        );

        if (response.user != null) {
          final userId = response.user!.id; // Extract user ID
          await saveUserData(
            name: nameController.text,
            phone: phoneController.text,
            id: userId,
          );

          Get.toNamed(AppRoutes.loginViewPath);
          Get.snackbar(
            'Success',
            'Account created successfully! Please verify your email.',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );

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
          final userId = response.user!.id;
          await saveUserData(
            name: response.user!.userMetadata?['name'] ?? 'Unknown',
            phone: response.user!.userMetadata?['phoneNumber'] ?? 'Unknown',
            id: userId,
          );

          Get.snackbar(
            'Success',
            'Logged in successfully!',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );

          clearControllers();
          Get.offAllNamed(AppRoutes.setUpViewPath);
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
    } catch (e) {
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
      clearControllers();
      await supabase.auth.signOut();
      Get.offAllNamed(AppRoutes.loginViewPath);
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

  void clearControllers() {
    nameController.clear();
    emailController.clear();
    loginEmailController.clear();
    phoneController.clear();
    loginPasswordController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
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
