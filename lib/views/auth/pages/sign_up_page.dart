import 'package:flutter/material.dart';
import 'package:restaurant_flutter_app/data/auth/value_notifier.dart';
import 'package:restaurant_flutter_app/views/auth/pages/login_page.dart';
import 'package:restaurant_flutter_app/views/auth/widgets/auth_hint.dart';
import 'package:restaurant_flutter_app/views/auth/widgets/auth_title.dart';
import 'package:restaurant_flutter_app/views/auth/widgets/auth_background.dart';
import 'package:restaurant_flutter_app/views/common_widgets/app_button.dart';
import 'package:restaurant_flutter_app/views/auth/widgets/custom_auth_text_field.dart';
import 'package:restaurant_flutter_app/views/auth/widgets/text_field_hint.dart';
import 'package:restaurant_flutter_app/views/auth/widgets/have_account_text.dart';
import 'package:restaurant_flutter_app/views/common_widgets/head_icon.dart';
import 'package:restaurant_flutter_app/views/auth/widgets/terms_and_privacy_idget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: HeadIcon()),
                SizedBox(height: 60),
                AuthTitle(title: 'Sign Up'),
                SizedBox(height: 12),
                AuthHint(title: 'Enter your credentials to continue'),
                SizedBox(height: 40),
                TextFieldHint(text: 'User name'),
                SizedBox(height: 6),
                CustomAuthTextField(
                  hintText: 'ahmedxattia4040',
                  keyboardType: TextInputType.name,
                  autofillHints: const [AutofillHints.newUsername],
                ),
                SizedBox(height: 30),
                TextFieldHint(text: 'Email'),
                CustomAuthTextField(
                  hintText: 'example@email.com',
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                ),
                SizedBox(height: 30),
                TextFieldHint(text: 'Password'),
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

                TermsAndPrivacyWidget(
                  onClickPrivacy: () {},
                  onClickTermes: () {},
                ),

                SizedBox(height: 30),

                 AppBotton(
                      text: 'Sign Up',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                    ),
                
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HaveAccountText(text: 'Already have an account?'),

                    AuthHint(
                      title: ' Log in',
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                      onClicked: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
