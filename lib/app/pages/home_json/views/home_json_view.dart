import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:json_app/app/pages/home_json_screen_page/views/home_json_screen_page_view.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import '../controllers/home_json_controller.dart';

class HomeJsonView extends GetView<HomeJsonController> {
  const HomeJsonView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Menu Principal")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.jsonPages.length,
        itemBuilder: (context, index) {
          final page = controller.jsonPages[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => JsonScreenPage()),
                );
              },
              child: Text(page['label'] ?? 'Sem título'),
            ),
          );
        },
      ),
    );
  }
}
