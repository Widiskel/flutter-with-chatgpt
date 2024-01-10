import 'dart:developer';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:get/get.dart';
import 'package:wai/app/data/app_const.dart';

class ChatBotController extends GetxController {
  ChatUser user = ChatUser(
    id: '1',
    firstName: 'You',
  );
  ChatUser bot = ChatUser(
    id: '2',
    firstName: 'ChatGPT',
    profileImage: 'assets/img/openai.jpeg',
  );

  List<ChatUser> typingUsers = [];

  List<ChatMessage> messages = <ChatMessage>[];

  OpenAI gpt = OpenAI.instance.build(
    token: CHATGPT_TOKEN,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(
        seconds: 5,
      ),
    ),
    enableLog: false,
  );

  onChatSend(ChatMessage message) async {
    messages.add(message);
    typingUsers.add(bot);
    update();
    try {
      List<Messages> msgHistory = messages.map((e) {
        if (e.user == user) {
          return Messages(role: Role.user, content: e.text);
        } else {
          return Messages(role: Role.assistant, content: e.text);
        }
      }).toList();
      // log(msgHistory.map((e) => e.toJson()).toString());
      final request = ChatCompleteText(
          messages: msgHistory, maxToken: 200, model: Gpt4ChatModel());
      // log('req ${request.messages.map((e) => e.toJson()).toString()}');
      final response = await gpt.onChatCompletion(request: request);
      // log('res ${response!.choices.map((e) => e.toJson()).toString()}');
      for (var element in response!.choices) {
        messages.addIf(
          element.message != null,
          ChatMessage(
            user: bot,
            createdAt: DateTime.now(),
            text: element.message!.content,
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    } finally {
      typingUsers.remove(bot);
      update();
    }
  }
}
