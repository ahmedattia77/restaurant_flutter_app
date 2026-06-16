import 'package:flutter/material.dart';

class ExpansionTileView extends StatefulWidget {
  final String data;
  const ExpansionTileView({super.key, required this.data});

  @override
  State<ExpansionTileView> createState() => _ExpansionTileViewState();
}

class _ExpansionTileViewState extends State<ExpansionTileView> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (value) {
        setState(() {
          _isExpanded = value;
        });
      },
      trailing: Icon(
        _isExpanded ? Icons.expand_less_outlined : Icons.expand_more_outlined,
        size: 30,
      ),
      title: Text(
        'Product Detail',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      tilePadding: EdgeInsets.zero,
      shape: Border(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.data,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
