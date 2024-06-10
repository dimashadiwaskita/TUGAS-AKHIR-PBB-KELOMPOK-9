// Kelas Song mendefinisikan model data untuk sebuah lagu
class Song {
  // Properti yang menyimpan informasi tentang lagu
  final String songName; // Nama lagu
  final String artistName; // Nama artis
  final String albumArtImagePath; // Jalur gambar seni album
  final String audioPath; // Jalur file audio

  // Konstruktor untuk kelas Song yang menginisialisasi properti dengan nilai yang diberikan
  Song({
    required this.songName,
    required this.artistName,
    required this.albumArtImagePath,
    required this.audioPath,
  });
}
