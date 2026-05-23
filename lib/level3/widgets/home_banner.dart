import 'package:flutter/material.dart';
import 'package:workshop_1/level3/utils/app_colors.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  final PageController _pageController = PageController();
  int _currentBanner = 0;

  final List<_BannerItem> _banners = const [
    _BannerItem(
      title: 'Fresh Harvest',
      subtitle: 'Picked today from local farms',
      tint: AppColors.bannerGreen,
    ),
    _BannerItem(
      title: 'Healthy Pantry',
      subtitle: 'Stock up on grains and herbs',
      tint: AppColors.bannerOrange,
    ),
    _BannerItem(
      title: 'Dairy Day',
      subtitle: 'Fresh milk and more',
      tint: AppColors.bannerBlue,
    ),
  ];

  int _alpha(double opacity) => (opacity * 255).round();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset('assets/hero.png', fit: BoxFit.cover),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            banner.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            banner.subtitle,
                            style: TextStyle(
                              color: Colors.white.withAlpha(
                                _alpha(0.9),
                              ),
                              fontWeight: FontWeight.w500,
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
        const SizedBox(height: 10),
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
                borderRadius: BorderRadius.circular(20),
              ),
            );
          }),
        ),
      ],
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
