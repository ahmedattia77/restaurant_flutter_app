import 'package:flutter/material.dart';
import 'package:restaurant_flutter_app/data/shop/model/shopping_model.dart';
import 'package:restaurant_flutter_app/data/shop/repository/cart_repository.dart';
import 'package:restaurant_flutter_app/data/shop/use_case/total_price_use_case.dart';
import 'package:restaurant_flutter_app/views/cart/pages/card_order_page.dart';
import 'package:restaurant_flutter_app/views/cart/widgets/cart_item_view.dart';
import 'package:restaurant_flutter_app/views/cart/widgets/cart_bottom_sheet.dart';
import 'package:restaurant_flutter_app/views/cart/widgets/go_to_checkout_button.dart';
import 'package:restaurant_flutter_app/views/cart/widgets/my_cart_textview.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<ShoppingModel> _cardList = [];
  late final TotalPriceUseCase _getTotalPrice = TotalPriceUseCase(
    cardReo: _myCartRepository,
  );

  double _totalPrice = 0;
  final CartRepository _myCartRepository = CartRepository();

  @override
  void initState() {
    super.initState();
    _cardList = _myCartRepository.getCart();
    _totalPrice = _getTotalPrice.getTotalAmountOfPrice();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.only(top: 30)),
          MyCardTextView(),
          SizedBox(height: 20),
          Divider(thickness: 0.5),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.60,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: _cardList.length,
              itemBuilder: (context, index) {
                var data = _cardList.elementAt(index);
                return CartItemView(
                  data: data,
                  remove: () {
                    setState(() {
                      _cardList.remove(data);
                    });
                  },
                );
              },
              separatorBuilder: (context, index) {
                return Divider(thickness: 0.5);
              },
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: GoToCheckoutButton(
              onClick: () {
                CartBottomSheet.show(
                  context,
                  placeholderCallBack: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CardOrderPage(),)),
                  closeSheetCallBack: () => Navigator.pop(context),
                );
              },
              totalPrice: _totalPrice,
            ),
          ),
        ],
      ),
    );
  }
}
