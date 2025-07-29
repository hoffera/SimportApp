import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:json_app/app/enum/enum.dart';
import 'package:json_app/app/pages/home_page/home_page.dart';
import 'package:json_app/app/pages/introduction/introduction_page.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import '../controllers/dynamic_json_page_controller.dart';

class DynamicJsonPageView extends GetView<DynamicJsonPageController> {
  const DynamicJsonPageView({
    super.key,
    required this.pageID,
    required this.placeholder,
  });

  final int pageID;
  final JsonWidgetData placeholder;

  Widget _drawer() {
    return RepaintBoundary(
      child: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128,
                height: 128,
                margin: const EdgeInsets.fromLTRB(40, 40, 40, 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.person),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                child: Divider(color: Colors.white),
              ),
              Text(
                'Felipe Hoffmeister',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'ADMINISTRADOR - APPIX',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 4),
              Text('felipe@email.com', style: TextStyle(color: Colors.white70)),
              SizedBox(height: 4),
              Text(
                'Usuário desde: Jan 1, 2016',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 4),

              ListTile(
                leading: Icon(Icons.brightness_6),
                title: Text(
                  'Tema escuro',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Switch(
                  activeTrackColor: Colors.green,
                  trackOutlineColor: const WidgetStatePropertyAll(Colors.white),
                  trackOutlineWidth: const WidgetStatePropertyAll(1),
                  value: controller.themeController.isDarkMode.value,
                  onChanged: (_) => controller.themeController.toggleTheme(),
                ),
              ),

              SizedBox(height: 4),
              Obx(
                () => ListTile(
                  leading: Icon(Icons.language),
                  title: Text(
                    'Idioma',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: PopupMenuButton<String>(
                    initialValue: controller.idiomaAtual,
                    onSelected: (val) => controller.idiomaAtual = val,
                    itemBuilder: (_) => [
                      PopupMenuItem(
                        value: 'Português',
                        child: Text('Português'),
                      ),
                      PopupMenuItem(value: 'Inglês', child: Text('Inglês')),
                      PopupMenuItem(value: 'Espanhol', child: Text('Espanhol')),
                    ],
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(controller.idiomaAtual),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4),
              ListTile(
                leading: Icon(Icons.people),
                title: Text(
                  'Clientes',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Get.to(HomePage());
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                child: Divider(color: Colors.white),
              ),
              ListTile(
                onTap: () {
                  Get.to(IntroductionPage());
                },
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text(
                  'Sair',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              DefaultTextStyle(
                style: TextStyle(fontSize: 12, color: Colors.white54),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final content =
          controller.widgetData.value?.build(context: context) ??
          placeholder.build(context: context);

      return AdvancedDrawer(
        controller: controller.drawerController,
        drawer: _drawer(),
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: AppColors.primary),
        ),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        disabledGestures: true,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () => controller.drawerController.showDrawer(),
                  icon: ValueListenableBuilder<AdvancedDrawerValue>(
                    valueListenable: controller.drawerController,
                    builder: (_, value, _) {
                      return AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: Icon(
                          value.visible ? Icons.clear : Icons.person,
                          color: Theme.of(context).colorScheme.primary,
                          key: ValueKey<bool>(value.visible),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          body: AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: KeyedSubtree(
              key: ValueKey(controller.widgetData.value?.hashCode ?? 0),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(hasScrollBody: false, child: content),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
