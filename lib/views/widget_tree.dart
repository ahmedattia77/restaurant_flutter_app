import 'package:flutter/material.dart';
import 'package:restaurant_flutter_app/data/auth/value_notifier.dart';
import 'package:restaurant_flutter_app/views/auth/pages/login_page.dart';
import 'package:restaurant_flutter_app/main_layout.dart';
import 'package:restaurant_flutter_app/views/auth/pages/sign_up_page.dart';
import 'package:restaurant_flutter_app/views/onboarding/pages/onboarding.dart';

List<Widget> _authPages = [Onboarding(),LoginPage(), SignUpPage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isLogedNotifier,
      builder: (context, logeIn, child) {
        if (logeIn) {
          return MainLayout();
        } else {
          return ValueListenableBuilder(
            valueListenable: selectedAuthPageNotifier,
            builder: (context, currentPAge, child) {
              return Scaffold(body: _authPages.elementAt(currentPAge));
            },
          );
        }
      },
    );
  }
}
