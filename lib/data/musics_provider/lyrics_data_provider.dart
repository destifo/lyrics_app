import 'dart:convert';

import 'package:lyrics_app/model/Track.dart';
import 'package:http/http.dart' as http;

class LyricsDataProvider {
  LyricsDataProvider();

  Future<String> getLyrics(int trackId) async {
    final String baseUrl =
        'https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=${trackId}&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7';

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final lyrics =
          body['message']['body']['lyrics']['lyrics_body'].toString();

      // print(lyrics);

      return lyrics;
    }
    throw Exception('Error loading track details');
  }
}
