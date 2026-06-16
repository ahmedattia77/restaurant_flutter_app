import 'package:flutter/material.dart';
import 'package:restaurant_flutter_app/data/shop/model/shopping_model.dart';

class ProductPage extends StatefulWidget {
  final ShoppingModel data; // استقبال بيانات المنتج لتخصيص الصفحة

  const ProductPage({super.key, required this.data});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // كونتولر للتحكم في حركة ممرر الصور والتقاط الصفحة الحالية
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // قائمة محاكاة لصور المنتج (يمكنك لاحقاً وضعها في الموديل كـ List<String>)
  final List<String> _productImages = [
    'assets/images/apple.png',
    'assets/images/apple_side.png',
    'assets/images/apple_inside.png',
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF121212) : const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. الحاوية العلوية الكبيرة (تصميم الصورة والأزرار)
            Container(
              height: MediaQuery.of(context).size.height * 0.45, // تأخذ 45% من ارتفاع الشاشة
              decoration: BoxDecoration(
                color: isDarkMode ? const Color(0xFF1A1A2E) : Colors.white,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(30), // حواف دائرية من الأسفل فقط
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Stack(
                  children: [
                    // ممرر الصور (Image Slider)
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        Expanded(
                          child: PageView.builder(
                            controller: _pageController,
                            onPageChanged: (index) {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            itemCount: _productImages.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Image.asset(
                                  widget.data.image, // حالياً يسحب الصورة الأساسية
                                  fit: BoxFit.contain,
                                ),
                              );
                            },
                          ),
                        ),
                        
                        // 2. مؤشر النقاط التوضيحية (Dots Indicator)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              _productImages.length,
                              (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.symmetric(horizontal: 3),
                                height: 4,
                                width: _currentPage == index ? 16 : 4, // النقطة الحالية تكون أعرض
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

                    // 3. أزرار التحكم العلوية (الرجوع ومشاركة المنتج)
                    Positioned(
                      top: 10,
                      left: 20,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios, size: 22),
                            onPressed: () => Navigator.pop(context),
                          ),
                          IconButton(
                            icon: const Icon(Icons.ios_share, size: 22),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 4. الجزء السفلي المخصص لبيانات المنتج (الاسم، السعر، الوصف)
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.title,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.data.amount,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  // هنا تكمل باقي أجزاء الصفحة (الوصف، زر إضافة للسلة، إلخ...)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
