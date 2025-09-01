import "package:flutter/material.dart";

class PageGraphPlots extends StatefulWidget {
  const PageGraphPlots({super.key});

  @override
  State<PageGraphPlots> createState() => _PageGraphPlotsState();
}

class _PageGraphPlotsState extends State<PageGraphPlots> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}
