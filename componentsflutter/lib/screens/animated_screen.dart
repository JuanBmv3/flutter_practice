import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width = 50;
  double _heigth = 50;
  Color _color = Colors.indigo;
  
  final List<Color> _colors = [
    Colors.orange,
    Colors.green,
    Colors.indigo,
    Colors.red,
    Colors.black,
    Colors.pink
  ];
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(20);

  void changeState() {
    Random random = Random();
    setState(() {
      _width = (random.nextDouble() * 700) + 70;
      _heigth = (random.nextDouble() * 700) + 70;
      _borderRadius = BorderRadius.circular(random.nextDouble() * 100);
      _color = _colors[random.nextInt(5)];
    });
    

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Screen'),
      ),
      body: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve : Curves.easeOutCubic,
        width: _width,
        height: _heigth,
        decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_circle, size: 35),
        onPressed: () => changeState(),
      ),
    );
  }
}
