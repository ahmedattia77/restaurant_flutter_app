import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FiltterIcon extends StatelessWidget {
  const FiltterIcon({super.key});

  @override
  Widget build(BuildContext context) {
    Color unselectedColor = Theme.of(context).iconTheme.color ?? Colors.black;

    return SvgPicture.asset(
      'assets/svg/fillter.svg',
      colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn),
    );
  }
}
