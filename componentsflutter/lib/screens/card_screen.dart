import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards View'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          CustomCardType1(),
          CustomCardType2Screen(imageURL: 'https://fondosmil.com/fondo/93318.jpg', imageTitle:'Los hermosos ojos del Saitama'),
          CustomCardType2Screen(imageURL: 'https://e0.pxfuel.com/wallpapers/706/523/desktop-wallpaper-gojo-satoru-jujutsu-kaisen-thumbnail.jpg', imageTitle:'El Gojo bien chido',),
          CustomCardType2Screen(imageURL: 'https://w0.peakpx.com/wallpaper/580/927/HD-wallpaper-elden-ring-digital-art-gaming-2022.jpg'),
        ],
      ),
    );
  }
}
