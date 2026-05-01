import 'package:flutter/material.dart';
import 'package:workshop_1/level3/category_card.dart';
import 'package:workshop_1/level3/product_card.dart';

class HomePage3 extends StatefulWidget {
  const HomePage3({super.key});

  @override
  State<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
  final PageController _pageController = PageController();
  final List<_BannerItem> _banners = const [
    _BannerItem(
      title: 'Fresh Harvest',
      subtitle: 'Picked today from local farms',
      tint: Color(0xFF2E7D32),
    ),
    _BannerItem(
      title: 'Healthy Pantry',
      subtitle: 'Stock up on grains and herbs',
      tint: Color(0xFFEF6C00),
    ),
    _BannerItem(
      title: 'Dairy Day',
      subtitle: 'Fresh milk and more',
      tint: Color(0xFF1565C0),
    ),
  ];
  int _currentBanner = 0;
  final Map<String, bool> _likedByTitle = {};

  bool _isLiked(String title) => _likedByTitle[title] ?? false;

  void _setLiked(String title, bool value) {
    setState(() {
      _likedByTitle[title] = value;
    });
  }

  int _alpha(double opacity) => (opacity * 255).round();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Explore",
          style: TextStyle(
            fontWeight: .bold,
            fontSize: 24,
            color: Color(0xFF007E2F),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            spacing: 24,
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  hintText: 'Search..',
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(borderRadius: .circular(8)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFEDEDED)),
                    borderRadius: .circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFEDEDED)),
                    borderRadius: .circular(8),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 160,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _banners.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentBanner = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final banner = _banners[index];
                        return ClipRRect(
                          borderRadius: .circular(10),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset('assets/hero.png', fit: .cover),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      banner.tint.withAlpha(_alpha(0.75)),
                                      banner.tint.withAlpha(_alpha(0.2)),
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: .start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      banner.title,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: .w700,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      banner.subtitle,
                                      style: TextStyle(
                                        color: Colors.white.withAlpha(
                                          _alpha(0.9),
                                        ),
                                        fontWeight: .w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_banners.length, (index) {
                      final isActive = index == _currentBanner;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: isActive ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: isActive ? _banners[index].tint : Colors.grey,
                          borderRadius: .circular(20),
                        ),
                      );
                    }),
                  ),
                ],
              ),

              Text(
                'Categories',
                style: TextStyle(fontWeight: .w700, fontSize: 16),
              ),

              SingleChildScrollView(
                scrollDirection: .horizontal,
                child: Row(
                  spacing: 5,
                  children: [
                    CategoryCard(
                      title: 'Fruits',
                      imageUrl:
                          'https://images.unsplash.com/photo-1447175008436-054170c2e979?auto=format&fit=crop&w=240&q=80',
                    ),
                    CategoryCard(
                      title: 'Grains',
                      imageUrl:
                          'https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=240&q=80',
                    ),
                    CategoryCard(
                      title: 'Herbs',
                      imageUrl:
                          'https://images.unsplash.com/photo-1501004318641-b39e6451bec6?auto=format&fit=crop&w=240&q=80',
                    ),
                    CategoryCard(
                      title: 'Milk',
                      imageUrl:
                          'https://images.unsplash.com/photo-1563636619-e9143da7973b?auto=format&fit=crop&w=240&q=80',
                    ),
                  ],
                ),
              ),

              Text(
                'Browse Products',
                style: TextStyle(fontWeight: .w700, fontSize: 16),
              ),
              Row(
                spacing: 20,
                children: [
                  ProductCard(
                    title: 'Berries',
                    description: 'Berries is a sweet fruit with red color.',
                    imagePath: 'assets/berries.png',
                    rating: 4.9,
                    ratingCount: 324,
                    isLiked: _isLiked('Berries'),
                    onLikeChanged: (value) {
                      _setLiked('Berries', value);
                    },
                  ),
                  ProductCard(
                    title: 'Tulsi',
                    description: 'Leaf of berries is very green and fresh.',
                    imagePath: 'assets/tulsi.png',
                    rating: 4.8,
                    ratingCount: 210,
                    isLiked: _isLiked('Tulsi'),
                    onLikeChanged: (value) {
                      _setLiked('Tulsi', value);
                    },
                  ),
                ],
              ),
              Row(
                spacing: 20,
                children: [
                  ProductCard(
                    title: 'Milk',
                    description: 'Milk is a white liquid produced by mammals.',
                    imagePath: 'assets/milk.png',
                    rating: 4.7,
                    ratingCount: 150,
                    isLiked: _isLiked('Milk'),
                    onLikeChanged: (value) {
                      _setLiked('Milk', value);
                    },
                  ),
                  ProductCard(
                    title: 'Grains',
                    description: 'Grains are small, hard, dry seeds that are .',
                    imagePath: 'assets/tomato.png',
                    rating: 4.6,
                    ratingCount: 98,
                    isLiked: _isLiked('Grains'),
                    onLikeChanged: (value) {
                      _setLiked('Grains', value);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BannerItem {
  final String title;
  final String subtitle;
  final Color tint;

  const _BannerItem({
    required this.title,
    required this.subtitle,
    required this.tint,
  });
}
