import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/global_widgets/custom_text_field.dart';
import '../../../../utils/global_widgets/glass_container.dart';
import '../../../../utils/size_config.dart';

class ChatTextField extends StatelessWidget {
  final Function() send;
  final TextEditingController textEditingController;
  final bool isLoading;

  const ChatTextField({
    super.key,
    required this.send,
    required this.textEditingController,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight(context) * 0.01),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextField(
              width: screenWidth(context) * 0.7,
              hintText: 'Message',
              controller: textEditingController,
              // Disable text field when loading
              enabled: !isLoading,
            ),
            GlassContainer(
              height: screenHeight(context) * 0.065,
              width: screenWidth(context) * 0.17,
              // Disable tap when loading
              onTap: isLoading ? null : send,
              child: isLoading
                  ? const CircularProgressIndicator(
                color: AppColors.accentColor,
                strokeWidth: 2,
              )
                  : const HugeIcon(
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