import 'package:flutter/material.dart';

class ListTitleView extends StatelessWidget {
  final String data ;
    const ListTitleView({super.key , required this.data});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Nutritions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 40,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: isDarkMode
                    ? Colors.white10
                    : Colors.black12,
              ),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Text(data, style: TextStyle(fontSize: 10)),
              ),
            ),
            const SizedBox(width: 20),
            Icon(Icons.arrow_forward_ios_outlined , size: 20,),
          ],
        ),
      ],
    );
  }
}
