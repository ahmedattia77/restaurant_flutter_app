import 'package:flutter/material.dart';
import 'package:restaurant_flutter_app/data/auth/value_notifier.dart';
import 'package:restaurant_flutter_app/views/account/pages/account_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_flutter_app/views/shop/pages/shop_page.dart';

class MainLayout extends StatelessWidget {
  MainLayout({super.key});

  final List<Widget> _appPages = [
    const ShopPage(),
    const Center(child: Text("Explore")),
    const Center(child: Text("Cart")),
    const Center(child: Text("Favorite")),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    const Color selectedColor = Color(0xff53B175);
    Color unselectedColor = Theme.of(context).iconTheme.color ?? Colors.black;
    return ValueListenableBuilder(
      valueListenable: homeNavigationNotifier,
      builder: (context, currentPage, child) {
        return Scaffold(
          body: _appPages.elementAt(currentPage),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentPage,
            onTap: (index) {
              homeNavigationNotifier.value = index;
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: selectedColor,
            unselectedItemColor: unselectedColor,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/shop.svg',
                  colorFilter: ColorFilter.mode(
                    currentPage == 0 ? selectedColor : unselectedColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: "Shop",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/explore.svg',
                  colorFilter: ColorFilter.mode(
                    currentPage == 1 ? selectedColor : unselectedColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: "Explore",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/cart.svg',
                  colorFilter: ColorFilter.mode(
                    currentPage == 2 ? selectedColor : unselectedColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/favorite.svg',
                  colorFilter: ColorFilter.mode(
                    currentPage == 3 ? selectedColor : unselectedColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: "Favorit",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/account.svg',
                  colorFilter: ColorFilter.mode(
                    currentPage == 4 ? selectedColor : unselectedColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: "Account",
              ),
            ],
          ),
        );
      },
    );
  }
}
