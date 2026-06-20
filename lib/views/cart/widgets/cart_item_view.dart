import 'package:flutter/material.dart';
import 'package:restaurant_flutter_app/data/shop/model/shopping_model.dart';

class CartItemView extends StatefulWidget {
  final ShoppingModel data;
  final VoidCallback remove;
  const CartItemView({super.key, required this.data, required this.remove});

  @override
  State<CartItemView> createState() => _CartItemViewState();
}

class _CartItemViewState extends State<CartItemView> {
  late int counter;
  late double price;

  @override
  void initState() {
    super.initState();
    counter = 1;
    price = widget.data.price;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                width: 70,
                height: 80,
                widget.data.image,
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
              const SizedBox(width: 40),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.data.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.data.amount,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    //---------------counter ---------------------
                    const SizedBox(height: 6),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.center,
                            icon: Icon(Icons.remove, size: 25),
                            onPressed: () {
                              if (counter >= 2) {
                                setState(() {
                                  counter--;
                                  price -= widget.data.price;
                                });
                              }
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colors.white12 : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(width: 0.2),
                          ),
                          child: Text(
                            '$counter',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          icon: Icon(Icons.add, size: 25, color: Colors.green),
                          onPressed: () {
                            setState(() {
                              counter++;
                              price = widget.data.price * counter;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.white12 : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 0.2),
                    ),
                    child: IconButton(
                      onPressed: () => widget.remove(),
                      icon: Icon(Icons.close),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        '\$${price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  ),
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
