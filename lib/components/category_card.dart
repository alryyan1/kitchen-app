import 'package:flutter/material.dart';

import '../models/category.dart';
import 'dart:convert';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              ClipRRect(
                
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8.0),
                ),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: MemoryImage(base64Decode(category.image))
                    )
                  ),
                  // color: Colors.red,
                ),
              ),
            ],
          ),
          ListTile(
            title: Text(category.name, style: textTheme.titleSmall),
            subtitle: Text(
              '3 places',
              style: textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
