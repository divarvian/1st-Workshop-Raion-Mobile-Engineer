import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String title;
  final String description;
  final String imagePath;
  final double rating;
  final int ratingCount;
  final bool isLiked;
  final ValueChanged<bool> onLikeChanged;

  const DetailScreen({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.rating,
    required this.ratingCount,
    required this.onLikeChanged,
    this.isLiked = false,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late bool _isLiked;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
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
                    widget.imagePath,
                    fit: .cover,
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
                          setState(() {
                            _isLiked = !_isLiked;
                          });
                          widget.onLikeChanged(_isLiked);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF).withAlpha(200),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            _isLiked ? Icons.favorite : Icons.favorite_border,
                            size: 20,
                            color: _isLiked
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
                        widget.title,
                        style: TextStyle(fontWeight: .w600, fontSize: 24),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.amber.shade700,
                        ),
                        SizedBox(width: 6),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: widget.rating.toStringAsFixed(1),
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              TextSpan(text: ' (${widget.ratingCount} ulasan)'),
                            ],
                          ),
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 14,
                            fontWeight: .w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  widget.description,
                  style: TextStyle(fontWeight: .w600, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
