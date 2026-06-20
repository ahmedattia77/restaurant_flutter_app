import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: CircleAvatar(
        radius: 35,
        backgroundImage: AssetImage('assets/images/ironman.jpg', ),
      ),
    );
  }
}
