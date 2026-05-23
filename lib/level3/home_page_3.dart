import 'package:flutter/material.dart';
import 'package:workshop_1/level3/utils/app_colors.dart';
import 'package:workshop_1/level3/widgets/category_list.dart';
import 'package:workshop_1/level3/widgets/home_banner.dart';
import 'package:workshop_1/level3/widgets/product_grid.dart';

class HomePage3 extends StatelessWidget {
  const HomePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Explore",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: AppColors.primaryGreen,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  hintText: 'Search..',
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.backgroundGrey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.backgroundGrey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              const HomeBanner(),

              const Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),

              const CategoryList(),

              const Text(
                'Browse Products',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              
              const ProductGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
