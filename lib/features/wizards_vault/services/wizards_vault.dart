import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:guildwars2_companion/core/utils/urls.dart';
import 'package:guildwars2_companion/features/wizards_vault/models/wizards_vault.dart';

class WizardsVaultService {
  Dio dio;

  WizardsVaultService({
    @required this.dio,
  });

  Future<WizardsVaultSeason> getSeason() async {
    final response = await dio.get(Urls.wizardsVaultUrl);

    if (response.statusCode == 200) {
      return WizardsVaultSeason.fromJson(response.data);
    }

    throw Exception();
  }

  /// [type] is daily, weekly or special.
  Future<WizardsVaultObjectiveGroup> getObjectives(String type) async {
    final response = await dio.get('${Urls.accountWizardsVaultUrl}/$type');

    if (response.statusCode == 200) {
      return WizardsVaultObjectiveGroup.fromJson(response.data);
    }

    throw Exception();
  }

  Future<List<WizardsVaultListing>> getListings() async {
    final response = await dio.get(Urls.wizardsVaultListingsUrl);

    if (response.statusCode == 200) {
      List listings = response.data;
      return listings.map((l) => WizardsVaultListing.fromJson(l)).toList();
    }

    throw Exception();
  }

  /// All listings, with how often the account bought them (purchased) and
  /// how often it can (purchase_limit).
  Future<List<WizardsVaultListing>> getAccountListings() async {
    final response = await dio.get(Urls.accountWizardsVaultListingsUrl);

    if (response.statusCode == 200) {
      List listings = response.data;
      return listings.map((l) => WizardsVaultListing.fromJson(l)).toList();
    }

    throw Exception();
  }
}
