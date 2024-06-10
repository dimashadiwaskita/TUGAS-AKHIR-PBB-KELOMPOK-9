import 'package:flutter/material.dart';
import 'package:music_player/themes/dark_mode.dart';
import 'package:music_player/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  // Inisialisasi dengan tema terang
  ThemeData _themeData = lightMode;

  // Getter untuk mengakses tema saat ini
  ThemeData get themeData => _themeData;

  // Getter untuk mengecek apakah tema saat ini adalah mode gelap
  bool get isDarkMode => _themeData == darkMode;

  // Setter untuk mengubah tema dan memberitahukan pendengar
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // Fungsi untuk mengganti tema antara terang dan gelap
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
