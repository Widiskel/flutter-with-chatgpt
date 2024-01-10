import 'package:get/get.dart';

import '../modules/chat_bot/bindings/chat_bot_binding.dart';
import '../modules/chat_bot/views/chat_bot_view.dart';
import '../modules/chat_image/bindings/chat_image_binding.dart';
import '../modules/chat_image/views/chat_image_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CHATBOT,
      page: () => const ChatBotView(),
      binding: ChatBotBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_IMAGE,
      page: () => const ChatImageView(),
      binding: ChatImageBinding(),
    ),
  ];
}
