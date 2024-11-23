import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_mobile/app/controllers/auth_controller.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/size_config.dart';
import 'package:spera_mobile/utils/text_styles.dart';
import '../../../../utils/global_widgets/custom_button.dart';
import '../../../../utils/global_widgets/custom_text_field.dart';
import '../../../../utils/global_widgets/logo_widget.dart';
import '../../../routes/app_router.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: screenWidth(context) * 0.08
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                (screenHeight(context) * 0.1).sh,
                LogoWidget(
                  width: screenWidth(context) * 0.4,
                  height: screenHeight(context) * 0.25,
                ),
                (screenHeight(context) * 0.1).sh,
                CustomTextField(
                  hintText: 'Email',
                  prefixIcon: HugeIcons.strokeRoundedMail01,
                  controller: authController.loginEmailController,
                  validator: authController.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                Obx(() {
                  return CustomTextField(
                    hintText: 'Password',
                    isPassword: true,
                    prefixIcon: HugeIcons.strokeRoundedLockPassword,
                    controller: authController.loginPasswordController,
                    validator: authController.validatePassword,
                    obscureText: authController.isLoginPasswordObscure.value,
                    onToggleObscureText: authController.toggleLoginPasswordObscure,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => _handleLogin(),
                  );
                }),
                (screenHeight(context) * 0.005).sh,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // TODO: Implement forgot password
                      },
                      child: Text(
                        'Forgot Password ?',
                        style: AppTextStyles.textStyle15.copyWith(
                          color: AppColors.accentColor,
                        ),
                      ),
                    ),
                  ],
                ),
                (screenHeight(context) * 0.05).sh,
                Obx(() {
                  return authController.isLoading.value
                      ? const CircularProgressIndicator()
                      : CustomButton(
                    text: 'Login',
                    onTap: _handleLogin,
                    width: screenWidth(context) * 0.5,
                    height: screenHeight(context) * 0.07,
                  );
                }),
                (screenHeight(context) * 0.006).sh,
                TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.registerViewPath);
                  },
                  child: const Text(
                    'Create New Account',
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

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      authController.login();
    }
  }
}