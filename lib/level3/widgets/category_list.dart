import 'package:flutter/material.dart';
import 'package:workshop_1/level3/category_card.dart';
import 'package:workshop_1/level3/data/dummy_data.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 5,
        children: DummyData.categories.map((category) {
          return CategoryCard(
            title: category.title,
            imageUrl: category.imageUrl,
          );
        }).toList(),
      ),
    );
  }
}
