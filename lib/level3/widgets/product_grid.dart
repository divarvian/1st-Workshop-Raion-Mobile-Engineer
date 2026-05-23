import 'package:flutter/material.dart';
import 'package:workshop_1/level3/data/dummy_data.dart';
import 'package:workshop_1/level3/product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // Instead of using Row, GridView is much better for scalability
    return GridView.builder(
      shrinkWrap: true, // Important when inside a ScrollView
      physics: const NeverScrollableScrollPhysics(), // Let the outer scroll view handle scrolling
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.65, // Adjust this ratio depending on image size
      ),
      itemCount: DummyData.products.length,
      itemBuilder: (context, index) {
        return ProductCard(
          product: DummyData.products[index],
        );
      },
    );
  }
}
