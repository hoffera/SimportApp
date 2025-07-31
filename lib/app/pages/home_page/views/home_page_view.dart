import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:json_app/app/client/client_model.dart';
import 'package:json_app/app/enum/enum.dart';
import 'package:json_app/components/cards/home_card.dart';
import 'package:transformable_list_view/transformable_list_view.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  Matrix4 getTransformMatrix(TransformableListItem item) {
    const endScaleBound = 0.3;
    final animationProgress = item.visibleExtent / item.size.height;
    final paintTransform = Matrix4.identity();

    if (item.position != TransformableListItemPosition.middle) {
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

  Color lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final lightened = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );
    return lightened.toColor();
  }

  PreferredSize _appBar() {
    double height = 200.0;
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Stack(
        children: [
          WaveWidget(
            config: CustomConfig(
              colors: [
                lighten(AppColors.primary, 0.1),
                lighten(AppColors.primary, 0.2),

                Colors.white,
              ],
              durations: [18000, 8000, 12000],
              heightPercentages: [0.75, 0.76, 0.80],
            ),
            backgroundColor: AppColors.primary,
            size: Size(double.infinity, height),
            waveAmplitude: 10,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: SvgPicture.asset(
                "assets/images/simport_logo.svg",
                width: 100,
                height: 100,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: SizedBox());
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
