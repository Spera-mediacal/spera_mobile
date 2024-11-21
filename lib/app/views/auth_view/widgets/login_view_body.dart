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
              width: screenWidth(context) * 0.4,
              height: screenHeight(context) * 0.25,
            ),
            (screenHeight(context) * 0.1).sh,
            CustomTextField(
              hintText: 'Email',
              prefixIcon: HugeIcons.strokeRoundedMail01,
              controller: authController.emailController,
              validator: authController.validateEmail,
            ),
            CustomTextField(
              hintText: 'Password',
              isPassword: true,
              prefixIcon: HugeIcons.strokeRoundedLockPassword,
              controller: authController.passwordController,
              validator: authController.validatePassword,
            ),
            (screenHeight(context) * 0.005).sh,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
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
            CustomButton(
              text: 'Login',
              onTap: () {},
              width: screenWidth(context) * 0.5,
              height: screenHeight(context) * 0.07,
            ),
            (screenHeight(context) * 0.006).sh,
            TextButton(
              onPressed: () {
                Get.offNamed(AppRoutes.registerViewPath);
              },
              child: Text(
                'Create New Account',
                style: AppTextStyles.textStyle19.copyWith(),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
