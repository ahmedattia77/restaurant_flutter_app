import 'package:flutter/material.dart';

class CustomAuthPasswordTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final Iterable<String>? autofillHints;

  const CustomAuthPasswordTextField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.autofillHints,
  });

  @override
  State<CustomAuthPasswordTextField> createState() =>
      _CustomAuthPasswordTextFieldState();
}

class _CustomAuthPasswordTextFieldState
    extends State<CustomAuthPasswordTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: IconButton(
          onPressed: () => setState(() {
            _obscureText = !_obscureText;
          }),
          icon: Icon(!_obscureText ? Icons.visibility : Icons.visibility_off),
        ),

        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueGrey, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
