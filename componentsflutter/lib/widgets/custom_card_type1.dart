import 'package:componentsflutter/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
              leading: Icon(Icons.abc, color: AppTheme.primary),
              title: Text('Hola'),
              subtitle: Text('Asdasdasadasdasdasdasdadasdsada')),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => {}, 
                  child: const Text('Cancel')
                ),
                TextButton(
                  onPressed: () => {}, 
                  child: const Text('Ok')
                  )
              ],
            ),
          )
        ],
      )
    );
  }
}
