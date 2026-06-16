import 'package:flutter/painting.dart';
import 'package:restaurant_flutter_app/data/shop/model/groceries_model.dart';

class GroceriesRepository  {


  List<GroceriesModel> getGroceries () =>  [
  GroceriesModel(
    image: 'assets/images/pulses.png',
    title: 'Pulses',
    color: Color(0xFFF8A44C)
  ),
  GroceriesModel(
    image: 'assets/images/rice.png',
    title: 'Rice',
    color: Color(0xFF53B175)
    
  ),
  GroceriesModel(
    image: 'assets/images/pulses.png',
    title: 'Pulses',
    color: Color(0xFFF8A44C)
  ),
];
}
