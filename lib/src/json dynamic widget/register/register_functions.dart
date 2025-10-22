import "dart:convert";

import "package:flutter_mobx/flutter_mobx.dart";
import "package:go_router/go_router.dart";
import "package:json_app/main.dart";
import "package:json_app/src/data/services/auth_notifier.dart";
import "package:json_app/src/data/services/view_services.dart";
import "package:json_app/src/data/store/dynamic_screen_store.dart";
import "package:json_app/src/data/store/language_store.dart";
import "package:json_app/src/data/store/user_store.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";
import "package:url_launcher/url_launcher.dart";

import "../../data/store/theme_store.dart";

class RegisterFunctions {
  static void registerThemeValues(
    JsonWidgetRegistry registry,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    registry.setValue("primaryColor", colorScheme.primary);
    registry.setValue("onPrimaryColor", colorScheme.onPrimary);
    registry.setValue("secondaryColor", colorScheme.secondary);
    registry.setValue("onSecondaryColor", colorScheme.onSecondary);
    registry.setValue("backgroundScaffoldColor", theme.scaffoldBackgroundColor);
    registry.setValue("cardColor", theme.cardColor);
    registry.setValue("dividerColor", theme.dividerColor);
    registry.setValue("shadowColor", theme.shadowColor);
    registry.setValue("surfaceColor", colorScheme.surface);
    registry.setValue("onSurfaceColor", colorScheme.onSurface);
    registry.setValue("errorColor", colorScheme.error);
    registry.setValue("onErrorColor", colorScheme.onError);
    registry.setValue("highlightColor", theme.highlightColor);
  }

  static void registerAllFunctions(JsonWidgetRegistry registry) {
    registry.registerFunctions({
      "navigatePage": _createNavigatePageFunction(),
      "navigateToHome": _createNavigateToHomeFunction(),
      "showModalBottomSheet": _createShowModalBottomSheet(),
      "showDrawer": _createShowDrawerFunction(),
      "navBarIndex": _createNavBarIndexFunction(),
      "showDialog": _createShowDialogFunction(),
      "closeDialog": _createCloseDialogFunction(),
      "refreshScreen": _createRefreshScreenFunction(),
      "logout": _createLogoutFunction(),
      "launchUrl": _createLaunchUrlFunction(),
      "switchThemeFunction": _createSwitchThemeFunction(),
      "changeLocaleFunction": _createChangeLocaleFunction(),
    });

    registry.setValue("networkImageError", (
      BuildContext context,
      Object error,
      StackTrace? stackTrace,
    ) {
      return const Icon(Icons.person);
    });

    registry.setValue("currentPageIndex", 0);
    registry.setValue("switchTheme", getIt<ThemeStore>().isDarkMode);
  }

  static JsonWidgetFunction _createLaunchUrlFunction() {
    return ({args, required registry}) => () async {
      final url = args != null && args.isNotEmpty ? args[0] : null;
      if (url == null) {
        return;
      }
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    };
  }

  static JsonWidgetFunction _createChangeLocaleFunction() {
    return ({args, required registry}) {
      return (Locale? newLocale) {
        if (newLocale == null) {
          return;
        }
        getIt<LanguageStore>().setLocale(newLocale);
      };
    };
  }

  static JsonWidgetFunction _createSwitchThemeFunction() {
    return ({args, required registry}) {
      return (bool value) async {
        Future.delayed(const Duration(milliseconds: 250), () {
          getIt<ThemeStore>().setDarkMode(value);
        });
      };
    };
  }

  static JsonWidgetFunction _createLogoutFunction() {
    return ({args, required registry}) => () async {
      final authNotifier = getIt<AuthNotifier>();
      await authNotifier.logout();
      getIt<UserStore>().logout();
      await Future.delayed(const Duration(milliseconds: 100));

      final context = navigatorKey.currentContext;
      if (context != null && context.mounted) {
        context.go("/login-page");
      }
    };
  }

  static JsonWidgetFunction _createNavigatePageFunction() {
    return ({args, required registry}) => () {
      try {
        final dynamic pageId = args != null && args.isNotEmpty ? args[0] : null;

        if (pageId == null) {
          return;
        }

        int pageIdInt;
        if (pageId is String) {
          pageIdInt = int.tryParse(pageId) ?? 0;
        } else if (pageId is int) {
          pageIdInt = pageId;
        } else {
          return;
        }

        final context = navigatorKey.currentContext;

        if (context != null) {
          context.push("/dynamic-page/$pageIdInt");
        }
      } catch (e) {
        debugPrint("[navigatePage] Erro: $e");
      }
    };
  }

  static JsonWidgetFunction _createNavigateToHomeFunction() {
    return ({args, required registry}) => () async {
      final context = navigatorKey.currentContext;
      context!.go("/home-page");
    };
  }

  static JsonWidgetFunction _createRefreshScreenFunction() {
    return ({args, required registry}) => () async {
      final dynamic pageId = args != null && args.isNotEmpty ? args[0] : null;

      if (pageId == null) {
        return;
      }

      int pageIdInt;
      if (pageId is String) {
        pageIdInt = int.tryParse(pageId) ?? 0;
      } else if (pageId is int) {
        pageIdInt = pageId;
      } else {
        return;
      }
      final DynamicScreenStore dynamicScreenStore = getIt<DynamicScreenStore>();
      await dynamicScreenStore.loadDynamicScreen(pageIdInt);
    };
  }

  static JsonWidgetFunction _createNavBarIndexFunction() {
    return ({args, required registry}) {
      if (args == null || args.length < 2) {
        return;
      }

      final String targetKey = args[0];
      final String sourceKey = args[1];
      final dynamic newIndex = registry.getValue(sourceKey);

      if (newIndex is int) {
        registry.setValue(targetKey, newIndex);
      }
    };
  }

