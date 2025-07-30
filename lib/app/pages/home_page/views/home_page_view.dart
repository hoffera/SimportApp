import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_app/app/client/client_model.dart';
import 'package:json_app/app/enum/enum.dart';
import 'package:json_app/components/cards/home_card.dart';
import 'package:transformable_list_view/transformable_list_view.dart';

import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  Matrix4 getTransformMatrix(TransformableListItem item) {
    const endScaleBound = 0.3;
    final animationProgress = item.visibleExtent / item.size.height;
    final paintTransform = Matrix4.identity();

    if (item.position != TransformableListItemPosition.middle &&
        item.position != TransformableListItemPosition.topEdge) {
      final scale = endScaleBound + ((1 - endScaleBound) * animationProgress);
      paintTransform
        ..translate(item.size.width / 2)
        ..scale(scale)
        ..translate(-item.size.width / 2);
    }

    return paintTransform;
  }

  Widget _homeCard(Client client) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: HomeCard(
        title: client.nome ?? '',
        subtitle: client.identificacao ?? '',
        logo: client.logo,
        onTap: () => controller.abrirCliente(client),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'Clientes disponíveis',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.primary,
            letterSpacing: 0.53,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.clients.isEmpty) {
          return const Center(child: Text('Nenhum cliente disponível'));
        }

        return TransformableListView.builder(
          itemCount: controller.clients.length,
          itemBuilder: (context, index) {
            final client = controller.clients[index];
            return _homeCard(client);
          },
          getTransformMatrix: getTransformMatrix,
        );
      }),
    );
  }
}
