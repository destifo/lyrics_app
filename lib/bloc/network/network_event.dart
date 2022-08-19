import 'package:lyrics_app/bloc/network/network_state.dart';

abstract class NetworkEvent {}

class Connected extends NetworkEvent {}

class Disconnected extends NetworkEvent {}
