import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lyrics_app/model/Track.dart';

class MusicsDataProvider {
  final String baseUrl =
      'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=19f33888bf0164848831efe95cd1d7ca';

  Future<List<Track>> getTracks() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final trackList = body['message']['body']['track_list'];

      List<Track> tracks = [];

      for (Map<String, dynamic> trk in trackList) {
        Track track = Track.fromJson(trk['track']);
        tracks.add(track);
      }

      return tracks;
    }
    throw Exception(response.statusCode);
  }
}
