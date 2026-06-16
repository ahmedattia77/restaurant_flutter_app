import 'package:flutter/material.dart';

class ShoppingImageSlider extends StatefulWidget {
  const ShoppingImageSlider({super.key});

  @override
  State<ShoppingImageSlider> createState() => _ShoppingImageSliderState();
}

class _ShoppingImageSliderState extends State<ShoppingImageSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      child: Stack(
      
        children: [
      
          Positioned(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Image.asset(
                    'assets/images/stack_vegetables_images.png',
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
      
          Positioned(
            bottom: 10,
            left: 40,
            right: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  height: 4,
                  width: _currentPage == index ? 18 : 4,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.green
                        : Colors.grey.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
