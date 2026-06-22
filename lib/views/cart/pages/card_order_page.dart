import 'package:flutter/material.dart';
import 'package:restaurant_flutter_app/views/auth/widgets/auth_background.dart';
import 'package:restaurant_flutter_app/views/common_widgets/app_button.dart';

class CardOrderPage extends StatelessWidget {
  const CardOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset("assets/images/add_cart_check_box.png"),
          ),
          const SizedBox(height: 60),
          Text(
            "Your Order has been accepted",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 20),
          Text(
            "Your items has been placcd and is on it’s way to being processed",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Spacer(),
          AppBotton(
            text: 'Track Order',
            onPressed: () => Navigator.pop(context),
          ),
          SizedBox(
            width: double.infinity,
            height: 67,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
              ),
              child: Text(
                "Back to home",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
