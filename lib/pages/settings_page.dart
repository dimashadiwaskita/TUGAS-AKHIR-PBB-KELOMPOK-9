import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Mengatur warna latar belakang sesuai dengan tema yang sedang digunakan
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          // Menampilkan judul pada AppBar
          title: const Text("S E T T I N G S")),
      body: Container(
        // Mengatur dekorasi container dengan warna sesuai tema dan border radius
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        // Mengatur padding dan margin container
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(25),
        // Membuat row untuk menampilkan teks dan switch
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Menampilkan teks "Dark Mode" dengan gaya bold
            const Text("Dark Mode",
                style: TextStyle(fontWeight: FontWeight.bold)),

            // Menggunakan CupertinoSwitch untuk mengaktifkan/mematikan mode gelap
            CupertinoSwitch(
              // Mengambil nilai isDarkMode dari ThemeProvider tanpa mendengarkan perubahan
              value:
                  Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
              // Mengubah tema saat switch diaktifkan/dimatikan
              onChanged: (value) =>
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme(),
            ),
          ],
        ),
      ),
    );
  }
}
