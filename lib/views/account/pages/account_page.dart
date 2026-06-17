import 'package:flutter/material.dart';
import 'package:restaurant_flutter_app/constants/constants.dart';
import 'package:restaurant_flutter_app/data/account_page/account_settings.dart';
import 'package:restaurant_flutter_app/data/auth/value_notifier.dart';
import 'package:restaurant_flutter_app/views/account/widgets/account_settings_item.dart';
import 'package:restaurant_flutter_app/views/account/widgets/profile_head_email.dart';
import 'package:restaurant_flutter_app/views/account/widgets/profile_head_name.dart';
import 'package:restaurant_flutter_app/views/account/widgets/profile_name_editor_icon.dart';
import 'package:restaurant_flutter_app/views/account/widgets/profile_picture.dart';
import 'package:restaurant_flutter_app/views/onboarding/pages/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfilePicture(),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ProfileHeadName(),
                        SizedBox(width: 5),
                        ProfileNameEditorIcon(),
                        SizedBox(width: 40),
                        ValueListenableBuilder(
                          valueListenable: isDark,
                          builder: (context, value, child) {
                            return IconButton(
                              iconSize: 28,
                              icon: Icon(
                                value
                                    ? Icons.dark_mode_outlined
                                    : Icons.light_mode_outlined,
                              ),
                              onPressed: () async {
                                final SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setBool(isDarkMode, true);
                                isDark.value = !value;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    ProfileHeadEmail(),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 30),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: accountSettingsData.length,
              itemBuilder: (context, index) {
                final item = accountSettingsData[index];
                return AccountSettingsItem(icon: item.icon, title: item.title);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: ElevatedButton(
              onPressed: () async {
                // homeNavigationNotifier.value = 0;
                // isLogedNotifier.value = false;
                // selectedAuthPageNotifier.value = 0;
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                  await prefs.remove(isLoggedInKey);
                  await prefs.remove(isDarkMode);

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Onboarding()),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffF2F3F2),
                elevation: 3,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19),
                ),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.logout_outlined,
                    color: Color(0xff53B175),
                    size: 24,
                  ),
                  SizedBox(width: 75),
                  Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff53B175),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
