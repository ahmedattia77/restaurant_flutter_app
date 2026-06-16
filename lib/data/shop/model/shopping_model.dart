import 'package:restaurant_flutter_app/data/shop/model/base_model.dart';

class ShoppingModel extends BaseModel {
  final String amount;
  final double price;
  final String detials;
  final String nutritions;
  final double rating;

  ShoppingModel({
    required super.title,
    required  super.image,
    required this.amount,
    required this.price,
    required this.detials,
    required this.rating,
    required this.nutritions,
  }); 
}
