import 'package:flutter/material.dart';
import 'package:restaurant_flutter_app/data/shop/model/groceries_model.dart';
import 'package:restaurant_flutter_app/data/shop/model/shopping_model.dart';
import 'package:restaurant_flutter_app/data/shop/repository/best_selling_repository.dart';
import 'package:restaurant_flutter_app/data/shop/repository/exclusive_offer_repository.dart';
import 'package:restaurant_flutter_app/data/shop/repository/groceries_product_repository.dart';
import 'package:restaurant_flutter_app/data/shop/repository/groceries_repository.dart';
import 'package:restaurant_flutter_app/views/common_widgets/head_icon.dart';
import 'package:restaurant_flutter_app/views/shop/pages/product_page.dart';
import 'package:restaurant_flutter_app/views/shop/widgets/Groceries_container.dart';
import 'package:restaurant_flutter_app/views/shop/widgets/exclusive_offers_container.dart';
import 'package:restaurant_flutter_app/views/shop/widgets/location_title.dart';
import 'package:restaurant_flutter_app/views/common_widgets/search_text_field.dart';
import 'package:restaurant_flutter_app/views/shop/widgets/section_see_all.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  final _exclusivRipo = ExclusiveOfferRepository();
  final _bestSellingRipo = BestSellingRepository();
  final _groceriesRipo = GroceriesRepository();
  final _groceriesProductRipo = GroceriesProductRepository();

  late List<ShoppingModel> _exclusiveOfferList = [];
  late List<ShoppingModel> _bestSellingList= [];
  late List<GroceriesModel> _groceriesList= [];
  late List<ShoppingModel> _groceriesProductList= [];

  @override
  void initState() {
    super.initState();
    _exclusiveOfferList = _exclusivRipo.getExclusiveOffers();
    _bestSellingList = _bestSellingRipo.getBestSelling();
    _groceriesList = _groceriesRipo.getGroceries();
    _groceriesProductList = _groceriesProductRipo.getGroceriesProduct();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 70, left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: HeadIcon()),
            SizedBox(height: 16),
            LocationTitle(title: 'Dhaka, Banassre'),
            SizedBox(height: 20),
            SearchTextField(onChanged: (value) => '',),
            SizedBox(height: 30),
            SectionTextField(title: 'Exclusive Offer',),
            
            SizedBox(height: 20),
            
            SizedBox(
              height: 230,
              child: ListView.separated(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: _exclusiveOfferList.length,
      
                itemBuilder: (context, index) {
                  final product = _exclusiveOfferList[index];
                  return ExclusiveOffersContainer(data: product, onClick: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => 
                     ProductPage(data:product ),));
                    });
                },
      
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 16);
                },
              ),
            ),

            SizedBox(height: 20),
            SectionTextField(title: 'Best Selling'), 
            SizedBox(height: 20),

            SizedBox(
              height: 230,
              child: ListView.separated(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: _bestSellingList.length,
      
                itemBuilder: (context, index) {
                  final product = _bestSellingList[index];
                  return ExclusiveOffersContainer(data: product, onClick: () {});
                },
      
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 16);
                },
              ),
            ),

            SizedBox(height: 20),

            SizedBox(
              height: 100,
              child: ListView.separated(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: _groceriesList.length,
      
                itemBuilder: (context, index) {
                  final product = _groceriesList[index];
                  return GroceriesContainer(data: product, onClick: () {});
                },
      
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 16);
                },
              ),
            ),

            SizedBox(height: 20),

            SizedBox(
              height: 230,
              child: ListView.separated(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: _groceriesProductList.length,
      
                itemBuilder: (context, index) {
                  final product = _groceriesProductList[index];
                  return ExclusiveOffersContainer(data: product, onClick: () {});
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 16);
                },
              ),
            ),

          SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}
