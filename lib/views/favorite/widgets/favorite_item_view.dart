import 'package:flutter/material.dart';
import 'package:restaurant_flutter_app/data/shop/model/shopping_model.dart';
class FavoriteItemView extends StatelessWidget {
  final ShoppingModel data;
  const FavoriteItemView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16 , bottom: 16 , left: 10),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                width: 60 ,
                height: 60,
                data.image,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) return child;
                  return AnimatedOpacity(
                    opacity: frame == null ? 0 : 1,
                    duration: const Duration(
                      milliseconds: 500,
                    ), 
                    curve: Curves.easeOut,
                    child: child,
                  );
                },),
              const SizedBox(width: 40),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      data.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      data.amount,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              
              Row(
                children: [
                  Text('\$${data.price}', style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.green
                  ),),
                  SizedBox(width: 6),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}
