import 'dart:convert';

import 'package:lyrics_app/model/Track.dart';
import 'package:http/http.dart' as http;

class TrackDetailProvider {

  TrackDetailProvider();

  Future<Track> getTrackDetail(int trackId) async {
    final String baseUrl =
        'https://api.musixmatch.com/ws/1.1/track.get?track_id=${trackId}&apikey=19f33888bf0164848831efe95cd1d7ca';

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final trk = body['message']['body']['track'];

      Track track = Track.fromJson(trk);

      return track;
    }
    throw Exception('Error loading track details');
  }
}
