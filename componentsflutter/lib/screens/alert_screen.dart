
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIOS(BuildContext context){
    showCupertinoDialog(context: context, 
    builder: (context){
      return CupertinoAlertDialog(
        title:const Text('Titulo'),
        content: const Column(
          children: [
              Text('Este es el contenido de la alerta'),
              SizedBox(height: 10),
              FlutterLogo(size: 100)
          ]
        ),
         actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('Cancel'))
          ],
      );
    });
  }

  void displayDialog(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          title:  const Text('Titulo'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children:  [
              Text('Este es el contenido de la alerta'),
              SizedBox(height: 10),
              FlutterLogo(size: 100)
            ],

          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const  Text('Cancel'))
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Alert View'),
        backgroundColor: AppTheme.primary,
      ),
      body:  Center(
        child: ElevatedButton(
          onPressed: () => Platform.isAndroid ? displayDialog(context) : displayDialogIOS(context), 
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Ver alerta'),
          ) ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}
