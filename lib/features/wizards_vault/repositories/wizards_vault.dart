import 'package:flutter/widgets.dart';
import 'package:guildwars2_companion/features/item/models/item.dart';
import 'package:guildwars2_companion/features/item/services/item.dart';
import 'package:guildwars2_companion/features/wizards_vault/models/wizards_vault.dart';
import 'package:guildwars2_companion/features/wizards_vault/services/wizards_vault.dart';

class WizardsVaultRepository {
  final WizardsVaultService wizardsVaultService;
  final ItemService itemService;

  WizardsVaultRepository({
    @required this.wizardsVaultService,
    @required this.itemService,
  });

  Future<WizardsVaultData> getWizardsVault() async {
    List networkResults = await Future.wait([
      wizardsVaultService.getSeason(),
      wizardsVaultService.getObjectives('daily'),
      wizardsVaultService.getObjectives('weekly'),
      wizardsVaultService.getObjectives('special'),
      // What has been bought is nice to have, the shop works without it
      wizardsVaultService.getAccountListings().catchError((_) => wizardsVaultService.getListings()),
    ]);

    List<WizardsVaultListing> listings = networkResults[4];

    await _loadItems(listings);

    return WizardsVaultData(
      season: networkResults[0],
      daily: networkResults[1],
      weekly: networkResults[2],
      special: networkResults[3],
      listings: listings,
    );
  }

  Future<void> _loadItems(List<WizardsVaultListing> listings) async {
    try {
      List<Item> items = await itemService.getItems(
        listings.map((l) => l.itemId).toSet().toList()
      );

      listings.forEach((l) {
        l.item = items.firstWhere((i) => i.id == l.itemId, orElse: () => null);
      });
    } catch (_) {
      // The listings are shown without name and icon
    }
  }
}
