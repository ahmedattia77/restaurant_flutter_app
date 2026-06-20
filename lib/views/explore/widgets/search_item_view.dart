import 'package:flutter/material.dart';
import 'package:restaurant_flutter_app/data/shop/model/groceries_model.dart';

class SearchItemView extends StatelessWidget {
  final GroceriesModel data;
  const SearchItemView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(width: 0.2),
          color: data.color.withValues(alpha: 0.20),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                data.image,
                width: 90,
                height: 90,
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
                },
              ),
              SizedBox(height: 5),
              Text(
                data.title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
