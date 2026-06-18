import 'package:flutter/material.dart';
import 'package:restaurant_flutter_app/constants/constants.dart';
import 'package:restaurant_flutter_app/data/auth/value_notifier.dart';
import 'package:restaurant_flutter_app/main_layout.dart';
import 'package:restaurant_flutter_app/views/onboarding/pages/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  isLogedNotifier.value = prefs.getBool(isLoggedInKey) ?? false;
  isDark.value = prefs.getBool(isDarkMode) ?? false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDark,
      builder: (context, value, child) {
        final dynamicColorScheme = ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
          brightness: value == false ? Brightness.light : Brightness.dark,
        );
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Restrant',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: dynamicColorScheme,
            iconTheme: IconThemeData(color: dynamicColorScheme.onSurface),
          ),
          home: Scaffold(
            body: isLogedNotifier.value ? MainLayout() : Onboarding(),
          ),
        );
      },
    );
  }
}
