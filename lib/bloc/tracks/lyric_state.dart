import 'package:lyrics_app/model/Track.dart';

abstract class LyricState {}


class NoInternet extends LyricState {}

class LoadingTracks extends LyricState {}

class Idle extends LyricState {}

class TracksLoaded extends LyricState {
  final List<Track> tracks;

  TracksLoaded(this.tracks);
}