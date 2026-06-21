import 'package:flutter/material.dart';
import 'package:restaurant_flutter_app/views/account/pages/account_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_flutter_app/views/cart/pages/cart_page.dart';
import 'package:restaurant_flutter_app/views/explore/pages/explore_page.dart';
import 'package:restaurant_flutter_app/views/favorite/pages/favorite_page.dart';
import 'package:restaurant_flutter_app/views/shop/pages/shop_page.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});


  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
   int _currentPage = 4;
   Color selectedColor = Color(0xff53B175);

  final List<Widget> _appPages = [
    const ShopPage(),
    const ExplorePage(),
    const CartPage(),
    const FavoritePage(),
    const AccountPage(),
  ];

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    Color unselectedColor = Theme.of(context).iconTheme.color ?? Colors.black;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _appPages.elementAt(_currentPage),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          },);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: selectedColor,
        unselectedItemColor: unselectedColor,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/shop.svg',
              colorFilter: ColorFilter.mode(
                _currentPage == 0 ? selectedColor : unselectedColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/explore.svg',
              colorFilter: ColorFilter.mode(
                _currentPage == 1 ? selectedColor : unselectedColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/cart.svg',
              colorFilter: ColorFilter.mode(
                _currentPage == 2 ? selectedColor : unselectedColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/favorite.svg',
              colorFilter: ColorFilter.mode(
                _currentPage == 3 ? selectedColor : unselectedColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Favorit",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/account.svg',
              colorFilter: ColorFilter.mode(
                _currentPage == 4 ? selectedColor : unselectedColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
