import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  final double price;
  const CounterView({super.key, required this.price});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  late int counter;
  late double price;

  @override
  void initState() {
    super.initState();
    counter = 1;
    price = widget.price;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: IconButton(
                padding: EdgeInsets.zero,

                alignment: Alignment.center,
                icon: Icon(Icons.remove, size: 35),
                onPressed: () {
                  if (counter >= 2) {
                    setState(() {
                      counter--;
                      price -= widget.price;
                    });
                  }
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.white12 : Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 0.2),
              ),
              child: Text(
                '$counter',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,

              alignment: Alignment.center,
              icon: Icon(Icons.add, size: 35, color: Colors.green),
              onPressed: () {
                setState(() {
                  counter++;
                  price = widget.price * counter;
                });
              },
            ),
          ],
        ),
        Text(
          '\$${price.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
