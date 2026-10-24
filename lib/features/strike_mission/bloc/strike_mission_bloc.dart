import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:guildwars2_companion/features/strike_mission/repositories/strike_mission.dart';
import './bloc.dart';

class StrikeMissionBloc extends Bloc<StrikeMissionEvent, StrikeMissionState> {
  final StrikeMissionRepository strikeMissionRepository;

  StrikeMissionBloc({
    @required this.strikeMissionRepository
  }): super(LoadingStrikeMissionsState());

  @override
  Stream<StrikeMissionState> mapEventToState(
    StrikeMissionEvent event,
  ) async* {
    if (event is LoadStrikeMissionsEvent) {
      try {
        yield LoadingStrikeMissionsState();

        yield LoadedStrikeMissionsState(await strikeMissionRepository.getStrikeMissions());
      } catch (_) {
        yield ErrorStrikeMissionsState();
      }
    }
  }
}
