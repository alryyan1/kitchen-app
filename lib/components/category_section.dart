import 'package:flutter/material.dart';

import '../components/category_card.dart';
import '../models/category.dart';
import '../models/food_category.dart';

class CategorySection extends StatelessWidget {
  final List<FoodCategory> categories;
  const CategorySection({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 205,
            child: FutureBuilder(
              future: Category.get(),
              
              builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                   return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 200,
                    child: CategoryCard(category: snapshot.data![index]),
                  );
                },
              );
                  }else{
                    return Center(child: CircularProgressIndicator());
                  }
              }
              
            ),
          ),
        ],
      ),
    );
  }
}
