import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guildwars2_companion/core/localization/strings.dart';
import 'package:guildwars2_companion/core/utils/guild_wars.dart';
import 'package:guildwars2_companion/core/widgets/accent.dart';
import 'package:guildwars2_companion/core/widgets/appbar.dart';
import 'package:guildwars2_companion/core/widgets/cached_image.dart';
import 'package:guildwars2_companion/core/widgets/card.dart';
import 'package:guildwars2_companion/core/widgets/list_view.dart';
import 'package:guildwars2_companion/features/error/widgets/error.dart';
import 'package:guildwars2_companion/features/wizards_vault/bloc/bloc.dart';
import 'package:guildwars2_companion/features/wizards_vault/models/wizards_vault.dart';

class WizardsVaultPage extends StatelessWidget {
  static const Color _color = Colors.indigo;

  @override
  Widget build(BuildContext context) {
    return CompanionAccent(
      lightColor: _color,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: CompanionAppBar(
            title: AppStrings.wizardsVault,
            color: _color,
            elevation: 0.0,
          ),
          body: Column(
            children: <Widget>[
              Material(
                color: Theme.of(context).brightness == Brightness.light ? _color : Theme.of(context).cardColor,
                elevation: Theme.of(context).brightness == Brightness.light ? 4.0 : 0.0,
                child: TabBar(
                  indicatorColor: Colors.white,
                  tabs: [
                    _tab(AppStrings.vaultDaily),
                    _tab(AppStrings.vaultWeekly),
                    _tab(AppStrings.vaultSpecial),
                    _tab(AppStrings.vaultShop),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<WizardsVaultBloc, WizardsVaultState>(
                  builder: (context, state) {
                    if (state is ErrorWizardsVaultState) {
                      return Center(
                        child: CompanionError(
                          title: AppStrings.theWizardsVault,
                          onTryAgain: () =>
                            BlocProvider.of<WizardsVaultBloc>(context).add(LoadWizardsVaultEvent()),
                        ),
                      );
                    }

                    if (state is LoadedWizardsVaultState) {
                      return TabBarView(
                        children: <Widget>[
                          _ObjectivesTab(season: state.data.season, group: state.data.daily),
                          _ObjectivesTab(season: state.data.season, group: state.data.weekly),
                          _ObjectivesTab(season: state.data.season, group: state.data.special),
                          _ShopTab(season: state.data.season, listings: state.data.listings),
                        ],
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tab(String text) => Tab(
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16.0
      ),
    ),
  );
}

Future<void> _refresh(BuildContext context) async {
  BlocProvider.of<WizardsVaultBloc>(context).add(LoadWizardsVaultEvent());
  await Future.delayed(Duration(milliseconds: 200), () {});
}

class _SeasonCard extends StatelessWidget {
  final WizardsVaultSeason season;

  _SeasonCard({@required this.season});

  @override
  Widget build(BuildContext context) {
    if (season == null || season.title == null) {
      return Container();
    }

    return CompanionCard(
      child: Column(
        children: <Widget>[
          Text(
            season.title,
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
          if (season.end != null)
            Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Text(
                AppStrings.vaultSeasonEnds(_formatDate(season.end.toLocal())),
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) =>
    '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
}

class _ObjectivesTab extends StatelessWidget {
  final WizardsVaultSeason season;
  final WizardsVaultObjectiveGroup group;

  _ObjectivesTab({@required this.season, @required this.group});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Theme.of(context).accentColor,
      color: Theme.of(context).cardColor,
      onRefresh: () => _refresh(context),
      child: CompanionListView(
        children: <Widget>[
          _SeasonCard(season: season),
          // The special objectives have no reward for completing all of them
          if (group.metaProgressComplete > 0)
            _MetaCard(group: group),
          ...group.objectives.map((o) => _ObjectiveCard(objective: o)),
        ],
      ),
    );
  }
}

class _MetaCard extends StatelessWidget {
  final WizardsVaultObjectiveGroup group;

  _MetaCard({@required this.group});

  @override
  Widget build(BuildContext context) {
    return CompanionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  AppStrings.vaultCompleteAll,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              if (group.metaRewardClaimed)
                Icon(Icons.check_circle, color: Colors.green, size: 20.0)
              else
                Text(
                  '${group.metaProgressCurrent} / ${group.metaProgressComplete}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 6.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: LinearProgressIndicator(
                value: _progress(group.metaProgressCurrent, group.metaProgressComplete),
                minHeight: 8.0,
              ),
            ),
          ),
          if (group.metaRewardAstral > 0)
            Padding(
              padding: EdgeInsets.only(top: 6.0),
              child: Text(
                AppStrings.vaultAcclaim(group.metaRewardAstral, claimed: group.metaRewardClaimed),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
        ],
      ),
    );
  }
}

class _ObjectiveCard extends StatelessWidget {
  final WizardsVaultObjective objective;

  _ObjectiveCard({@required this.objective});

  @override
  Widget build(BuildContext context) {
    return CompanionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Text(
                  objective.title ?? '',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              if (objective.claimed)
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.check_circle, color: Colors.green, size: 20.0),
                ),
            ],
          ),
          // Some objectives have no amount to count
          if (objective.progressComplete > 0)
            Padding(
              padding: EdgeInsets.only(top: 6.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: LinearProgressIndicator(
                  value: _progress(objective.progressCurrent, objective.progressComplete),
                  minHeight: 8.0,
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(top: 6.0),
            child: Row(
              children: <Widget>[
                _TrackChip(track: objective.track),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      AppStrings.vaultAcclaim(objective.acclaim),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                if (objective.progressComplete > 0)
                  Text(
                    '${GuildWarsUtil.intToString(objective.progressCurrent)} / ${GuildWarsUtil.intToString(objective.progressComplete)}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TrackChip extends StatelessWidget {
  final String track;

  _TrackChip({@required this.track});

  @override
  Widget build(BuildContext context) {
    if (track == null) {
      return Container();
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: _color(),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        track,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Color _color() {
    switch (track) {
      case 'PvP':
        return Colors.blue;
      case 'WvW':
        return Colors.red[600];
      default:
        return Colors.green[600];
    }
  }
}

class _ShopTab extends StatelessWidget {
  final WizardsVaultSeason season;
  final List<WizardsVaultListing> listings;

  _ShopTab({@required this.season, @required this.listings});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Theme.of(context).accentColor,
      color: Theme.of(context).cardColor,
      onRefresh: () => _refresh(context),
      child: CompanionListView(
        children: <Widget>[
          _SeasonCard(season: season),
          ..._section(context, 'Featured', AppStrings.vaultFeatured),
          ..._section(context, 'Normal', AppStrings.vaultNormal),
          ..._section(context, 'Legacy', AppStrings.vaultLegacy),
        ],
      ),
    );
  }

  List<Widget> _section(BuildContext context, String type, String title) {
    // What can still be bought comes first
    final List<WizardsVaultListing> section = [
      ...listings.where((l) => l.type == type && !l.soldOut),
      ...listings.where((l) => l.type == type && l.soldOut),
    ];

    if (section.isEmpty) {
      return [];
    }

    return [
      Padding(
        padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 4.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      ...section.map((l) => _ListingCard(listing: l)),
    ];
  }
}

class _ListingCard extends StatelessWidget {
  final WizardsVaultListing listing;

  _ListingCard({@required this.listing});

  @override
  Widget build(BuildContext context) {
    final String name = listing.item != null ? listing.item.name : '#${listing.itemId}';

    return Opacity(
      opacity: listing.soldOut ? 0.5 : 1.0,
      child: CompanionCard(
      child: Row(
        children: <Widget>[
          Container(
            height: 48.0,
            width: 48.0,
            child: listing.item != null && listing.item.icon != null
              ? CompanionCachedImage(
                  imageUrl: listing.item.icon,
                  color: Theme.of(context).textTheme.bodyText1.color,
                  iconSize: 24.0,
                  fit: BoxFit.contain,
                )
              : null,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    listing.itemCount > 1 ? '$name x${listing.itemCount}' : name,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  if (listing.purchased > 0 || listing.purchaseLimit != null)
                    Text(
                      AppStrings.vaultPurchased(listing.purchased, listing.purchaseLimit),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                ],
              ),
            ),
          ),
          Text(
            AppStrings.vaultCost(listing.cost),
            style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
      ),
    );
  }
}

double _progress(int current, int complete) {
  if (complete == null || complete <= 0 || current == null) {
    return 0.0;
  }

  return (current / complete).clamp(0.0, 1.0).toDouble();
}
