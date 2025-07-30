import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:json_app/app/enum/enum.dart';
import 'package:mix/mix.dart';

import '../controllers/notifications_page_controller.dart';

class NotificationsPageView extends GetView<NotificationsPageController> {
  const NotificationsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = controller.themeController;

    final RxList<Map<String, String>> notifications = <Map<String, String>>[
      {"title": "Bem-vindo!", "subtitle": "Obrigado por usar nosso app."},
      {"title": "Promoção", "subtitle": "50% OFF em todos os produtos hoje!"},
      {"title": "Atualização", "subtitle": "Nova versão disponível."},
      {"title": "Alerta", "subtitle": "Verifique sua conexão."},
    ].obs;

    return Scaffold(
      backgroundColor: controller.themeController.isDarkMode.value
          ? Colors.black
          : Colors.white,
      appBar: AppBar(
        backgroundColor: controller.themeController.isDarkMode.value
            ? Colors.black
            : Colors.white,
        automaticallyImplyLeading: false,
        title: Box(
          style: Style(
            $text.style.fontSize(24),
            themeController.isDarkMode.value
                ? $text.color.white()
                : $text.color.black(),
            $text.style.fontWeight(FontWeight.bold),
            $text.overflow.ellipsis(),
          ),
          child: StyledText('Notificações'),
        ),
        actions: [
          IconButton(
            icon: HeroIcon(
              HeroIcons.xMark,
              size: 24,
              color: themeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final item = notifications[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: themeController.isDarkMode.value
                    ? AppColors.backgroundDark
                    : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        item["title"]!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: themeController.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        item["subtitle"]!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.blueGrey,
                        ),
                      ),
                      leading: HeroIcon(
                        HeroIcons.bell,
                        size: 24,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        notifications.removeAt(index);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class NotificationData {
  final String title;
  final String subtitle;
  NotificationData(this.title, this.subtitle);
}
