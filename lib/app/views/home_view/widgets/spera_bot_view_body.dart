import 'package:flutter/material.dart';

import 'package:spera_mobile/utils/size_config.dart';

import 'chat_text_field.dart';
import 'message_widget.dart';

class SperaBotViewBody extends StatelessWidget {
  const SperaBotViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.05),
          child: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BotMessage(
                  message:
                      'Hello Ali, my name is Spera. \nI am your medical assistant for today. How can I help you?',
                ),
                UserMessage(
                  message:
                      'Hello Ali, my name is Spera. \nI am your medical assistant for today. How can I help you?',
                )
              ],
            ),
          ),
        ),
        ChatTextField(
          send: () {},
          textEditingController: TextEditingController(),
        ),
      ],
    );
  }
}
