import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';
import 'dart:math'; // Tambahkan import ini untuk fungsi shuffle

// PlaylistProvider adalah kelas yang mengelola daftar putar lagu dan pengontrol audio player
class PlaylistProvider extends ChangeNotifier {
  // Daftar putar yang berisi objek Song
  final List<Song> _playlist = [
    // song 1
    Song(
      songName: "Pluto Projector",
      artistName: "Rex Orange County",
      albumArtImagePath: "assets/images/pluto projector.jpg",
      audioPath:
          "audio/Rex+Orange+County+-+Pluto+Projector+(Official+Audio).mp3",
    ),
    // song 2
    Song(
      songName: "This is What Autum Feels Like",
      artistName: "JVKE",
      albumArtImagePath: "assets/images/jvke.jpeg",
      audioPath: "audio/JVKE+-+this+is+what+autumn+feels+like.mp3",
    ),
    // song 3
    Song(
      songName: "UNDESTAND",
      artistName: "Keshi",
      albumArtImagePath: "assets/images/keshi.jpg",
      audioPath: "audio/keshi+-+UNDERSTAND+(Official+Music+Video).mp3",
    ),
    // song 4
    Song(
      songName: "Wide Awake",
      artistName: "Katy Perry",
      albumArtImagePath: "assets/images/katyperry.jpg",
      audioPath: "audio/wideawake.mp3",
    ),
    // song 5
    Song(
      songName: "Love Me",
      artistName: "Realstk",
      albumArtImagePath: "assets/images/realstk.jpeg",
      audioPath: "audio/RealestK+-+Love+Me+(Official+Audio).mp3",
    ),
    // song 6
    Song(
      songName: "Winter's Glow",
      artistName: "Kardi",
      albumArtImagePath: "assets/images/kardi.jpg",
      audioPath: "audio/Winter's+Glow.mp3",
    ),
    // song 7
    Song(
      songName: "Last Friday Night (T.G.I.F)",
      artistName: "Katy Perry",
      albumArtImagePath: "assets/images/katyperry.jpg",
      audioPath: "audio/Katy Perry - Last Friday Night.mp3",
    ),
    // song 8
    Song(
      songName: "A Thousand Years (Christina Perri Cover)",
      artistName: "James Arthur",
      albumArtImagePath: "assets/images/james arthur.jpg",
      audioPath:
          "audio/James Arthur - A Thousand Years (Christina Perri Cover).mp3",
    ),
    // song 9
    Song(
      songName: "Car's Outside (Official Lyric Video)",
      artistName: "James Arthur",
      albumArtImagePath: "assets/images/james arthur.jpg",
      audioPath:
          "audio/James Arthur - Car's Outside (Official Lyric Video).mp3",
    ),
    // song 10
    Song(
      songName: "Angels Like You (Official Video)",
      artistName: "Miley Cyrus",
      albumArtImagePath: "assets/images/miley cyrus.jpg",
      audioPath: "audio/Miley Cyrus - Angels Like You (Official Video).mp3",
    ),
  ];

  int? _currentSongIndex; // Indeks lagu yang sedang diputar

  // audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Durasi
  Duration _currentDuration = Duration.zero; // Durasi lagu yang sedang diputar
  Duration _totalDuration = Duration.zero; // Durasi total lagu

  // Konstruktor
  PlaylistProvider() {
    listenToDuration(); // Memanggil metode untuk mendengarkan perubahan durasi
  }

  // Awalnya tidak memutar lagu
  bool _isPlaying = false;

  // Memutar lagu
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  // Jeda lagu yang sedang diputar
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // Melanjutkan memutar lagu yang dijeda
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // Jeda atau melanjutkan lagu
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // Mengatur posisi spesifik dalam lagu yang sedang diputar
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // Memutar lagu berikutnya
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        currentSongIndex = 0;
      }
    }
  }

  // Memutar lagu sebelumnya
  void playPreviousSong() async {
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  // Mendengarkan perubahan durasi
  void listenToDuration() {
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  // Mengacak daftar putar
  void shufflePlaylist() {
    _playlist.shuffle(Random());
    notifyListeners();
  }

  // Getter
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  // Setter untuk currentSongIndex
  set currentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play(); // Memutar lagu saat indeks berubah
    }

    notifyListeners();
  }
}
