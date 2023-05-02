import 'package:app_news/models/category_model.dart';
import 'package:app_news/services/news_service.dart';
import 'package:app_news/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const _ListCategories(),
            !newService.isLoading 
            ? Expanded(child: ListaNoticias(noticias: newService.articlesByCategorySelected))
            : const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              )
            )
            
          ],
        ),
      ),
    );
  }
}

class _ListCategories extends StatelessWidget {
  const _ListCategories();

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, i) {
            final cName = categories[i].name;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _IconTop(
                    category: categories[i],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('${cName[0].toUpperCase()}${cName.substring(1)}')
                ],
              ),
            );
          }),
    );
  }
}

class _IconTop extends StatelessWidget {
  final CategoryModel category;

  const _IconTop({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        final newService = Provider.of<NewsService>(context, listen: false);
        newService.selectedCategory = category.name;
      },
      child: Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Icon(
            category.icon,
            color: newService.selectedCategory == category.name
                ? Colors.red
                : Colors.black54,
          )),
    );
  }
}
