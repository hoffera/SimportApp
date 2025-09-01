import "package:flutter/material.dart";

class AnimatedScaleWidget extends StatefulWidget {
  const AnimatedScaleWidget({super.key});

  @override
  State<AnimatedScaleWidget> createState() => _AnimatedScaleWidgetState();
}

class _AnimatedScaleWidgetState extends State<AnimatedScaleWidget> {
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 200,
          height: 50,
          color: Colors.red,
          child: UnconstrainedBox(
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: _value),
              duration: const Duration(milliseconds: 0),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(value * 50, 0),
                  child: Container(width: 100, height: 50, color: Colors.blue),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: 300,
          child: Slider.adaptive(
            value: _value,
            min: -1,
            max: 1.0,
            onChanged: (value) {
              setState(() => _value = value);
              print(value);
            },
          ),
        ),
      ],
    );
  }
}
