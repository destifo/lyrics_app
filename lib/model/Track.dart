class Track {
  final int trackId;
  final String name;
  final String artist;
  final String albumName;
  final int explicit;
  final int rating;

  Track({
    required this.trackId,
    required this.name,
    required this.albumName,
    required this.artist,
    required this.explicit,
    required this.rating,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      trackId: json['track_id'],
      name: json['track_name'].toString(),
      albumName: json['album_name'].toString(),
      artist: json['artist_name'].toString(),
      explicit: json['explicit'],
      rating: json['track_rating'],
    );
  }
}
