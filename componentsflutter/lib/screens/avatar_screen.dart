import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
   
  const AvatarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar View'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              backgroundColor: Colors.orange[900],
              child: const Text('SL' , style: TextStyle(color: Colors.white),),
            ),
          )
        ]
      ),
      body: const Center(
         child: CircleAvatar(
          maxRadius: 100,
          backgroundImage: NetworkImage('https://fondosmil.com/fondo/93318.jpg'),
         ),

      ),
    );
  }
}