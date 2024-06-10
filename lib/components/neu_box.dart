import 'package:flutter/material.dart';
import 'package:music_player/themes/theme_provider.dart';
import 'package:provider/provider.dart';

// Widget NeuBox adalah widget stateless yang menampilkan kotak dengan efek neomorfisme
class NeuBox extends StatelessWidget {
  final Widget? child;

  // Konstruktor untuk NeuBox yang menerima widget anak sebagai parameter
  const NeuBox({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Mendapatkan status mode gelap atau terang dari ThemeProvider menggunakan Provider
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Container(
      decoration: BoxDecoration(
        // Mengatur warna latar belakang berdasarkan tema saat ini
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12), // Mengatur radius sudut kotak
        boxShadow: [
          // Efek bayangan untuk memberikan ilusi kedalaman
          BoxShadow(
            color: isDarkMode
                ? Colors.black
                : Colors.grey.shade500, // Warna bayangan berdasarkan mode
            blurRadius: 15, // Radius blur untuk bayangan
            offset: const Offset(4, 4), // Offset untuk posisi bayangan
          ),

          // Efek bayangan kedua untuk sisi yang berlawanan
          BoxShadow(
            color: isDarkMode
                ? Colors.grey.shade800
                : Colors.white, // Warna bayangan berdasarkan mode
            blurRadius: 15, // Radius blur untuk bayangan
            offset: const Offset(-4, -4), // Offset untuk posisi bayangan
          ),
        ],
      ),
      // Widget anak yang akan ditempatkan di dalam kotak neomorfisme
      child: child,
    );
  }
}
