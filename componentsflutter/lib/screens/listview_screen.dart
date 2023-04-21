import 'package:componentsflutter/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  final options = const ['Megaman', 'Metal Gear', 'Super Smash'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('ListView'),
        ),
        body: ListView.separated(
            itemCount: options.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(options[index]),
                  leading: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppTheme.primary,
                  ),
                  onTap: () => {},
                ),
            separatorBuilder: (_, __) => const Divider()));
  }
}
