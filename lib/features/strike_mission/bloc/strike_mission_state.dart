import 'package:guildwars2_companion/features/strike_mission/models/strike_mission.dart';
import 'package:meta/meta.dart';

@immutable
abstract class StrikeMissionState {}

class LoadingStrikeMissionsState extends StrikeMissionState {}

class LoadedStrikeMissionsState extends StrikeMissionState {
  final StrikeMissionData data;

  LoadedStrikeMissionsState(this.data);
}

class ErrorStrikeMissionsState extends StrikeMissionState {}
