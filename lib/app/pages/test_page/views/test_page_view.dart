import 'package:flutter/material.dart';
import 'package:json_app/components/cards/commom_card.dart';
import 'package:json_app/components/simport/circular_graph.dart';

class TestPageView extends StatefulWidget {
  const TestPageView({super.key});

  @override
  State<TestPageView> createState() => _TestPageViewState();
}

class _TestPageViewState extends State<TestPageView> {
  double angle = 0;
  final List<double> angles = [0, 90, 180, 270];
  int index = 0;

  bool arrowOutward = true;
  Color pointerColor = Colors.grey[600]!;

  @override
  void initState() {
    super.initState();
    _startTest();
  }

  void _startTest() async {
    while (mounted) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        angle = angles[index];
        index = (index + 1) % angles.length;
      });
    }
  }

  void _toggleArrowDirection() {
    setState(() {
      arrowOutward = !arrowOutward;
    });
  }

  void _togglePointerColor() {
    setState(() {
      pointerColor = pointerColor == Colors.red
          ? Color.fromRGBO(100, 100, 100, 1)
          : Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommomCard(
                title: "Mare",
                subtitle: "há 10 minutos",
                iconURL:
                    'https://appa.cs.simport.com.br/gallery/33/image-download',
              ),
              const SizedBox(height: 40),
              CircularGraph(
                angleDegrees: angle,
                title: "De\nENE",
                pointerColor: pointerColor,
                arrowOutward: arrowOutward,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _toggleArrowDirection,
                child: Text('Alternar direção da seta '),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _togglePointerColor,
                child: Text('Alternar cor '),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
