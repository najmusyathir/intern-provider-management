import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier {
  String statusMode = 'Light';

  bool isDark = false;

  void toggleTheme() {
    isDark = !isDark;

    if (isDark) {
      statusMode = 'Dark';
    } else {
      statusMode = 'Light';
    }

    notifyListeners();
  }
}
