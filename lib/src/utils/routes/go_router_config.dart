import "dart:convert";

import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:json_app/src/data/services/auth_notifier.dart";
import "package:json_app/src/ui/exporter/appa/exporter_appa_notification_screen.dart";
import "package:json_app/src/ui/exporter/exporter.dart";
import "package:json_app/src/ui/screens/dynamic/dynamic_screen.dart";
import "package:json_app/src/ui/screens/home/home_screen.dart";
import "package:json_app/src/ui/screens/login/login_screen.dart";
import "package:json_app/src/ui/widgets/error_screen/error_screen.dart";

import "../../../main.dart";

class SimportRouter {
  GoRouter router({required AuthNotifier authNotifier}) {
    return GoRouter(
      navigatorKey: navigatorKey,
      // initialLocation: "/login-page",
      initialLocation: "/exporter-screen",
      refreshListenable: authNotifier,

      // redirect: (context, state) async {
      //   if (!authNotifier.isInitialized) {
      //     return "/login-page";
      //   }

      //   final isLoggedIn = authNotifier.isLoggedIn;
      //   final isAtLoginPage = state.matchedLocation == "/login-page";

      //   if (!isLoggedIn) {
      //     return "/login-page";
      //   }

      //   if (isLoggedIn && isAtLoginPage) {
      //     final clientStore = getIt.get<ClientStore>();
      //     await clientStore.loadClients();
      //     if (clientStore.uniqueClient) {
      //       final client = clientStore.clientList.first;
      //       if (client.mainViewId != null) {
      //         final mainView = client.views.firstWhere(
      //           (view) => view.id == client.mainViewId,
      //         );

      //         if (mainView.skeleton == null) {
      //           return "/error-page";
      //         }
      //         final encodedSkeleton = base64Encode(
      //           utf8.encode(mainView.skeleton!),
      //         );
      //         return "/dynamic-page/${client.mainViewId}?skeleton=$encodedSkeleton";
      //       }
      //     }

      //     return "/home-page";
      //   }

      //   return null;
      // },
      routes: [
        GoRoute(
          path: "/login-page",
          name: "login-page",
          builder: (context, state) {
            return const LoginScreen();
          },
        ),

        GoRoute(
          path: "/home-page",
          name: "home-page",
          builder: (context, state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: "/dynamic-page/:pageID",
          name: "dynamic-page",
          builder: (context, state) {
            final String pageID = state.pathParameters["pageID"] ?? "";
            final String encodedSkeleton =
                state.uri.queryParameters["skeleton"] ?? "";

            try {
              final skeletonString = utf8.decode(base64Decode(encodedSkeleton));
              return DynamicScreen(
                pageID: int.parse(pageID),
                skeleton: skeletonString,
              );
            } catch (e) {
              return const ErrorScreen();
            }
          },
        ),

        GoRoute(
          path: "/error-page",
          name: "error-page",
          builder: (context, state) {
            return const ErrorScreen();
          },
        ),

        ...exporterRouter(),
      ],
    );
  }

  static List<RouteBase> exporterRouter() {
    return [
      GoRoute(
        path: "/exporter-screen",
        name: "exporter-screen",
        builder: (context, state) {
          registry.setValue("userName", "Teste");
          registry.setValue("userEmail", "teste@teste.com");

          registry.setValue(
            "userAvatarUrl",
            "https://appix.cs.simport.com.br/file/123/image",
          );
          registry.setValue("clientID", "123");
          registry.setValue("clientName", "Simport");
          registry.setValue(
            "clientLogoUrl",
            "https://appix.cs.simport.com.br/file/123/image",
          );
          return ExporterScreen(
            child: ExporterAppaNotificationScreen().build(context),
          );
        },
      ),
    ];
  }

  void goToDynamicPage(int id, String skeleton, BuildContext context) {
    final encodedSkeleton = base64Encode(utf8.encode(skeleton));
    context.go("/dynamic-page/$id?skeleton=$encodedSkeleton");
  }
}
