import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:guildwars2_companion/core/utils/account_cache.dart';
import 'package:guildwars2_companion/core/utils/stats_cache.dart';
import 'package:guildwars2_companion/features/account/exceptions/api.dart';
import 'package:guildwars2_companion/features/account/models/account.dart';
import 'package:guildwars2_companion/features/account/models/token_entry.dart';
import 'package:guildwars2_companion/features/account/models/token_info.dart';
import 'package:guildwars2_companion/features/account/repositories/account.dart';
import 'package:guildwars2_companion/core/localization/strings.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountRepository accountRepository;

  AccountBloc({
    @required this.accountRepository
  }): super(LoadingAccountState()) {
    add(SetupAccountEvent());
  }

  @override
  Stream<AccountState> mapEventToState(
    AccountEvent event,
  ) async* {
    if (event is AuthenticateEvent) {
      yield LoadingAccountState();
      // Possibly a different account than the one the cached stats belong to
      await StatsCache.clear();
      yield* _authenticate(event.token);
    } else if (event is SetupAccountEvent) {
      yield LoadingAccountState();
      if (await accountRepository.tokenPresent()) {
        String token = await accountRepository.getCurrentToken();
        CachedAccount cached = await AccountCache.load(token);

        if (cached != null) {
          // Open right away with what was known last time, refresh in the background
          yield AuthenticatedState(cached.account, cached.tokenInfo);
          yield* _refresh(token);
          return;
        }

        yield* _authenticate(token);
        return;
      }
      yield await _getUnauthenticated(null);
    } else if (event is AddTokenEvent) {
      yield LoadingAccountState();
      yield* _addToken(event.token);
    } else if (event is RemoveTokenEvent) {
      yield LoadingAccountState();
      yield* _removeToken(event.tokenId);
    } else if (event is UnauthenticateEvent) {
      await StatsCache.clear();
      await AccountCache.clear();
      await accountRepository.removeCurrentToken();
      yield await _getUnauthenticated(null);
    }
  }

  Stream<AccountState> _authenticate(String token) async* {
    try {
      TokenInfo tokenInfo = await accountRepository.getTokenInfo(token);
      Account account = await accountRepository.getAccount(token);

      AccountCache.save(token, account, tokenInfo);

      yield AuthenticatedState(account, tokenInfo);
    } catch (exception) {
      switch (exception.runtimeType) {
        case ApiException:
          yield await _getUnauthenticated(AppStrings.apiError((exception as ApiException).apiMessage));
          break;
        default:
          yield await _getUnauthenticated(AppStrings.networkError);
      }
    }
  }

  // Replaces an account that was shown from the cache with fresh data
  Stream<AccountState> _refresh(String token) async* {
    try {
      TokenInfo tokenInfo = await accountRepository.getTokenInfo(token);
      Account account = await accountRepository.getAccount(token);

      AccountCache.save(token, account, tokenInfo);

      yield AuthenticatedState(account, tokenInfo);
    } catch (exception) {
      if (exception is ApiException) {
        // The api key was rejected, the cached account is no longer valid
        await AccountCache.clear();
        yield await _getUnauthenticated(AppStrings.apiError(exception.apiMessage));
      }

      // On a network error keep showing the cached account
    }
  }

  Stream<AccountState> _addToken(String token) async* {
    try {
      Account account = await accountRepository.getAccount(token);

      await accountRepository.addToken(TokenEntry(
        name: account.name,
        date: DateTime.now().toIso8601String(),
        token: token,
      ));
      yield await _getUnauthenticated(AppStrings.apiKeyAdded, tokenAdded: true);
    } catch (exception) {
      switch (exception.runtimeType) {
        case ApiException:
          yield await _getUnauthenticated(AppStrings.apiError((exception as ApiException).apiMessage));
          break;
        default:
          yield await _getUnauthenticated(AppStrings.networkError);
      }
    }
  }

  Stream<AccountState> _removeToken(int tokenId) async* {
    await accountRepository.removeToken(tokenId);
    yield await _getUnauthenticated(AppStrings.apiKeyRemoved, tokenRemoved: true);
  }  

  Future<UnauthenticatedState> _getUnauthenticated(String message, { bool tokenAdded = false, bool tokenRemoved = false }) async {
    return UnauthenticatedState(
      await accountRepository.getTokens(),
      message,
      tokenAdded,
      tokenRemoved
    );
  }
}
