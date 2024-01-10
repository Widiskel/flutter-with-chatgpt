import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_bot_controller.dart';

class ChatBotView extends GetView<ChatBotController> {
  const ChatBotView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chat Bot'),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
        ),
        body: GetBuilder<ChatBotController>(builder: (controller) {
          return DashChat(
            currentUser: controller.user,
            typingUsers: controller.typingUsers,
            messageOptions: const MessageOptions(
                currentUserContainerColor: Colors.black,
                currentUserTextColor: Colors.white,
                containerColor: Colors.greenAccent,
                textColor: Colors.black,
                showCurrentUserAvatar: false,
                showOtherUsersAvatar: true,
                showTime: true,
                timePadding: EdgeInsets.only(top: 20)),
            onSend: (ChatMessage m) {
              controller.onChatSend(m);
            },
            messages: controller.messages.reversed.toList(),
          );
        }),
      ),
    );
  }
}
