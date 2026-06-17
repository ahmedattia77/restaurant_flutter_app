
import 'package:flutter/material.dart';

class AuthHint extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final VoidCallback? onClicked;
  const AuthHint({
    super.key,
    required this.title,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero
      ),
      onPressed: () => onClicked,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.w400,
          fontSize: fontSize ?? 16,
          color: color ?? Color(0xff7C7C7C),
        ),
      ),
    );
  }
}
