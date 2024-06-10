import 'dart:convert';
import 'package:http/http.dart' as http;

class LastFmService {
  // Kunci API untuk mengakses layanan Last.fm
  final String apiKey = '9499d728d85e4373e3ddfe01c54408f9';

  // Fungsi untuk mengambil daftar lagu teratas
  Future<List<dynamic>> getTopTracks() async {
    // Mengirim permintaan HTTP GET ke API Last.fm
    final response = await http.get(
      Uri.parse(
          'http://ws.audioscrobbler.com/2.0/?method=chart.gettoptracks&api_key=$apiKey&format=json'),
    );

    // Memeriksa status kode dari respons
    if (response.statusCode == 200) {
      // Jika berhasil, menguraikan respons JSON
      final jsonResponse = json.decode(response.body);
      // Mengembalikan daftar track dari respons JSON
      return jsonResponse['tracks']['track'];
    } else {
      // Jika gagal, melempar pengecualian
      throw Exception('Failed to load top tracks');
    }
  }
}
