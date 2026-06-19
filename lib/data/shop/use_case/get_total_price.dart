import 'package:restaurant_flutter_app/data/shop/repository/cart_repository.dart';

class GetTotalPriceUseCase {
  CartRepository cardReo;
  GetTotalPriceUseCase({required this.cardReo});

  double getTotalAmountOfPrice() {
    return cardReo.getCart().fold(
      0,
      (previousValue, element) => previousValue + element.price,
    );
  }
}
