import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  void increase() {
    setState(() {
      counter++;
    });
  }

  void decrease() {
    setState(() {
      counter--;
    });
  }

  void reload() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle font30 = const TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        elevation: 10.0,
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Número de clicks',
              style: font30,
            ),
            Text(
              '$counter',
              style: font30,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: EstateButtons(
          increaseFn: increase, decreaseFn: decrease, reloadFn: reload),
    );
  }
}

class EstateButtons extends StatelessWidget {
  final Function increaseFn, decreaseFn, reloadFn;

  const EstateButtons({
    super.key,
    required this.increaseFn,
    required this.decreaseFn,
    required this.reloadFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      FloatingActionButton(
          child: const Icon(Icons.add), onPressed: () => increaseFn()),
      FloatingActionButton(
        child: const Icon(Icons.update_rounded),
        onPressed: () => reloadFn(),
      ),
      FloatingActionButton(
        child: const Icon(Icons.exposure_minus_1_outlined),
        onPressed: () => decreaseFn(),
      ),
    ]);
  }
}
