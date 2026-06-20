import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final String ?query ;
  const SearchTextField({super.key , this.query});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hint: Text("Search Store"),
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