import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class HomeCard extends StatefulWidget {
  final String? logo;
  final VoidCallback? onTap;

  const HomeCard({super.key, this.logo, this.onTap});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  bool isPressed = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      isPressed = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      isPressed = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedContainer(
        duration: const Duration(microseconds: 1),
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12),

          boxShadow: isPressed
              ? []
              : [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 15,
                    spreadRadius: 1,
                    offset: const Offset(6, 6),
                  ),
                  const BoxShadow(
                    color: Colors.white70,
                    blurRadius: 15,
                    spreadRadius: 1,
                    offset: Offset(-6, -6),
                  ),
                ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StyledImage(
            image: NetworkImage(widget.logo ?? ''),
            style: Style($image.fit.contain(), $image.alignment.center()),
          ),
        ),
      ),
    );
  }
}
