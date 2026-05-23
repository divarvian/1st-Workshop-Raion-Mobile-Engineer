import 'package:workshop_1/level3/models/category.dart';
import 'package:workshop_1/level3/models/product.dart';

class DummyData {
  static const List<Category> categories = [
    Category(
      id: 'cat_1',
      title: 'Fruits',
      imageUrl: 'https://images.unsplash.com/photo-1447175008436-054170c2e979?auto=format&fit=crop&w=240&q=80',
    ),
    Category(
      id: 'cat_2',
      title: 'Grains',
      imageUrl: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=240&q=80',
    ),
    Category(
      id: 'cat_3',
      title: 'Herbs',
      imageUrl: 'https://images.unsplash.com/photo-1501004318641-b39e6451bec6?auto=format&fit=crop&w=240&q=80',
    ),
    Category(
      id: 'cat_4',
      title: 'Milk',
      imageUrl: 'https://images.unsplash.com/photo-1563636619-e9143da7973b?auto=format&fit=crop&w=240&q=80',
    ),
  ];

  static const List<Product> products = [
    Product(
      id: 'prod_1',
      title: 'Berries',
      description: 'Berries is a sweet fruit with red color.',
      imagePath: 'assets/berries.png',
      rating: 4.9,
      ratingCount: 324,
    ),
    Product(
      id: 'prod_2',
      title: 'Tulsi',
      description: 'Leaf of berries is very green and fresh.',
      imagePath: 'assets/tulsi.png',
      rating: 4.8,
      ratingCount: 210,
    ),
    Product(
      id: 'prod_3',
      title: 'Milk',
      description: 'Milk is a white liquid produced by mammals.',
      imagePath: 'assets/milk.png',
      rating: 4.7,
      ratingCount: 150,
    ),
    Product(
      id: 'prod_4',
      title: 'Grains',
      description: 'Grains are small, hard, dry seeds that are.',
      imagePath: 'assets/tomato.png', // Keeping the original image path from the code
      rating: 4.6,
      ratingCount: 98,
    ),
  ];
}
