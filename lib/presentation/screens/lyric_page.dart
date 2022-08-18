import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrics_app/bloc/lyrics/lyrics_data_bloc.dart';
import 'package:lyrics_app/bloc/lyrics/lyrics_data_event.dart';
import 'package:lyrics_app/bloc/lyrics/lyrics_data_state.dart';
import 'package:lyrics_app/model/Track.dart';
import 'package:lyrics_app/presentation/widgets/lyricsPage/details_tile.dart';

class LyricPage extends StatelessWidget {
  final int trackId;

  const LyricPage(this.trackId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Track Details',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: BlocBuilder<LyricsDataBloc, LyricsDataState>(
          builder: (context, state) {
            // BlocProvider.of<LyricsDataBloc>(context).add(LoadLyrics(trackId));

            if (state is LyricsLoading) {
              return const CircularProgressIndicator();
            }

            if (state is LyricsLoaded) {
              final lyrics = state.lyrics;
              Track track = state.track;
              final space = MediaQuery.of(context).size.height * 0.018;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailsTile('Name', track.name),
                    SizedBox(
                      height: space,
                    ),
                    DetailsTile('Artist', track.artist),
                    SizedBox(
                      height: space,
                    ),
                    DetailsTile('Album Name', track.albumName),
                    SizedBox(
                      height: space,
                    ),
                    DetailsTile(
                        'Explicit', (track.explicit == 0) ? 'False' : 'True'),
                    SizedBox(
                      height: space,
                    ),
                    DetailsTile('Rating', track.rating.toString()),
                    SizedBox(
                      height: space,
                    ),
                    DetailsTile('Lyrics', lyrics),
                  ],
                ),
              );
            }

            return const Center(
              child: Text('No Internet Connection'),
            );
          },
        ),
      ),
    );
  }
}
