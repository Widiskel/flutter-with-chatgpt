import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_image_controller.dart';

class ChatImageView extends GetView<ChatImageController> {
  const ChatImageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Image Generator'),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
        ),
        body: GetBuilder<ChatImageController>(builder: (controller) {
          return DashChat(
            currentUser: controller.user,
            typingUsers: controller.typingUsers,
            messageOptions: MessageOptions(
              currentUserContainerColor: Colors.black,
              currentUserTextColor: Colors.white,
              containerColor:
                  controller.error ? Colors.red : Colors.greenAccent,
              textColor: controller.error ? Colors.white : Colors.black,
              showCurrentUserAvatar: false,
              showOtherUsersAvatar: true,
              showOtherUsersName: true,
              showTime: true,
              timePadding: const EdgeInsets.only(top: 20),
            ),
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
