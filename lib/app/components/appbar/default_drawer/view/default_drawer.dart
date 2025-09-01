import "package:flutter/cupertino.dart";
import "package:get/get.dart";
import "package:heroicons/heroicons.dart";
import "package:json_app/app/components/appbar/default_drawer/controller/default_drawer_controller.dart";
import "package:json_app/app/enum/enum.dart";
import "package:json_app/l10n/app_localizations.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:mix/mix.dart";

part "default_drawer.g.dart";

@jsonWidget
abstract class _DefaultDrawerBuilder extends JsonWidgetBuilder {
  const _DefaultDrawerBuilder({required super.args});

  @override
  DefaultDrawer buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class DefaultDrawer extends StatelessWidget {
  final String name;
  final String url;
  final String email;
  final String since;
  final String subtitle;
  final String clientLogo;
  final String clientName;
  final String clientSubtitle;
  DefaultDrawer({
    super.key,
    required this.name,
    required this.url,
    required this.email,
    required this.since,
    required this.subtitle,
    required this.clientLogo,
    required this.clientName,
    required this.clientSubtitle,
  });

  final controller = DefaultDrawerController();

  @override
  Widget build(BuildContext context) {
    return _drawer(context);
  }

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
                    child: CircleAvatar(backgroundImage: NetworkImage(url)),
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
                        child: StyledText(name),
                      ),

                      SizedBox(height: 10),
                      Box(
                        style: textStyle,
                        child: StyledText(subtitle.toUpperCase()),
                      ),

                      SizedBox(height: 6),
                      Box(style: textStyle, child: StyledText(email)),
                      SizedBox(height: 6),
                      Box(style: textStyle, child: StyledText(since)),
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
                        image: NetworkImage(clientLogo),
                        style: Style($image.fit.fitWidth()),
                      ),
                    ),
                    title: Box(
                      style: Style(
                        $text.style.fontSize(14),
                        $text.style.fontWeight(FontWeight.w600),
                        $text.overflow.ellipsis(),
                      ),
                      child: StyledText(clientName),
                    ),
                    subtitle: Box(
                      style: Style(
                        $text.style.fontSize(12),
                        $text.style.fontWeight(FontWeight.normal),
                        $text.overflow.clip(),
                      ),
                      child: StyledText(clientSubtitle),
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
                      Get.toNamed("/home-page");
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                    child: Divider(height: 0.5, color: Colors.grey.shade300),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    onTap: () {
                      Get.toNamed("/login-page");
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
                            scheme: "https",
                            host: "simport.com.br",
                            path: "termos-de-uso/",
                          ),
                        ),
                        child: StyledText(
                          AppLocalizations.of(context)!.termsOfService,
                          style: termsStyle,
                        ),
                      ),

                      StyledText(" | ", style: termsStyle),
                      PressableBox(
                        onPress: () => controller.launchInBrowser(
                          Uri(
                            scheme: "https",
                            host: "simport.com.br",
                            path: "politica-de-privacidade/",
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
}
