abstract class LyricsDataEvent {}

class LoadLyrics extends LyricsDataEvent {
  final int trackId;
  LoadLyrics(this.trackId);
}
