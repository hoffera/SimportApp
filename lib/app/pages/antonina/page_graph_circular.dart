import 'package:flutter/material.dart';

class PageGraphCircular extends StatefulWidget {
  const PageGraphCircular({super.key});

  @override
  State<PageGraphCircular> createState() => _PageGraphCircularState();
}

class _PageGraphCircularState extends State<PageGraphCircular> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            // child: PolarGraph(),
          ),
        ),
      ),
    );
  }
}
