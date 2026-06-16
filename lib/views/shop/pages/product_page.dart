import 'package:flutter/material.dart';
import 'package:restaurant_flutter_app/data/shop/model/shopping_model.dart';
import 'package:restaurant_flutter_app/views/shop/widgets/add_to_list_button.dart';
import 'package:restaurant_flutter_app/views/shop/widgets/add_to_list_icon.dart';
import 'package:restaurant_flutter_app/views/shop/widgets/counter_view.dart';
import 'package:restaurant_flutter_app/views/shop/widgets/expansion_tile.dart';
import 'package:restaurant_flutter_app/views/shop/widgets/list_title_view.dart';
import 'package:restaurant_flutter_app/views/shop/widgets/product_image_slider.dart';
import 'package:restaurant_flutter_app/views/shop/widgets/product_item_background.dart';
import 'package:restaurant_flutter_app/views/shop/widgets/product_title.dart';
import 'package:restaurant_flutter_app/views/shop/widgets/review_item_view.dart';

class ProductPage extends StatelessWidget {
  final ShoppingModel data;

  const ProductPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.40,
                    width: double.infinity,
                    child: ProductItemBacground(
                      child: SafeArea(
                        bottom: false,
                        child: ProductImageSlider(data: data),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProductTitle(title: data.title),
                            AddToListIcon(),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text('1kg, Price', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 25),
                        CounterView(
                          price: data.price,
                        ),
                        SizedBox(height: 30),
                        Divider(thickness: 0.5),
                        SizedBox(height: 18),
                        ExpansionTileView(data: data.detials),
                        Divider(thickness: 0.5),
                        SizedBox(height: 18),
                        ListTitleView(data: data.nutritions),
                        SizedBox(height: 18),
                        Divider(thickness: 0.5),
                        SizedBox(height: 18),
                        ReviewItemView(rating: data.rating),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            left: 25,
            right: 25,
            child: AddToListButton(onClick: () {}),
          ),
        ],
      ),
    );
  }
}
