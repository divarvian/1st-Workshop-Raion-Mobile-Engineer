class Product {
  final String id;
  final String title;
  final String description;
  final String imagePath;
  final double rating;
  final int ratingCount;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.rating,
    required this.ratingCount,
  });
}
