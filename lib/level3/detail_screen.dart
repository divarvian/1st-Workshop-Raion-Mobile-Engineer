import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop_1/level3/models/product.dart';
import 'package:workshop_1/level3/providers/product_provider.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({
    super.key,
    required this.product,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    final isLiked = context.watch<ProductProvider>().isLiked(widget.product.id);

    return Scaffold(
      body: Column(
        crossAxisAlignment: .start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: .circular(10),
                  bottomRight: .circular(10),
                ),
                child: SizedBox(
                  width: .infinity,
                  height: 319,
                  child: Image.asset(
                    widget.product.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade400,
                        child: Center(
                          child: Icon(Icons.image, color: Colors.grey.shade700),
                        ),
                      );
                    },
                  ),
                ),
              ),

              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF).withAlpha(200),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Transform.translate(
                              offset: const Offset(-1, 0),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                size: 18,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<ProductProvider>().toggleLike(widget.product.id);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF).withAlpha(200),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            size: 20,
                            color: isLiked
                                ? Colors.red.shade400
                                : Colors.grey.shade800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(36),
            child: Column(
              crossAxisAlignment: .start,
              spacing: 8,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        widget.product.title,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.amber.shade700,
                        ),
                        const SizedBox(width: 6),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: widget.product.rating.toStringAsFixed(1),
                                style: const TextStyle(fontWeight: FontWeight.w700),
                              ),
                              TextSpan(text: ' (${widget.product.ratingCount} ulasan)'),
                            ],
                          ),
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  widget.product.description,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
