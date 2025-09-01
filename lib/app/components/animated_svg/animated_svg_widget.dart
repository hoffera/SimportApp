import "package:flutter/material.dart";

class AnimatedSvg extends StatefulWidget {
  const AnimatedSvg({super.key});

  @override
  State<AnimatedSvg> createState() => _AnimatedSvgState();
}

class _AnimatedSvgState extends State<AnimatedSvg>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;
  late final List<Animation<Offset>> _animations;

  final List<String> _imagePaths = [
    "assets/images/logo.png",
    "assets/images/s.png",
    "assets/images/i.png",
    "assets/images/m.png",
    "assets/images/p.png",
    "assets/images/o.png",
    "assets/images/r.png",
    "assets/images/t.png",
  ];

  final List<double> _heights = [
    60, // logo
    35, 35, 35, 35, 35, 35, 35, // letras
  ];

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(_imagePaths.length, (i) {
      final controller = AnimationController(
        duration: const Duration(seconds: 3),
        vsync: this,
      );

      Future.delayed(Duration(milliseconds: i * 500), () {
        controller.repeat(reverse: true);
      });

      return controller;
    });

    _animations = _controllers.map((controller) {
      return Tween<Offset>(
        begin: const Offset(0, 0),
        end: const Offset(0, -0.6),
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    }).toList();
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(_imagePaths.length, (i) {
        return Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: SlideTransition(
            position: _animations[i],
            child: Image.asset(_imagePaths[i], height: _heights[i]),
          ),
        );
      }),
    );
  }
}
