import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> searchAnime(String param) async {
  final url = 'https://api.jikan.moe/v3/search/anime?q=$param';
  final animesDataJSON = await http.get(url);
  final animesData =
      json.decode(animesDataJSON.body)['results'] as List<dynamic>;
  return animesData;
}

Future<Map<String, dynamic>> getAnimeDetail(int animeId) async {
  final url = 'https://api.jikan.moe/v3/anime/$animeId';
  final animeDataJSON = await http.get(url);
  final animeData = json.decode(animeDataJSON.body) as Map<String, dynamic>;
  return animeData;
}
