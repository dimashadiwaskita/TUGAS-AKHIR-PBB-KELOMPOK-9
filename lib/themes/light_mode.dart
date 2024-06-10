import 'package:flutter/material.dart';

// Definisi tema untuk mode terang
ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300, // Warna latar belakang
    primary: Colors.grey.shade500, // Warna utama
    secondary: Colors.grey.shade200, // Warna sekunder
    inversePrimary: Colors.grey
        .shade900, // Warna utama terbalik (biasanya untuk teks pada latar belakang utama)
  ),
);
