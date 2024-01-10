import 'dart:developer';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:get/get.dart';
import 'package:wai/app/data/app_const.dart';

class ChatImageController extends GetxController {
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
        seconds: 30,
      ),
    ),
    enableLog: false,
  );

  bool error = false;

  onChatSend(ChatMessage message) async {
    typingUsers.add(bot);
    if (error) {
      messages.removeLast();
    }
    messages.add(message);
    error = false;
    update();
    try {
      String prompt = message.text;

      final request = GenerateImage(prompt, 1,
          size: ImageSize.size256, responseFormat: Format.url);
      log('req : ${request.toJson().toString()}');

      final response = await gpt.generateImage(request);
      log('res : ${response?.toJson().toString()}');

      messages.addIf(
        response != null,
        ChatMessage(user: bot, createdAt: DateTime.now(), medias: [
          ChatMedia(
            url: response!.data!.last!.url!,
            fileName: DateTime.now().toIso8601String(),
            type: MediaType.image,
          )
        ]),
      );
    } catch (e) {
      log("Error during image generation: ${e.toString()}");
      messages.add(
        ChatMessage(
            user: bot, createdAt: DateTime.now(), text: "An error occured !!!"),
      );
      error = true;
    } finally {
      typingUsers.remove(bot);
      update();
    }
  }
}
