import 'package:flutter/material.dart';

import '../models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 30),
        width: double.infinity,
        height: 400,
        decoration: cardDecoration(),
        child: Stack(alignment: Alignment.bottomCenter, children: [
          BackgroundCard(url: product.picture),
          DetailsCard(name: product.name, id: product.id!),
          Positioned(
            right: 0,
            top: 0,
            child: _PriceCard(price: product.price),
          ),
          if(!product.available)
          Positioned(
            left: 0,
            top: 0,
            child: _AvailableCard(),
          )
        ]),
      ),
    );
  }

  

  BoxDecoration cardDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
                color: Colors.black38, offset: Offset(0, 5), blurRadius: 18)
          ]);
}

class _AvailableCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 120,
      alignment: Alignment.center,
      decoration: _decorationAvailable(),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Not available',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _decorationAvailable() => const BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), bottomRight: Radius.circular(25)));
}

class _PriceCard extends StatelessWidget {
  final double price;

  const _PriceCard({required this.price});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      alignment: Alignment.center,
      decoration: _decorationPrice(),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '\$$price',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _decorationPrice() => const BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(25), bottomLeft: Radius.circular(25)));
}

class BackgroundCard extends StatelessWidget {
  final String? url;
  const BackgroundCard({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
        width: double.infinity,
        height: 400,
        child: url == null 
        ? const Image(image: AssetImage('assets/no-image.png'), fit: BoxFit.cover)
        : FadeInImage(
            placeholder: const AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(url!),
            fit: BoxFit.cover
          ),
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  final String name;
  final String id;
  const DetailsCard({super.key, required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _decorationDetailsCard(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              name,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(id, style: const TextStyle(color: Colors.white, fontSize: 13))
          ],
        ),
      ),
    );
  }

  BoxDecoration _decorationDetailsCard() => const BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
}
