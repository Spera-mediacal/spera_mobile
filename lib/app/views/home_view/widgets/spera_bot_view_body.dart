import 'package:flutter/material.dart';
import 'package:flutter_typing_indicator/flutter_typing_indicator.dart';
import 'package:get/get.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/size_config.dart';

import '../../../controllers/sepra_bot_controller.dart';
import 'chat_text_field.dart';
import 'message_widget.dart';

class SperaBotViewBody extends StatelessWidget {
  SperaBotViewBody({super.key});

  final SperaBotController controller = Get.put(SperaBotController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            screenWidth(context) * 0.05,
            screenWidth(context) * 0.02,
            screenWidth(context) * 0.05,
            screenHeight(context) * 0.1,
          ),
          child: Obx(() => ListView.builder(
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message = controller.messages[index];
                  return message.isUser
                      ? UserMessage(message: message.text)
                      : BotMessage(message: message.text);
                },
              )),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Obx(() {
              if (controller.isLoading) {
                try {
                  return const ChatLoading();
                } catch (e) {
                  print(e);
                }
                return const SizedBox.shrink();
              } else {
                return ChatTextField(
                  send: controller.sendMessage,
                  textEditingController: controller.textController,
                  isLoading: controller.isLoading,
                );
              }
            })),
      ],
    );
  }
}

class ChatLoading extends StatelessWidget {
  const ChatLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.only(bottom: screenHeight(context)*0.1),
      child: Center(
          child: TypingIndicator(
        backgroundColor: AppColors.accentColor.withOpacity(0.1),
        dotSize: 20,
        isGradient: true,
        dotGradient: const LinearGradient(
            colors: [AppColors.accentColor, AppColors.greyColor]),
      )),
    );
  }
}
