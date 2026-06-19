
import 'package:flutter/material.dart';
import 'package:restaurant_flutter_app/data/shop/model/shopping_model.dart';
import 'package:restaurant_flutter_app/data/shop/repository/favorite_repository.dart';
import 'package:restaurant_flutter_app/views/favorite/widgets/add_all_to_card_button.dart';
import 'package:restaurant_flutter_app/views/favorite/widgets/favorit_text_view.dart';
import 'package:restaurant_flutter_app/views/favorite/widgets/favorite_item_view.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late List<ShoppingModel> _favoriteList = [];
  final FavoriteRepository _favoriteRipo = FavoriteRepository();

  @override
  void initState() {
    super.initState();
    _favoriteList = _favoriteRipo.getFavoriteList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: FavoritTextView(),
            ),
          ),
          SizedBox(height: 20),
          Divider(thickness: 0.5),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.60,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: _favoriteList.length,
              itemBuilder: (context, index) {
                return FavoriteItemView(data: _favoriteList.elementAt(index));
              },
              separatorBuilder: (context, index) {
                return Divider(thickness: 0.5);
              },
            ),
          ),
          SizedBox(height: 35,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Center(child: AddAllToCardButton(onClick: () {})),
          ),
        ],
      ),
    );
  }
}
