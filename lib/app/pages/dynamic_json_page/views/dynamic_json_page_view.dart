import 'package:flutter/cupertino.dart' show CupertinoSwitch;
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:json_app/app/enum/enum.dart';
import 'package:json_app/app/pages/notifications_page/controllers/notifications_page_controller.dart';
import 'package:json_app/app/pages/notifications_page/views/notifications_page_view.dart';
import 'package:json_app/l10n/app_localizations.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:mix/mix.dart';

import '../controllers/dynamic_json_page_controller.dart';

class DynamicJsonPageView extends GetView<DynamicJsonPageController> {
  const DynamicJsonPageView({
    super.key,
    required this.pageID,
    required this.placeholder,
  });

  final int pageID;
  final JsonWidgetData placeholder;

  Widget _drawer(BuildContext context) {
    final termsStyle = Style(
      $text.style.color(AppColors.primary),
      $text.style.fontSize(8),
      $text.style.decorationColor(AppColors.primary),
      $text.style.fontFamily("Comfortaa"),
      $text.overflow.ellipsis(),
    );
    final textStyle = Style(
      controller.themeController.isDarkMode.value
          ? $text.color.white()
          : $text.color.black(),
      $text.fontSize(12),
      $text.overflow.ellipsis(),
    );
    return Obx(
      () => SafeArea(
        child: ListTileTheme(
          textColor: controller.themeController.isDarkMode.value
              ? Colors.white
              : Colors.black,
          iconColor: controller.themeController.isDarkMode.value
              ? Colors.white
              : Colors.black,

          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Box(
              style: Style(
                $box.elevation(2),
                $box.borderRadius(20),
                controller.themeController.isDarkMode.value
                    ? $box.color(AppColors.backgroundDark)
                    : $box.color.white(),
                $box.padding.all(20),
                $box.alignment.center(),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/81923101?v=4',
                      ),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Box(
                        style: Style(
                          $text.style.fontSize(18),
                          controller.themeController.isDarkMode.value
                              ? $text.color.white()
                              : $text.color.black(),
                          $text.style.fontWeight(FontWeight.bold),
                          $text.overflow.ellipsis(),
                        ),
                        child: StyledText('Felipe Hoffmeister'),
                      ),

                      SizedBox(height: 10),
                      Box(
                        style: textStyle,
                        child: StyledText('ADMINISTRADOR - APPIX'),
                      ),

                      SizedBox(height: 6),
                      Box(
                        style: textStyle,
                        child: StyledText('felipe@email.com'),
                      ),
                      SizedBox(height: 6),
                      Box(
                        style: textStyle,
                        child: StyledText('Usuário desde: Jan 1, 2016'),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),

                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: Box(
                      style: Style(
                        $box.borderRadius(10),
                        $box.width(60),
                        $box.color.white(),
                        $box.height(60),
                      ),
                      child: StyledImage(
                        image: NetworkImage(
                          'https://appix.cs.simport.com.br/gallery/86/image-download',
                        ),
                        style: Style($image.fit.fitWidth()),
                      ),
                    ),
                    title: Box(
                      style: Style(
                        $text.style.fontSize(14),
                        $text.style.fontWeight(FontWeight.w600),
                        $text.overflow.ellipsis(),
                      ),
                      child: StyledText(
                        "Terminal de cointaineres de Paranaguá",
                      ),
                    ),
                    subtitle: Box(
                      style: Style(
                        $text.style.fontSize(12),
                        $text.style.fontWeight(FontWeight.normal),
                        $text.overflow.clip(),
                      ),
                      child: StyledText("TCP"),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                    child: Divider(height: 0.5, color: Colors.grey.shade300),
                  ),

                  ListTile(
                    contentPadding: EdgeInsets.all(0),

                    leading: HeroIcon(HeroIcons.paintBrush, size: 24),
                    title: Text(
                      AppLocalizations.of(context)!.darkTheme,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    trailing: Obx(
                      () => CupertinoSwitch(
                        activeTrackColor: Colors.green,
                        trackOutlineColor: const WidgetStatePropertyAll(
                          Colors.white,
                        ),
                        trackOutlineWidth: const WidgetStatePropertyAll(1),

                        value: controller.themeController.isDarkMode.value,
                        onChanged: (_) =>
                            controller.themeController.toggleTheme(),
                      ),
                    ),
                  ),

                  SizedBox(height: 4),
                  Obx(
                    () => ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: HeroIcon(HeroIcons.language, size: 24),
                      title: Text(
                        AppLocalizations.of(context)!.language,
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      trailing: PopupMenuButton<String>(
                        initialValue: controller.idiomaAtual,
                        onSelected: (val) => controller.idiomaAtual = val,
                        itemBuilder: (_) => [
                          PopupMenuItem(
                            value: AppLocalizations.of(context)!.portuguese,
                            child: Text(
                              AppLocalizations.of(context)!.portuguese,
                            ),
                          ),
                          PopupMenuItem(
                            value: AppLocalizations.of(context)!.english,
                            child: Text(AppLocalizations.of(context)!.english),
                          ),
                          PopupMenuItem(
                            value: AppLocalizations.of(context)!.spanish,
                            child: Text(AppLocalizations.of(context)!.spanish),
                          ),
                        ],
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              controller.idiomaAtual,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                            HeroIcon(HeroIcons.chevronDown, size: 14),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: HeroIcon(HeroIcons.users, size: 24),
                    title: Text(
                      AppLocalizations.of(context)!.clients,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    onTap: () {
                      Get.toNamed('/home-page');
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                    child: Divider(height: 0.5, color: Colors.grey.shade300),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    onTap: () {
                      Get.toNamed('/login-page');
                    },
                    leading: HeroIcon(
                      HeroIcons.arrowRightStartOnRectangle,
                      size: 24,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.logout,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PressableBox(
                        onPress: () => controller.launchInBrowser(
                          Uri(
                            scheme: 'https',
                            host: 'simport.com.br',
                            path: 'termos-de-uso/',
                          ),
                        ),
                        child: StyledText(
                          AppLocalizations.of(context)!.termsOfService,
                          style: termsStyle,
                        ),
                      ),

                      StyledText(' | ', style: termsStyle),
                      PressableBox(
                        onPress: () => controller.launchInBrowser(
                          Uri(
                            scheme: 'https',
                            host: 'simport.com.br',
                            path: 'politica-de-privacidade/',
                          ),
                        ),
                        child: StyledText(
                          AppLocalizations.of(context)!.privacyPolicy,
                          style: termsStyle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _scaffoldJson(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: controller.appBarData.value != null
            ? PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: controller.appBarData.value!.build(context: context),
              )
            : AppBar(
                leadingWidth: 116,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ActionChip(
                    onPressed: controller.drawerController.showDrawer,

                    avatar: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/81923101?v=4',
                      ),
                    ),
                    label: Box(
                      style: Style(
                        $text.style.fontSize(10),
                        $text.style.fontWeight.bold(),
                        $text.overflow.ellipsis(),
                        $text.color(Theme.of(context).colorScheme.primary),
                      ),
                      child: StyledText('Felipe Hoffmeister'),
                    ),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),

                    padding: const EdgeInsets.symmetric(
                      horizontal: 4.0,
                      vertical: 4.0,
                    ),
                    labelPadding: const EdgeInsets.only(left: 4),
                  ),
                ),

                centerTitle: true,
                title: Box(
                  style: Style(
                    $text.style.fontSize(16),
                    $text.style.letterSpacing(1),
                    $text.overflow.clip(),
                    $text.color(Theme.of(context).colorScheme.primary),
                  ),
                  child: StyledText('Overview'.toUpperCase()),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: HeroIcon(
                      HeroIcons.arrowPath,
                      size: 24,
                      color: Theme.of(context).colorScheme.primary,
                    ),

                    onPressed: () async {
                      controller.drawerController.hideDrawer();
                      controller.appBarData.value = null;
                      controller.bodyData.value = null;
                      controller.bottomNavData.value = null;
                      Future.delayed(Durations.short4);
                      controller.onInit();
                    },
                  ),
                  IconButton(
                    icon: HeroIcon(
                      HeroIcons.bell,
                      size: 24,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () {
                      Get.put(NotificationsPageController());
                      Get.to(NotificationsPageView());
                    },
                  ),
                ],

                actionsPadding: const EdgeInsets.only(right: 8),
              ),

        body: controller.bodyData.value?.build(context: context),
        bottomNavigationBar: controller.bottomNavData.value?.build(
          context: context,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final content = controller.bodyData.value != null
          ? _scaffoldJson(context)
          : placeholder.build(context: context);

      return AdvancedDrawer(
        controller: controller.drawerController,
        drawer: _drawer(context),
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: AppColors.primary),
        ),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        disabledGestures: true,
        rtlOpening: controller.rtl.value,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return child;
          },
          child: KeyedSubtree(
            key: ValueKey(controller.bodyData.value?.hashCode ?? 0),
            child: content,
          ),
        ),
      );
    });
  }
}
