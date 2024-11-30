import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_mobile/app/routes/app_router.dart';

import '../../../../utils/global_widgets/custom_button.dart';
import '../../../../utils/global_widgets/custom_text_field.dart';
import '../../../../utils/global_widgets/logo_widget.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';
import '../../../controllers/auth_controller.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});

  final authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: screenWidth(context) * 0.08,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                (screenHeight(context) * 0.1).sh,
                LogoWidget(
                  width: screenWidth(context) * 0.3,
                  height: screenHeight(context) * 0.15,
                ),
                (screenHeight(context) * 0.03).sh,
                CustomTextField(
                  hintText: 'regName'.tr,
                  prefixIcon: HugeIcons.strokeRoundedUserSharing,
                  controller: authController.nameController,
                  validator: authController.validateName,
                  textInputAction: TextInputAction.next,
                ),
                CustomTextField(
                  hintText: 'regEmail'.tr,
                  prefixIcon: HugeIcons.strokeRoundedMail01,
                  controller: authController.emailController,
                  validator: authController.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                CustomTextField(
                  hintText: 'regPhone'.tr,
                  prefixIcon: HugeIcons.strokeRoundedCallPaused02,
                  controller: authController.phoneController,
                  validator: authController.validatePhone,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                ),
                Obx(() {
                  return CustomTextField(
                    hintText: 'regPassword'.tr,
                    isPassword: true,
                    prefixIcon: HugeIcons.strokeRoundedSquareLock01,
                    controller: authController.passwordController,
                    validator: authController.validatePassword,
                    onToggleObscureText:
                        authController.toggleRegisterPasswordObscure,
                    obscureText: authController.isRegisterPasswordObscure.value,
                    textInputAction: TextInputAction.next,
                  );
                }),
                Obx(() {
                  return CustomTextField(
                    hintText: 'regPassconfirm'.tr,
                    isPassword: true,
                    prefixIcon: HugeIcons.strokeRoundedSquareLockCheck01,
                    controller: authController.confirmPasswordController,
                    validator: (value) {
                      if (value != authController.passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return authController.validatePassword(value);
                    },
                    obscureText:
                        authController.isRegisterConfirmPasswordObscure.value,
                    onToggleObscureText:
                        authController.toggleRegisterConfirmPasswordObscure,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => _handleRegister(),
                  );
                }),
                (screenHeight(context) * 0.05).sh,
                Obx(() {
                  return authController.isLoading.value
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          text: 'regButton'.tr,
                          onTap: _handleRegister,
                          width: screenWidth(context) * 0.5,
                          height: screenHeight(context) * 0.07,
                        );
                }),
                (screenHeight(context) * 0.006).sh,
                TextButton(
                  onPressed: () {
                    Get.offNamed(AppRoutes.loginViewPath);
                  },
                  child: Text(
                    'HaveAccount'.tr,
                    style: AppTextStyles.textStyle19,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleRegister() {
    if (_formKey.currentState?.validate() ?? false) {
      authController.register();
    }
  }
}
