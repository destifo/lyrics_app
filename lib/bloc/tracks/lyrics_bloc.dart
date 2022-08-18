import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrics_app/bloc/tracks/lyric_event.dart';
import 'package:lyrics_app/bloc/tracks/lyric_state.dart';
import 'package:lyrics_app/data/musics_provider/musics_data_provider.dart';
import 'package:lyrics_app/model/Track.dart';

class LyricsBloc extends Bloc<LyricEvent, LyricState> {
  final MusicsDataProvider musicsDataProvider;

  LyricsBloc(this.musicsDataProvider) : super(Idle()) {
    on<LoadTracks>(_loadTracks);
  }

  void _loadTracks(LoadTracks event, Emitter emit) async {
    emit(LoadingTracks());
    List<Track> tracks = await musicsDataProvider.getTracks();
    emit(TracksLoaded(tracks));
  }
}
