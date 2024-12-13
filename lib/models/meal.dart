import 'package:http/http.dart' as http;
import 'dart:convert';



class Meal {
  final int id;
  final String name;
  final double price;
  final int categoryId;
  final String? description;
  final String? image;
  final int available;
  final String? calories;
  final String? prepTime;
  final String? spiceLevel;
  final int isVegan;
  final int isGlutenFree;
  final String? createdAt;
  final String? updatedAt;
  final String peopleCount;
  // final List<ChildMeal> childMeals;

  Meal({
    required this.id,
    required this.name,
    required this.price,
    required this.categoryId,
    this.description,
    this.image,
    required this.available,
    this.calories,
    this.prepTime,
    this.spiceLevel,
    required this.isVegan,
    required this.isGlutenFree,
    this.createdAt,
    this.updatedAt,
    required this.peopleCount,
    // required this.childMeals,
  });

  // Factory constructor for JSON deserialization
  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      categoryId: json['category_id'],
      description: json['description'] as String?,
      image: json['image'] as String?,
      available: json['available'],
      calories: json['calories'] as String?,
      prepTime: json['prep_time'] as String?,
      spiceLevel: json['spice_level'] as String?,
      isVegan: json['is_vegan'],
      isGlutenFree: json['is_gluten_free'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      peopleCount: json['people_count']
    //   childMeals: (json['child_meals'] as List)
    //       .map((child) => ChildMeal.fromJson(child))
    //       .toList(),
    );
  }

  // Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'category_id': categoryId,
      'description': description,
      'image': image,
      'available': available,
      'calories': calories,
      'prep_time': prepTime,
      'spice_level': spiceLevel,
      'is_vegan': isVegan,
      'is_gluten_free': isGlutenFree,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'people_count': peopleCount,
      // 'child_meals': childMeals.map((child) => child.toJson()).toList(),
    };
  }
    @override
  String toString() {
    // TODO: implement toString
    return name;
  }
    static Future<List<Meal>> get() async {
    var url = Uri(
        host: '192.168.0.108',
        scheme: 'http',
        path: '/kitchen-laravel/public/api/meals');

    final response = await http.get(url);
    final List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData.map((e) => Meal.fromJson(e)).toList();
  }
}

