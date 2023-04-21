import 'dart:io';

import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? url;

  const ProductImage({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: SafeArea(
        child: Container(
          height: 450,
          width: double.infinity,
          decoration: _imageDecoration(),
          child: Opacity(
            opacity: 0.8,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                child: getImage(url)),
          ),
        ),
      ),
    );
  }

  BoxDecoration _imageDecoration() => const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))
          ]);

  Widget getImage(String? image) {
    if (image == null) {
      return const Image(
          image: AssetImage('assets/no-image.png'), fit: BoxFit.cover);
    }

    if (image.startsWith('http')) {
      return FadeInImage(
          placeholder: const AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(url!),
          fit: BoxFit.cover);
    }

    return Image.file(
      File(image),
      fit: BoxFit.cover,
    );
  }
}
