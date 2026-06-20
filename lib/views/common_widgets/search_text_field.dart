import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
    final ValueChanged<String> onChanged;

  const SearchTextField({super.key , required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Search Store",
        prefixIcon: Icon(Icons.search),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}