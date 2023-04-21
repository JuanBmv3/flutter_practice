import 'package:flutter/material.dart';

class HomeMine extends StatefulWidget {
  const HomeMine({super.key});

  @override
  State<HomeMine> createState() => _HomeMineState();
}

class _HomeMineState extends State<HomeMine> {
  int cantidad = 0;

  void increment() {
    setState(() {
      cantidad++;
    });
  }

  void reset() {
    setState(() {
      cantidad = 0;
    });
  }

  void decrement() {
    setState(() {
      cantidad--;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle font30 = const TextStyle(fontSize: 30.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Cantidad de clicks',
            style: font30,
          ),
          Text(
            '$cantidad',
            style: font30,
          )
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonState(
          incrementFn: increment, resetFn: reset, decrementFn: decrement),
    );
  }
}

class ButtonState extends StatelessWidget {
  final Function incrementFn, resetFn, decrementFn;

  const ButtonState({
    super.key,
    required this.incrementFn,
    required this.resetFn,
    required this.decrementFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.plus_one),
          onPressed: () => incrementFn(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.exposure_zero),
          onPressed: () => resetFn(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.exposure_minus_1),
          onPressed: () => decrementFn(),
        ),
      ],
    );
  }
}
