import 'package:http/http.dart' as http;
import 'dart:convert';

import 'meal.dart';
class Category {
  final int id;
  final String name;
  final String image;
  final List<Meal> meals;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.meals,
  });

  // Factory constructor for JSON deserialization
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image:json['image'].replaceFirst(RegExp(r'^data:image\/[a-zA-Z]+;base64,'), '')  ,
      meals: (json['meals'] as List)
          .map((meal) => Meal.fromJson(meal))
          .toList(),
    );
  }

  // Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'meals': meals.map((meal) => meal.toJson()).toList(),
    };
  }

  static Future<List<Category>> get() async {
    var url = Uri(
        host: '192.168.0.108',
        scheme: 'http',
        path: '/kitchen-laravel/public/api/categories');

    final response = await http.get(url);
    final List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData.map((e) => Category.fromJson(e)).toList();
  }
}
