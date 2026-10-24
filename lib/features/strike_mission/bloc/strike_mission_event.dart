import 'package:meta/meta.dart';

@immutable
abstract class StrikeMissionEvent {}

class LoadStrikeMissionsEvent extends StrikeMissionEvent {}
