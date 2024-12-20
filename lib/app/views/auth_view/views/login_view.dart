import 'package:flutter/material.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/global_widgets/waves_background.dart';

import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: WavesBackground(
        wavesColor: AppColors.whiteColor,
        child: LoginViewBody(),
      ),
    );
  }
}
