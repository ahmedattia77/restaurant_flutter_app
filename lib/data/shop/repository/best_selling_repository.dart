import 'package:restaurant_flutter_app/data/shop/model/shopping_model.dart';

class BestSellingRepository {
  List<ShoppingModel> getBestSelling() => [
    ShoppingModel(
      image: 'assets/images/pepper_red.png',
      title: 'Bell Pepper Red',
      amount: '7pcs, Priceg',
      price: 4.99,
      detials:
          'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
      rating: 3,
      nutritions: '100gr',
    ),
    ShoppingModel(
      image: 'assets/images/ginger.png',
      title: 'Ginger',
      amount: '1kg, Priceg',
      price: 4.99,
      detials:
          'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
      rating: 3,
      nutritions: '100gr',
    ),
    ShoppingModel(
      image: 'assets/images/pepper_red.png',
      title: 'Organic Bananas',
      amount: '7pcs, Priceg',
      price: 4.99,
      detials:
          'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
      rating: 3,
      nutritions: '100gr',
    ),
  ];
}
