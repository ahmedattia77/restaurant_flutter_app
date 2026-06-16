import 'package:flutter/material.dart';
import 'package:restaurant_flutter_app/data/shop/model/base_model.dart';

class GroceriesModel extends BaseModel {
  final Color color;

  GroceriesModel({
    required super.image,
    required super.title,
    required this.color,
  });
}
