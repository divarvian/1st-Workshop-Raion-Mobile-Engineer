import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop_1/level3/detail_screen.dart';
import 'package:workshop_1/level3/models/product.dart';
import 'package:workshop_1/level3/providers/product_provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final isLiked = context.watch<ProductProvider>().isLiked(product.id);

    return GestureDetector(
      onTap: () {
        // Menghilangkan fokus dari TextField (dan menutup keyboard) sebelum pindah halaman
        FocusManager.instance.primaryFocus?.unfocus();
        
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(product: product),
          ),
        );
      },
      child: Column(
          crossAxisAlignment: .start,
          children: [
            ClipRRect(
              borderRadius: .circular(10),
              child: SizedBox(
                width: double.infinity,
                height: 160,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        product.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade400,
                            child: Center(
                              child: Icon(
                                Icons.image,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          context.read<ProductProvider>().toggleLike(product.id);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF).withAlpha(200),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            size: 18,
                            color: isLiked
                                ? Colors.red.shade400
                                : Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(product.title),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.amber.shade700),
                const SizedBox(width: 4),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: product.rating.toStringAsFixed(1),
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextSpan(text: ' (${product.ratingCount} ulasan)'),
                    ],
                  ),
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(product.description),
          ],
        ),
    );
  }
}
