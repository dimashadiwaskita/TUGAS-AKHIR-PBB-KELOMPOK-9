import 'package:flutter/material.dart';
import 'package:music_player/components/my_drawer.dart';
import 'package:music_player/models/playlist_provider.dart';
import 'package:provider/provider.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/pages/song_page.dart';

// Widget Stateful HomePage yang menampilkan daftar putar
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Mendeklarasikan variabel playlistProvider
  late final dynamic playlistProvider;

  @override
  void initState() {
    super.initState();

    // Mendapatkan instance PlaylistProvider saat inisialisasi
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  // Fungsi untuk berpindah ke halaman lagu dan mengatur lagu saat ini berdasarkan indeks
  void goToSong(int songIndex) {
    playlistProvider.currentSongIndex = songIndex;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SongPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("P L A Y L I S T"),
        actions: [
          // Tombol untuk mengacak daftar putar
          IconButton(
            icon: Icon(Icons.shuffle),
            onPressed: () {
              // Memanggil fungsi shuffle dari PlaylistProvider
              Provider.of<PlaylistProvider>(context, listen: false)
                  .shufflePlaylist();
            },
          ),
        ],
      ),
      // Menampilkan drawer kustom
      drawer: const MyDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          final List<Song> playlist = value.playlist;

          // Menampilkan daftar putar menggunakan ListView.builder
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              final Song song = playlist[index];

              return ListTile(
                title: Text(song.songName), // Menampilkan nama lagu
                subtitle: Text(song.artistName), // Menampilkan nama artis
                leading: Image.asset(
                    song.albumArtImagePath), // Menampilkan gambar album
                onTap: () =>
                    goToSong(index), // Pindah ke halaman lagu saat item diklik
              );
            },
          );
        },
      ),
    );
  }
}
