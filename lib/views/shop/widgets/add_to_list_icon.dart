import 'package:flutter/material.dart';

class AddToListIcon extends StatefulWidget {
  const AddToListIcon({super.key});

  @override
  State<AddToListIcon> createState() => _AddToListIconState();
}

class _AddToListIconState extends State<AddToListIcon> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _isClicked = !_isClicked;
        });
      },
      icon: Icon(
        !_isClicked
            ? Icons.favorite_outline_outlined
            : Icons.favorite,
        size: 30,
      ),
    );
  }
}
