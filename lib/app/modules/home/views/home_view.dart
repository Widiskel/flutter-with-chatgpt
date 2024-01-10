import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wai/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'wAI',
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Get.toNamed(Routes.CHATBOT),
                child: Container(
                  width: Get.width * 0.3,
                  height: Get.width * 0.3,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    color: Colors.greenAccent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.chat,
                        size: Get.width * 0.12,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'CHAT',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.CHAT_IMAGE),
                child: Container(
                  width: Get.width * 0.3,
                  height: Get.width * 0.3,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    color: Colors.greenAccent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Get.width * 0.12,
                        height: Get.width * 0.12,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Icon(
                                Icons.chat,
                                size: Get.width * 0.04,
                                color: Colors.white,
                              ),
                            ),
                            Center(
                              child: Icon(
                                Icons.image,
                                size: Get.width * 0.1,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'IMAGE GENERATOR',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
