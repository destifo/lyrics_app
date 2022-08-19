import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrics_app/bloc/lyrics/lyrics_data_bloc.dart';
import 'package:lyrics_app/bloc/lyrics/lyrics_data_event.dart';
import 'package:lyrics_app/bloc/network/network_bloc.dart';
import 'package:lyrics_app/bloc/network/network_state.dart';
import 'package:lyrics_app/bloc/tracks/lyric_event.dart';
import 'package:lyrics_app/model/Track.dart';
import 'package:lyrics_app/presentation/screens/lyric_page.dart';

import '../../bloc/tracks/lyric_state.dart';
import '../../bloc/tracks/lyrics_bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Trending',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          )),
      body: BlocConsumer<NetworkBloc, NetworkState>(
        listener: (context, state) {
          if (state is Online) {
            BlocProvider.of<LyricsBloc>(context).add(LoadTracks());
          }
        },
        builder: (context, state) {
          if (state is Offline) {
            return const Center(
              child: Text(
                'No Internet Connection',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            );
          }
          if (state is Online) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: BlocBuilder<LyricsBloc, LyricState>(
                      builder: (context, state) {
                        // print(state);
                        if (state is TracksLoaded) {
                          // print(state.tracks[0].albumName);
                          return ListView.builder(
                              itemCount: state.tracks.length,
                              itemBuilder: (context, index) {
                                // print('hey');
                                Track track = state.tracks[index];
                                // print(track.albumName);
                                return Column(children: [
                                  GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<LyricsDataBloc>(context)
                                          .add(LoadLyrics(track.trackId));
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                LyricPage(track.trackId),
                                          ));
                                    },
                                    child: ListTile(
                                      leading:
                                          const Icon(Icons.music_video_sharp),
                                      title: Text(track.name),
                                      subtitle: Text(track.albumName),
                                      trailing: Text(track.artist),
                                    ),
                                  ),
                                  const Divider(),
                                ]);
                              });
                        }

                        if (state is LoadingTracks) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return const Center(
                          child: Text('No Internet Connection'),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          }

          return const Text('Something in bloc state went wrong');
        },
      ),
    );
  }
}
