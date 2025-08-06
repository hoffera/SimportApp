import "package:flutter/material.dart";
import "package:json_app/app/components/cards/commom_card.dart";
import "package:json_app/app/components/text/title_widget.dart";

class TempoPageView extends StatefulWidget {
  const TempoPageView({super.key});

  @override
  State<TempoPageView> createState() => _TempoPageViewState();
}

class _TempoPageViewState extends State<TempoPageView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            TitleWidget(title: "Tempo"),
            SizedBox(height: 50),
            CommomCard(
              title: "Mare",
              subtitle: "ha 10 minutos",
              iconURL:
                  "https://appa.cs.simport.com.br/gallery/33/image-download",
            ),

            CommomCard(
              title: "Direção média",
              subtitle: "ha 10 minutos",
              iconURL:
                  "https://appa.cs.simport.com.br/gallery/36/image-download",
            ),
          ],
        ),
      ),
    );
  }
}