  static JsonWidgetFunction _createShowModalBottomSheet() {
    return ({args, required registry}) => () async {
      try {
        if (args == null || args.isEmpty) {
          return;
        }

        dynamic pageId = args[0];
        int? pageIdInt;
        if (pageId is int) {
          pageIdInt = pageId;
        } else if (pageId is String) {
          pageIdInt = int.tryParse(pageId);
        } else {
          return;
        }

        final context = navigatorKey.currentContext;
        if (pageIdInt == null || context == null) {
          return;
        }

        final language = getIt<LanguageStore>().currentLocale.languageCode;

        final dialogWidget = await ViewServices.getViewById(
          pageIdInt,
          language,
        );

        if (dialogWidget == null || !context.mounted) {
          return;
        }

        await showModalBottomSheet(
          context: navigatorKey.currentContext!,
          builder: (_) {
            final widget = parseWidget(dialogWidget.scaffold!);
            if (widget == null) {
              return Container();
            }
            return widget.build(context: context);
          },
        );
      } catch (e, stack) {
        print("[showModalBottomSheet] Erro: $e\n$stack");
      }
    };
  }

  static JsonWidgetFunction _createShowDrawerFunction() {
    return ({args, required registry}) => () async {
      try {
        if (args == null || args.isEmpty) {
          return;
        }

        dynamic pageId = args[0];
        int? pageIdInt;
        if (pageId is int) {
          pageIdInt = pageId;
        } else if (pageId is String) {
          pageIdInt = int.tryParse(pageId);
        } else {
          return;
        }

        final context = navigatorKey.currentContext;
        if (pageIdInt == null || context == null) {
          return;
        }

        final language = getIt<LanguageStore>().currentLocale.languageCode;

        final dialogWidget = await ViewServices.getViewById(
          pageIdInt,
          language,
        );

        if (dialogWidget == null || !context.mounted) {
          return;
        }

        await showGeneralDialog(
          context: navigatorKey.currentContext!,
          barrierDismissible: true,
          barrierLabel: "Drawer",
          pageBuilder: (BuildContext dialogContext, _, __) {
            final widget = parseWidget(dialogWidget.scaffold!);
            if (widget == null) {
              return Container();
            }

            return Observer(
              builder: (BuildContext context) => PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, result) {
                  if (!didPop) {
                    Navigator.of(dialogContext).pop();
                  }
                },
                child: Theme(
                  data: getIt<ThemeStore>().isDarkMode
                      ? getIt<ThemeStore>().clientThemeModel!.dark
                      : getIt<ThemeStore>().clientThemeModel!.light,
                  child: widget.build(context: dialogContext),
                ),
              ),
            );
          },

          transitionBuilder: (_, anim, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(anim),
              child: child,
            );
          },
        );
      } catch (e, stack) {
        debugPrint("[showDrawer] Erro: $e\n$stack");
      }
    };
  }

  static JsonWidgetFunction _createShowDialogFunction() {
    return ({args, required registry}) => () async {
      try {
        if (args == null || args.isEmpty) {
          print("[showDialog] ID da página não fornecido.");
          return;
        }

        dynamic pageId = args[0];
        int? pageIdInt;
        if (pageId is int) {
          pageIdInt = pageId;
        } else if (pageId is String) {
          pageIdInt = int.tryParse(pageId);
        } else {
          return;
        }

        final context = navigatorKey.currentContext;
        if (pageIdInt == null || context == null) {
          return;
        }

        final language = getIt<LanguageStore>().currentLocale.languageCode;

        final dialogWidget = await ViewServices.getViewById(
          pageIdInt,
          language,
        );

        if (dialogWidget == null || !context.mounted) {
          return;
        }

        await showDialog(
          context: context,
          builder: (_) {
            final widget = parseWidget(dialogWidget.scaffold!);
            if (widget == null) {
              return Container();
            }
            return widget.build(context: context);
          },
        );
      } catch (e, stack) {
        debugPrint("[showDialog] Erro: $e\n$stack");
      }
    };
  }

  static JsonWidgetFunction _createCloseDialogFunction() {
    return ({args, required registry}) => () {
      try {
        final context = navigatorKey.currentContext;
        if (context != null) {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        }
      } catch (e) {
        debugPrint("[closeDialog] Erro ao fechar dialog: $e");
      }
    };
  }
}

JsonWidgetData? parseWidget(String text) {
  try {
    final trimmedText = text.trim();
    if (trimmedText.isEmpty) {
      return null;
    }

    if (!trimmedText.startsWith("{") && !trimmedText.startsWith("[")) {
      return null;
    }

    Map<String, dynamic> jsonData;

    try {
      final decoded = jsonDecode(trimmedText);
      if (decoded is Map<String, dynamic>) {
        jsonData = decoded;
      } else if (decoded is List && decoded.isNotEmpty) {
        final firstItem = decoded.first;
        if (firstItem is Map<String, dynamic>) {
          jsonData = firstItem;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }

    Map<String, dynamic> widgetData;
    if (jsonData.containsKey("json")) {
      final jsonContent = jsonData["json"];
      if (jsonContent is Map<String, dynamic>) {
        widgetData = jsonContent;
      } else {
        return null;
      }
    } else {
      widgetData = jsonData;
    }

    if (widgetData.isEmpty) {
      return null;
    }

    try {
      final widget = JsonWidgetData.fromDynamic(widgetData, registry: registry);

      try {
        final testJson = widget.toJson();
        if (testJson.isEmpty) {
          return null;
        }
      } catch (e) {
        return null;
      }

      return widget;
    } catch (e) {
      return null;
    }
  } catch (e) {
    return null;
  }
}
