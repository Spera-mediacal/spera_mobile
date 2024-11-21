import 'package:flutter/material.dart';
import 'package:spera_mobile/app/views/auth_view/widgets/setup_account_view_body.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/global_widgets/waves_background.dart';

class SetupAccountView extends StatelessWidget {
  const SetupAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WavesBackground(
        wavesColor: AppColors.accentColor.withOpacity(0.3),
        child: SetupAccountViewBody(),
      ),
    );
  }
}
