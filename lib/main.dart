import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrics_app/bloc/lyrics/lyrics_data_bloc.dart';
import 'package:lyrics_app/bloc/network/network_bloc.dart';
import 'package:lyrics_app/bloc/network/network_event.dart';
import 'package:lyrics_app/bloc/tracks/lyric_event.dart';
import 'package:lyrics_app/bloc/tracks/lyrics_bloc.dart';
import 'package:lyrics_app/data/musics_provider/musics_data_provider.dart';
import 'package:lyrics_app/presentation/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final MusicsDataProvider musicsDataProvider = MusicsDataProvider();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              LyricsBloc(musicsDataProvider)..add(LoadTracks()),
        ),
        BlocProvider(create: (context) => LyricsDataBloc()),
        BlocProvider(
          create: (context) => NetworkBloc()..add(Disconnected()),
        )
      ],
      child: MaterialApp(
        title: 'Lyrics App',
        theme: ThemeData(
            primaryColor: Colors.white,
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              color: Colors.white,
            )),
        home: const Homepage(),
      ),
    );
  }
}
