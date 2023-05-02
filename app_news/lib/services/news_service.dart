import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

const _URL_API = 'https://newsapi.org/v2';
const API_KEY = '87c09dd7ce6f41d2a6ddf1411adacef1';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';
  bool _isLoading = true;

  List<CategoryModel> categories = [
    CategoryModel(Icons.business_center, 'business'),
    CategoryModel(Icons.tv, 'entertainment'),
    CategoryModel(Icons.person_pin_rounded, 'general'),
    CategoryModel(Icons.medical_information, 'health'),
    CategoryModel(Icons.science, 'science'),
    CategoryModel(Icons.sports_soccer, 'sports'),
    CategoryModel(Icons.computer, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadLines();
    categories.forEach((item) {
      categoryArticles[item.name] = List.empty(growable: true);
    });
    getArticlesByCategory(_selectedCategory);
  }

  bool get isLoading => _isLoading;

  get selectedCategory => _selectedCategory;
  set selectedCategory( dynamic valor ) {
    _selectedCategory = valor;

    _isLoading = true;
    getArticlesByCategory( valor );
    notifyListeners();
  }

  List<Article> get articlesByCategorySelected =>
      categoryArticles[selectedCategory]!;

  getTopHeadLines() async {
    const url = '$_URL_API/top-headlines?country=us&apiKey=$API_KEY';
    final res = await http.get(Uri.parse(url));
    final newsRes = newResponseFromJson(res.body);

    headlines.addAll(newsRes.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.isNotEmpty) {
      _isLoading = false;
      notifyListeners();
      return categoryArticles[category];
    }

    final url =
        '$_URL_API/top-headlines?country=us&category=$category&apiKey=$API_KEY';
    final res = await http.get(Uri.parse(url));
    final newsRes = newResponseFromJson(res.body);

    categoryArticles[category]!.addAll(newsRes.articles);

    _isLoading = false;
    notifyListeners();
  }
}
