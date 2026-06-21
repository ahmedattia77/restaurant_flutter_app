import 'package:restaurant_flutter_app/data/shop/repository/cart_repository.dart';

class TotalPriceUseCase {
  CartRepository cardReo;
  TotalPriceUseCase({required this.cardReo});

  double getTotalAmountOfPrice() {
    return cardReo.getCart().fold(
      0,
      (previousValue, element) => previousValue + element.price,
    );
  }
}
