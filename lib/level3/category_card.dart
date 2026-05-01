import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  const CategoryCard({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(6),
      height: 56,
      width: 132,
      decoration: BoxDecoration(
        color: const Color(0xFFDFF1E6),
        borderRadius: .circular(50),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.network(
                imageUrl,
                fit: .cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade300,
                    child: Center(
                      child: Icon(Icons.image, color: Colors.grey.shade600),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(width: 8),
          Text(title),
        ],
      ),
    );
  }
}
