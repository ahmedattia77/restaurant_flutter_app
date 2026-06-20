import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:restaurant_flutter_app/data/shop/model/groceries_model.dart';

class GroceriesContainer extends StatelessWidget {
  final GroceriesModel data;
  final VoidCallback onClick;

  const GroceriesContainer({
    super.key,
    required this.data,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {
        onClick;
      },
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          color: data.color.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                data.image,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) return child;
                  return AnimatedOpacity(
                    opacity: frame == null ? 0 : 1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                    child: child,
                  );
                },
              ),
              SizedBox(width: 8),
              Text(
                data.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
