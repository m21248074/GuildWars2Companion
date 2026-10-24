import 'package:guildwars2_companion/features/item/models/item.dart';

/// The current season of the Wizard's Vault.
class WizardsVaultSeason {
  String title;
  DateTime start;
  DateTime end;

  WizardsVaultSeason({this.title, this.start, this.end});

  WizardsVaultSeason.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    start = json['start'] != null ? DateTime.tryParse(json['start']) : null;
    end = json['end'] != null ? DateTime.tryParse(json['end']) : null;
  }
}

/// One objective of the daily, weekly or special list of the account.
class WizardsVaultObjective {
  int id;
  String title;
  String track;
  int acclaim;
  int progressCurrent;
  int progressComplete;
  bool claimed;

  WizardsVaultObjective({
    this.id,
    this.title,
    this.track,
    this.acclaim,
    this.progressCurrent,
    this.progressComplete,
    this.claimed,
  });

  WizardsVaultObjective.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    track = json['track'];
    acclaim = json['acclaim'] ?? 0;
    progressCurrent = json['progress_current'] ?? 0;
    progressComplete = json['progress_complete'] ?? 0;
    claimed = json['claimed'] ?? false;
  }

  bool get completed => progressComplete > 0 && progressCurrent >= progressComplete;
}

/// The daily, weekly or special list of the account, with the progress of the
/// reward for completing the whole list.
class WizardsVaultObjectiveGroup {
  int metaProgressCurrent;
  int metaProgressComplete;
  int metaRewardItemId;
  int metaRewardAstral;
  bool metaRewardClaimed;
  List<WizardsVaultObjective> objectives;

  WizardsVaultObjectiveGroup({
    this.metaProgressCurrent,
    this.metaProgressComplete,
    this.metaRewardItemId,
    this.metaRewardAstral,
    this.metaRewardClaimed,
    this.objectives,
  });

  WizardsVaultObjectiveGroup.fromJson(Map<String, dynamic> json) {
    metaProgressCurrent = json['meta_progress_current'] ?? 0;
    metaProgressComplete = json['meta_progress_complete'] ?? 0;
    metaRewardItemId = json['meta_reward_item_id'];
    metaRewardAstral = json['meta_reward_astral'] ?? 0;
    metaRewardClaimed = json['meta_reward_claimed'] ?? false;
    objectives = json['objectives'] != null
      ? (json['objectives'] as List)
        .map((o) => WizardsVaultObjective.fromJson(o))
        .toList()
      : [];
  }
}

/// A reward of the shop of the Wizard's Vault.
class WizardsVaultListing {
  int id;
  int itemId;
  int itemCount;
  String type;
  int cost;

  /// How many times the account has bought it and how often it can be
  /// bought (null: no limit), both only known for the account.
  int purchased = 0;
  int purchaseLimit;

  /// Filled in after the items have been loaded.
  Item item;

  WizardsVaultListing({this.id, this.itemId, this.itemCount, this.type, this.cost});

  WizardsVaultListing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemId = json['item_id'];
    itemCount = json['item_count'] ?? 1;
    type = json['type'];
    cost = json['cost'] ?? 0;
    purchased = json['purchased'] ?? 0;
    purchaseLimit = json['purchase_limit'];
  }

  bool get soldOut => purchaseLimit != null && purchased >= purchaseLimit;
}

class WizardsVaultData {
  final WizardsVaultSeason season;
  final WizardsVaultObjectiveGroup daily;
  final WizardsVaultObjectiveGroup weekly;
  final WizardsVaultObjectiveGroup special;
  final List<WizardsVaultListing> listings;

  WizardsVaultData({
    this.season,
    this.daily,
    this.weekly,
    this.special,
    this.listings,
  });
}
