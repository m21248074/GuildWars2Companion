import 'package:guildwars2_companion/features/wizards_vault/models/wizards_vault.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WizardsVaultState {}

class LoadingWizardsVaultState extends WizardsVaultState {}

class LoadedWizardsVaultState extends WizardsVaultState {
  final WizardsVaultData data;

  LoadedWizardsVaultState(this.data);
}

class ErrorWizardsVaultState extends WizardsVaultState {}
