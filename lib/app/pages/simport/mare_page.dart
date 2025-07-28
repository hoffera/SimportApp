import 'package:flutter/material.dart';
import 'package:json_app/components/text/title_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MarePageView extends StatefulWidget {
  const MarePageView({super.key});

  @override
  State<MarePageView> createState() => _MarePageViewState();
}

class _MarePageViewState extends State<MarePageView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),

            Skeletonizer(
              effect: ShimmerEffect(
                baseColor: Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest,

                duration: const Duration(seconds: 1),
              ),
              enabled: true,
              child: TitleWidget(title: "Maré"),
            ),
            Skeletonizer(
              enableSwitchAnimation: false,
              effect: ShimmerEffect(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                duration: const Duration(seconds: 1),
              ),
              enabled: true,
              child: SizedBox(width: double.infinity, height: 120),
            ),
          ],
        ),
      ),
    );
  }
}
