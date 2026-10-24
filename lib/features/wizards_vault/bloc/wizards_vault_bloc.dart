import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:guildwars2_companion/features/wizards_vault/repositories/wizards_vault.dart';
import './bloc.dart';

class WizardsVaultBloc extends Bloc<WizardsVaultEvent, WizardsVaultState> {
  final WizardsVaultRepository wizardsVaultRepository;

  WizardsVaultBloc({
    @required this.wizardsVaultRepository
  }): super(LoadingWizardsVaultState());

  @override
  Stream<WizardsVaultState> mapEventToState(
    WizardsVaultEvent event,
  ) async* {
    if (event is LoadWizardsVaultEvent) {
      try {
        yield LoadingWizardsVaultState();

        yield LoadedWizardsVaultState(await wizardsVaultRepository.getWizardsVault());
      } catch (_) {
        yield ErrorWizardsVaultState();
      }
    }
  }
}
