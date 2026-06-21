import 'dart:ui';
import 'package:flutter/material.dart';

class ProductItemBacground extends StatelessWidget {
  final Widget child;

  const ProductItemBacground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(30),
        top: Radius.circular(30)
      ),
      child: Stack(
        
        children: [
          Container(color: Theme.of(context).scaffoldBackgroundColor),

          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xffFF8A8A).withValues(alpha: 0.20),
              ),
            ),
          ),

          Positioned(
            top: 30,
            left: 40,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff53B175).withValues(alpha: 0.20),
              ),
            ),
          ),

          Positioned(
            bottom: 30,
            right: 40,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xffFF8A8A).withValues(alpha: 0.20),
              ),
            ),
          ),

          Positioned(
            bottom: 30,
            left: 40,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff53B175).withValues(alpha: 0.20),
              ),
            ),
          ),

          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
              child: Container(color: Colors.transparent),
            ),
          ),
          Positioned.fill(child: child),
        ],
      ),
    );
  }
}
