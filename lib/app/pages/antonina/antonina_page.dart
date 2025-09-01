import "package:flutter/material.dart";
import "package:flutter_advanced_drawer/flutter_advanced_drawer.dart";
import "package:json_app/app/components/appbar/default_appbar/view/default_appbar.dart";
import "package:json_app/app/components/appbar/default_drawer/view/default_drawer.dart";
import "package:json_app/app/components/cards/commom_card.dart";
import "package:json_app/app/components/text/title_widget.dart";
import "package:json_app/app/pages/notifications_page/views/notifications_page_view.dart";

class AntoninaPage extends StatefulWidget {
  const AntoninaPage({super.key});

  @override
  State<AntoninaPage> createState() => _AntoninaPageState();
}

class _AntoninaPageState extends State<AntoninaPage> {
  final drawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: DefaultAppBar(
          url: "https://avatars.githubusercontent.com/u/81923101?v=4",
          name: "Felipe Hoffmeister",
          title: "Overview",
        ),
      ),
      drawer: DefaultDrawer(
        name: "Felipe Hoffmeister",
        url: "https://avatars.githubusercontent.com/u/81923101?v=4",
        email: "felipe@gmail.com",
        since: "Usuário desde: Jan 1, 2016",
        subtitle: "ADMINISTRADOR - APPIX",
        clientLogo: "https://appix.cs.simport.com.br/gallery/86/image-download",
        clientName: "Terminal de cointaineres de Paranaguá",
        clientSubtitle: "TCP",
      ),
      endDrawer: NotificationsPageView(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              TitleWidget(title: "Vento"),
              SizedBox(height: 50),
              CommomCard(
                title: "Mare",
                subtitle: "ha 10 minutos",
                iconURL:
                    "https://appa.cs.simport.com.br/gallery/33/image-download",
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
