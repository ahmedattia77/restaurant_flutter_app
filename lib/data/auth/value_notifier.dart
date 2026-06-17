import 'package:flutter/widgets.dart';

ValueNotifier<bool> obscureTextShowNotifiere = ValueNotifier(true);
ValueNotifier<bool> isLogedNotifier = ValueNotifier<bool>(false);
ValueNotifier<int> selectedAuthPageNotifier = ValueNotifier(0);
ValueNotifier<bool> isDark = ValueNotifier<bool>(false);

final ValueNotifier<int> homeNavigationNotifier = ValueNotifier(0);
