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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: screenWidth(context) * 0.08),
        child: SingleChildScrollView(
          child: Column(
            children: [
              (screenHeight(context) * 0.1).sh,
              LogoWidget(
                width: screenWidth(context) * 0.3,
                height: screenHeight(context) * 0.15,
              ),
              (screenHeight(context) * 0.03).sh,
              CustomTextField(
                hintText: 'Name',
                prefixIcon: HugeIcons.strokeRoundedUserSharing,
                controller: authController.nameController,
                validator: authController.validateName,
              ),
              CustomTextField(
                hintText: 'Email',
                prefixIcon: HugeIcons.strokeRoundedMail01,
                controller: authController.emailController,
                validator: authController.validateName,
              ),
              CustomTextField(
                hintText: 'Phone',
                prefixIcon: HugeIcons.strokeRoundedCallPaused02,
                controller: authController.phoneController,
                validator: authController.validatePhone,
              ),
              CustomTextField(
                hintText: 'Password',
                isPassword: true,
                prefixIcon: HugeIcons.strokeRoundedLockPassword,
                controller: authController.passwordController,
                validator: authController.validatePassword,
              ),
              CustomTextField(
                hintText: 'Confirm Password',
                isPassword: true,
                prefixIcon: HugeIcons.strokeRoundedValidation,
                controller: authController.confirmPasswordController,
                validator: authController.validatePassword,
              ),
              (screenHeight(context) * 0.05).sh,
              CustomButton(
                text: 'Register',
                onTap: () {},
                width: screenWidth(context) * 0.5,
                height: screenHeight(context) * 0.07,
              ),
              (screenHeight(context) * 0.006).sh,
              TextButton(
                onPressed: () {
                  Get.offNamed(AppRoutes.loginViewPath);
                },
                child: Text(
                  'Already Have An Account',
                  style: AppTextStyles.textStyle19.copyWith(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
