import 'package:restaurant_flutter_app/data/shop/model/shopping_model.dart';

class GroceriesProductRepository {
  List<ShoppingModel> getGroceriesProduct() => [
    ShoppingModel(
      image: 'assets/images/beef_bone.png',
      title: 'Beef Bone',
      amount: '1kg, Priceg',
      price: 4.99,
      detials:
          'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
      rating: 3,
      nutritions: '100gr',
    ),
    ShoppingModel(
      image: 'assets/images/chicken.png',
      title: 'Broiler Chicken',
      amount: '1kg, Priceg',
      price: 4.99,
      detials:
          'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
      rating: 3,
      nutritions: '100gr',
    ),
    ShoppingModel(
      image: 'assets/images/beef_bone.png',
      title: 'Beef Bone',
      amount: '1kg, Priceg',
      price: 4.99,
      detials:
          'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
      rating: 3,
      nutritions: '100gr',
    ),
  ];
}
