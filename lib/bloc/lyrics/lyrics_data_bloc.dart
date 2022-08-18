import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrics_app/bloc/lyrics/lyrics_data_event.dart';
import 'package:lyrics_app/bloc/lyrics/lyrics_data_state.dart';
import 'package:lyrics_app/data/musics_provider/lyrics_data_provider.dart';
import 'package:lyrics_app/data/musics_provider/track_detail_provider.dart';

class LyricsDataBloc extends Bloc<LyricsDataEvent, LyricsDataState> {
  final LyricsDataProvider lyricsDataProvider = LyricsDataProvider();
  final TrackDetailProvider trackDetailProvider = TrackDetailProvider();

  LyricsDataBloc() : super(Idle()) {
    on<LoadLyrics>(_loadLyricsData);
  }

  void _loadLyricsData(LoadLyrics event, Emitter emit) async {
    emit(LyricsLoading());
    try {
      final lyrics = await lyricsDataProvider.getLyrics(event.trackId);
      // print(lyrics);
      final track = await trackDetailProvider.getTrackDetail(event.trackId);

      emit(LyricsLoaded(lyrics: lyrics, track: track));
    } catch (ex) {
      emit(LyricsLoadingFailed());
    }
  }
}
