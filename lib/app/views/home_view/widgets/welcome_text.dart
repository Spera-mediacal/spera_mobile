import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/text_styles.dart';
import '../../../services/shared_pref_service/sahred_pref_service.dart';

class WelcomeText extends StatefulWidget {
  const WelcomeText({super.key});

  @override
  State<WelcomeText> createState() => _WelcomeTextState();
}

class _WelcomeTextState extends State<WelcomeText> {
  String? userName;

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final name = await SharedPreferencesHelper.getName();
    setState(() {
      userName = name ?? 'Guest';
    });
  }

  @override
  Widget build(BuildContext context) {
    int now = DateTime.now().hour;
    String greeting = now > 12 ? 'Good night' : 'Good morning';

    return Row(
      children: [
        if (userName == null)
          const CircularProgressIndicator()
        else
          Text(
            '$greeting,\n$userName',
            textAlign: TextAlign.start,
            style: AppTextStyles.textStyle35.copyWith(
              color: AppColors.whiteColor.withOpacity(0.8),
            ),
          ),
      ],
    );
  }
}