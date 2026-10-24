import 'dart:convert';

import 'package:guildwars2_companion/features/account/models/account.dart';
import 'package:guildwars2_companion/features/account/models/token_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachedAccount {
  final Account account;
  final TokenInfo tokenInfo;

  CachedAccount(this.account, this.tokenInfo);
}

/// The last account and token info that were fetched, so the app can open
/// without waiting for two network round trips. An entry is only valid for the
/// api key it was stored for.
class AccountCache {
  static const String _key = 'cached_account';

  static Future<CachedAccount> load(String token) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String stored = prefs.getString(_key);

      if (stored == null) {
        return null;
      }

      Map<String, dynamic> json = jsonDecode(stored);

      if (json['key'] != _fingerprint(token)) {
        return null;
      }

      return CachedAccount(
        Account.fromJson(json['account']),
        TokenInfo.fromJson(json['tokenInfo']),
      );
    } catch (_) {
      // A missing or unreadable cache just means a normal start
      return null;
    }
  }

  static Future<void> save(String token, Account account, TokenInfo tokenInfo) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(_key, jsonEncode({
        'key': _fingerprint(token),
        'account': account.toJson(),
        'tokenInfo': tokenInfo.toJson(),
      }));
    } catch (_) {}
  }

  static Future<void> clear() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(_key);
    } catch (_) {}
  }

  // FNV-1a, so the api key itself is not stored a second time
  static String _fingerprint(String token) {
    int hash = 0x811c9dc5;

    for (int unit in token.codeUnits) {
      hash ^= unit;
      hash = (hash * 0x01000193) & 0xFFFFFFFF;
    }

    return hash.toRadixString(16);
  }
}
