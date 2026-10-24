import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:guildwars2_companion/core/localization/strings.dart';

class GuildWarsUtil {
  static int calculatePlayTime(int playTime) {
    return (playTime / 60 / 60).round();
  }

  static String masteryName(String mastery) {
    switch (mastery) {
      case 'Maguuma':
        return AppStrings.heartOfThorns;
      case 'Desert':
        return AppStrings.pathOfFire;
      case 'Tundra':
      case 'Icebrood':
        return AppStrings.icebroodSaga;
      case 'Tyria':
        return AppStrings.tyria;
      case 'Jade':
      case 'Unknown':
        return AppStrings.endOfDragons;
      case 'Sky':
        return AppStrings.secretsOfTheObscure;
      case 'Wild':
        return AppStrings.janthirWilds;
      case 'Magic':
        return AppStrings.visionsOfEternity;
      default:
        return mastery;
    }
  }

  static Color regionColor(String region) {
    switch (region) {
      case 'Desert':
        return Color(0xFF80066E);
      case 'Maguuma':
        return Colors.green;
      case 'Tyria':
        return Colors.red[600];
      case 'Tundra':
      case 'Icebrood':
        return Colors.blueAccent;
      case 'Sky':
        return Colors.amber[700];
      case 'Wild':
        return Color(0xFF2845C9);
      case 'Magic':
        return Colors.deepOrange;
      default:
        return Color(0xFF118E8A);
    }
  }

  static Color getWorldBossColor({@required hardDifficulty})  => hardDifficulty ? Colors.pink : Colors.green;

  static Color getProfessionColor(String professionId) {
    switch (professionId) {
      case 'Guardian':
        return Color(0xFF1d95b3);
      case 'Revenant':
        return Color(0xFF636363);
      case 'Warrior':
        return Color(0xFFcea64b);
      case 'Engineer':
        return Color(0xFFc87137);
      case 'Ranger':
        return Color(0xFF6b932e);
      case 'Thief':
        return Color(0xFF7b5559);
      case 'Elementalist':
        return Color(0xFFb33d3d);
      case 'Mesmer':
        return Colors.purple;
      case 'Necromancer':
        return Color(0xFF1f6557);
      default:
        return Colors.red;
    }
  }

  static Color getRarityColor(String rarity) {
    switch (rarity) {
      case 'Junk':
        return Color(0xFFAAAAAA);
      case 'Basic':
        return Colors.grey;
      case 'Fine':
        return Color(0xFF62A4DA);
      case 'Masterwork':
        return Color(0xFF1a9306);
      case 'Rare':
        return Color(0xFFfcd00b);
      case 'Exotic':
        return Color(0xFFffa405);
      case 'Ascended':
        return Color(0xFFfb3e8d);
      case 'Legendary':
        return Color(0xFF4C139D);
      default:
        return Colors.grey;
    }
  }

  static List<String> validDisciplines() {
    return [
      'Armorsmith',
      'Artificer',
      'Chef',
      'Huntsman',
      'Jeweler',
      'Leatherworker',
      'Scribe',
      'Tailor',
      'Weaponsmith'
    ];
  }

  static String itemFlagToName(String flag) => AppStrings.itemText(_itemFlagEnglish(flag));

  static String _itemFlagEnglish(String flag) {
    switch (flag) {
      case 'AccountBindOnUse':
        return 'Account bound on use';
      case 'AccountBound':
        return 'Account bound';
      case 'Attuned':
        return 'Attuned';
      case 'BulkConsume':
        return 'Bulk consumable';
      case 'DeleteWarning':
        return 'Warning on delete';
      case 'HideSuffix':
        return 'Suffix hidden';
      case 'Infused':
        return 'Infused';
      case 'MonsterOnly':
        return 'Monster only item';
      case 'NoMysticForge':
        return 'Cannot be used in the Mystic Forge';
      case 'NoSalvage':
        return 'Cannot be salvaged';
      case 'NoSell':
        return 'Cannot be sold';
      case 'NotUpgradeable':
        return 'Not upgradeable';
      case 'NoUnderwater':
        return 'Cannot be used underwater';
      case 'SoulbindOnAcquire':
        return 'Soul bound on acquire';
      case 'SoulBindOnUse':
        return 'Soul bound on use';
      default: return flag;
    }
  }

  static String itemTypeToName(String type) => AppStrings.itemText(_itemTypeEnglish(type));

  static String _itemTypeEnglish(String type) {
    switch (type) {
      case 'HelmAquatic':
        return 'Helm Aquatic';
      case 'AppearanceChange':
        return 'Appearance Change';
      case 'ContractNpc':
        return 'Npc Contract';
      case 'MountRandomUnlock':
        return 'Random Mount Unlock';
      case 'RandomUnlock':
        return 'Random Unlock';
      case 'UpgradeRemoval':
        return 'Upgrade Removal';
      case 'TeleportToFriend':
        return 'Teleport To Friend';
      case 'CraftingMaterial':
        return 'Crafting Material';
      case 'UpgradeComponent':
        return 'Upgrade Component';
      default:
        return type;
    }
  }

  static String removeOnlyHtml(String htmlText) {
    RegExp tagExp = RegExp(
      r"<[^>]*>",
      multiLine: true,
      caseSensitive: true
    );

    return htmlText.replaceAll('<br>', '. ').replaceAll(tagExp, '');
  }

  static String removeFullHtml(String htmlText) {
    RegExp tagExp = RegExp(
      r"<.*>",
      multiLine: true,
      caseSensitive: true
    );

    return htmlText.replaceAll(tagExp, '');
  }

  static String durationToString(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    if (duration.inHours == 0) {
      return "$twoDigitMinutes:$twoDigitSeconds";
    }

    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  static String durationToTextString(Duration duration) {
    List<String> parts = [];

    if (duration.inHours > 0) {
      parts.add(AppStrings.hoursText(duration.inHours));
    }

    if (duration.inMinutes.remainder(60) > 0) {
      parts.add(AppStrings.minutesText(duration.inMinutes.remainder(60), duration.inMinutes));
    }

    if (duration.inSeconds.remainder(60) > 0) {
      parts.add(AppStrings.secondsText(duration.inSeconds.remainder(60), duration.inSeconds));
    }

    return parts.join(' ');
  }

  static String intToString(int value) {
    return NumberFormat('###,###', 'en').format(value);
  }
}