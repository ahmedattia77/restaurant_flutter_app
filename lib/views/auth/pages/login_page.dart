import 'package:flutter/material.dart';
import 'package:restaurant_flutter_app/data/auth/value_notifier.dart';
import 'package:restaurant_flutter_app/main_layout.dart';
import 'package:restaurant_flutter_app/views/auth/widgets/auth_background.dart';
import 'package:restaurant_flutter_app/views/auth/widgets/custom_auth_button.dart';
import 'package:restaurant_flutter_app/views/auth/widgets/custom_auth_text_field.dart';
import 'package:restaurant_flutter_app/views/common_widgets/head_icon.dart';
import 'package:restaurant_flutter_app/views/auth/widgets/auth_title.dart';
import 'package:restaurant_flutter_app/views/auth/widgets/auth_hint.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: HeadIcon()),
              SizedBox(height: 60),
              AuthTitle(title: 'Login'),
              SizedBox(height: 12),
              AuthHint(title: 'Enter your email and password'),
              SizedBox(height: 40),
              Text('Email', style: TextStyle(fontSize: 16)),
              SizedBox(height: 6),
              CustomAuthTextField(
                hintText: 'example@email.com',
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
              ),
              SizedBox(height: 30),
              Text('Password', style: TextStyle(fontSize: 16)),
              SizedBox(height: 6),
              ValueListenableBuilder(
                valueListenable: obscureTextShowNotifiere,
                builder: (context, value, child) {
                  return CustomAuthTextField(
                    hintText: '*******',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: value,
                    suffixIcon: IconButton(
                      icon: value
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: () {
                        obscureTextShowNotifiere.value =
                            !obscureTextShowNotifiere.value;
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Align(
                alignment: AlignmentGeometry.centerRight,
                child: AuthHint(title: 'Forget password?', fontSize: 14),
              ),
              SizedBox(height: 30),
              AuthButton(
                text: 'Login',
                onPressed: () {
                  // isLogedNotifier.value = true;
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => 
                     MainLayout(),),(route) => false);
                },
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthHint(
                    title: 'Don’t have an account? ',
                    fontWeight: FontWeight.w600,
                  ),
                  ValueListenableBuilder(
                    valueListenable: selectedAuthPageNotifier,
                    builder: (context, value, child) {
                      return AuthHint(
                        title: 'Sing up',
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                        onClicked: () {
                          selectedAuthPageNotifier.value = 2;
                        },
                      );
                    }
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
