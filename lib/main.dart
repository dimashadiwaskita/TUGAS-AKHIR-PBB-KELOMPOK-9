import 'package:flutter/material.dart';
import 'package:music_player/models/playlist_provider.dart';
import 'package:music_player/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';

// Fungsi utama yang menjalankan aplikasi
void main() {
  runApp(
    // MultiProvider digunakan untuk menyediakan beberapa provider di seluruh aplikasi
    MultiProvider(
      providers: [
        // ChangeNotifierProvider untuk ThemeProvider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        // ChangeNotifierProvider untuk PlaylistProvider
        ChangeNotifierProvider(create: (context) => PlaylistProvider()),
      ],
      // MyApp adalah widget root dari aplikasi
      child: const MyApp(),
    ),
  );
}

// Kelas MyApp yang menjadi root widget dari aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      home: const HomePage(), // Menentukan halaman utama aplikasi
      theme: Provider.of<ThemeProvider>(context)
          .themeData, // Mengambil tema dari ThemeProvider
    );
  }
}
