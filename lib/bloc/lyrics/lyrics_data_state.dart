import 'package:lyrics_app/model/Track.dart';

abstract class LyricsDataState {}

class LyricsLoadingFailed extends LyricsDataState {}

class LyricsLoaded extends LyricsDataState {
  final String lyrics;
  final Track track;

  LyricsLoaded({required this.lyrics, required this.track});
}

class LyricsLoading extends LyricsDataState {}

class Idle extends LyricsDataState {}
