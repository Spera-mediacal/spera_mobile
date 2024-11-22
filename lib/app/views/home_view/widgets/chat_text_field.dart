import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/global_widgets/custom_text_field.dart';
import '../../../../utils/global_widgets/glass_container.dart';
import '../../../../utils/size_config.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key, required this.send, required this.textEditingController,
  });

  final Function() send;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.only(bottom: screenHeight(context)*0.01),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextField(
              width: screenWidth(context) * 0.7,
              hintText: 'Message',
              controller: textEditingController,
            ),
            GlassContainer(
              height: screenHeight(context) * 0.065,
              width: screenWidth(context) * 0.17,
              onTap: send,
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedSent,
                color: AppColors.accentColor,
                size: 24.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
