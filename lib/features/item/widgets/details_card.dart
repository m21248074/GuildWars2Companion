import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guildwars2_companion/core/widgets/info_card.dart';
import 'package:guildwars2_companion/core/widgets/info_row.dart';
import 'package:guildwars2_companion/features/item/enums/item_section.dart';
import 'package:guildwars2_companion/features/item/models/item.dart';
import 'package:guildwars2_companion/features/item/repositories/item.dart';
import 'package:guildwars2_companion/features/item/widgets/flags.dart';
import 'package:guildwars2_companion/core/localization/strings.dart';

class ItemDetailsCard extends StatelessWidget {
  final Item item;
  final ItemSection section;

  ItemDetailsCard({@required this.item, this.section = ItemSection.ALL});

  @override
  Widget build(BuildContext context) {
    if (item.details == null) {
      return CompanionInfoCard(
        title: AppStrings.stats,
        child: CompanionInfoRow(
          header: AppStrings.itemText('Rarity'),
          text: AppStrings.itemText(item.rarity)
        ),
      );
    }

    return CompanionInfoCard(
      title: AppStrings.stats,
      child: Column(
        children: [
          ...RepositoryProvider
            .of<ItemRepository>(context)
            .getItemDetails(item)
            .map((detail) => CompanionInfoRow(
              header: AppStrings.itemText(detail.title),
              text: detail.value,
            ))
            .toList(),
          if (item.type != 'Gathering')
            ItemFlags(
              flags: RepositoryProvider
                .of<ItemRepository>(context)
                .getFilteredFlags(item.flags, section)
            )
        ]
      ),
    );
  }
}