abstract class LyricEvent {}

class LoadLyric extends LyricEvent {
  final int trackId;

  LoadLyric(this.trackId);
}

class LoadTracks extends LyricEvent {}
