import 'package:flutter/material.dart';
import 'package:spera_mobile/app/views/auth_view/widgets/register_view_body.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/global_widgets/waves_background.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: WavesBackground(
        wavesColor: AppColors.whiteColor,
        child: RegisterViewBody(),
      ),
    );
  }
}
