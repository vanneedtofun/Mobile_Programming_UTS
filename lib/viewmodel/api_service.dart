import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/game_model.dart';

class ApiService {
  static const String apiUrl = 'https://www.freetogame.com/api/games';

  static Future<List<GameModel>> fetchGames() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);
        // Mengambil 20 game saja agar ringan
        List<GameModel> games = body.take(20).map((dynamic item) => GameModel.fromJson(item)).toList();
        return games;
      } else {
        throw Exception('Gagal memuat data (Status: ${response.statusCode})');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan koneksi: $e');
    }
  }
}
