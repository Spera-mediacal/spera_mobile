import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_mobile/utils/constants.dart';

class Message {
  final String text;
  final bool isUser;

  Message({required this.text, required this.isUser});
}

class SperaBotController extends GetxController {
  final textController = TextEditingController();
  final _dio = dio.Dio();

  final _messages = <Message>[
    Message(
      text:
          'Hello Ali, my name is Spera. \nI am your medical assistant for today. How can I help you?',
      isUser: false,
    )
  ].obs;

  final _isLoading = false.obs;

  List<Message> get messages => _messages;

  bool get isLoading => _isLoading.value;

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  Future<void> sendMessage() async {
    if (textController.text.trim().isEmpty) return;

    final userMessage = Message(
      text: textController.text.trim(),
      isUser: true,
    );
    _messages.add(userMessage);

    try {
      _isLoading.value = true;

      final response = await _dio.post(
        'http://${Constants.localIP}/api/chat',
        data: {
          'msg': userMessage.text,
        },
        options: dio.Options(
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      final botMessage = Message(
        text: response.data['answer'].toString().trim(),
        isUser: false,
      );
      _messages.add(botMessage);

      textController.clear();
    } catch (e) {
      _messages.add(Message(
        text: 'Sorry, there was an error processing your message.',
        isUser: false,
      ));
      print('Error sending message: $e');
    } finally {
      // Reset loading state
      _isLoading.value = false;
    }
  }
}
