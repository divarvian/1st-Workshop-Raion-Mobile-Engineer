import 'package:flutter/material.dart';
import 'package:workshop_1/level3/detail_screen.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final double rating;
  final int ratingCount;
  final bool isLiked;
  final ValueChanged<bool> onLikeChanged;

  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.rating,
    required this.ratingCount,
    required this.isLiked,
    required this.onLikeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                title: title,
                description: description,
                imagePath: imagePath,
                rating: rating,
                ratingCount: ratingCount,
                isLiked: isLiked,
                onLikeChanged: onLikeChanged,
              ),
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
                        imagePath,
                        fit: .cover,
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
                          onLikeChanged(!isLiked);
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
            SizedBox(height: 12),
            Text(title),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.amber.shade700),
                SizedBox(width: 4),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: rating.toStringAsFixed(1),
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextSpan(text: ' ($ratingCount ulasan)'),
                    ],
                  ),
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12,
                    fontWeight: .w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Text(description),
          ],
        ),
      ),
    );
  }
}
