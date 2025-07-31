import 'package:flutter/material.dart';
import 'package:json_app/app/enum/enum.dart';
import 'package:mix/mix.dart';

class HomeCard extends StatefulWidget {
  final String? logo;
  final VoidCallback? onTap;
  final String title;
  final String subtitle;

  const HomeCard({
    super.key,
    this.logo,
    this.onTap,
    required this.title,
    required this.subtitle,
  });

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
        height: 80,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primary),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              StyledImage(
                image: NetworkImage(widget.logo ?? ''),
                style: Style($image.fit.contain(), $image.width(150)),
              ),
              SizedBox(width: 5),
              SizedBox(
                width: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Box(
                      style: Style(
                        $text.style.color.black(),
                        $text.style.fontSize(14),
                        $text.style.fontWeight(FontWeight.w900),
                        $text.style.fontFamily('Comfortaa'),
                        $text.overflow.clip(),
                      ),
                      child: StyledText(widget.subtitle.toUpperCase()),
                    ),
                    Box(
                      style: Style(
                        $text.style.color.grey(),
                        $text.style.fontSize(12),
                        $text.style.fontWeight(FontWeight.normal),
                        $text.style.fontFamily('Comfortaa'),
                        $text.overflow.ellipsis(),
                      ),
                      child: StyledText(widget.title),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
