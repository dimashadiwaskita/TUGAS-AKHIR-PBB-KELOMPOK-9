import 'package:flutter/material.dart';
import 'package:music_player/pages/settings_page.dart';
import 'package:music_player/last_fm_service.dart'; // Pastikan mengganti 'music_player' dengan nama paket aplikasi Anda

// Widget MyDrawer yang bertanggung jawab untuk menampilkan Drawer (panel samping) dalam aplikasi
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.music_note,
                size: 40,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          // ListTile untuk navigasi ke halaman Home
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25),
            child: ListTile(
              title: const Text("H O M E"),
              leading: const Icon(Icons.home),
              onTap: () => Navigator.pop(context), // Kembali ke halaman utama
            ),
          ),
          // ListTile untuk navigasi ke halaman Settings
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0),
            child: ListTile(
              title: const Text("S E T T I N G S"),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context); // Tutup Drawer

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                );
              },
            ),
          ),
          // ListTile untuk navigasi ke halaman Top Tracks
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0),
            child: ListTile(
              title: const Text("T O P  T R A C K S"),
              leading: const Icon(Icons.music_note),
              onTap: () {
                Navigator.pop(context); // Tutup Drawer

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopTracksPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Widget Stateful untuk halaman Top Tracks
class TopTracksPage extends StatefulWidget {
  @override
  _TopTracksPageState createState() => _TopTracksPageState();
}

class _TopTracksPageState extends State<TopTracksPage> {
  final LastFmService _lastFmService =
      LastFmService(); // Inisialisasi layanan LastFmService
  List<dynamic> _topTracks = []; // List untuk menyimpan data top tracks

  @override
  void initState() {
    super.initState();
    _fetchTopTracks(); // Memanggil metode untuk mengambil data top tracks
  }

  // Metode untuk mengambil data top tracks dari LastFmService
  Future<void> _fetchTopTracks() async {
    try {
      final tracks =
          await _lastFmService.getTopTracks(); // Memanggil metode getTopTracks
      setState(() {
        _topTracks = tracks; // Menyimpan data top tracks di state
      });
    } catch (e) {
      print(e); // Menangani kesalahan jika terjadi
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Tracks'),
      ),
      body: _topTracks.isEmpty
          ? Center(
              child:
                  CircularProgressIndicator()) // Menampilkan indikator loading jika data belum diambil
          : ListView.builder(
              itemCount: _topTracks.length,
              itemBuilder: (context, index) {
                final track = _topTracks[
                    index]; // Mengambil data track pada index tertentu
                return ListTile(
                  title: Text(track['name']), // Menampilkan nama track
                  subtitle:
                      Text(track['artist']['name']), // Menampilkan nama artis
                );
              },
            ),
    );
  }
}
