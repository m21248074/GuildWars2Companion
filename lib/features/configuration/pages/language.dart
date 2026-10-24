import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guildwars2_companion/core/widgets/accent.dart';
import 'package:guildwars2_companion/features/configuration/bloc/configuration_bloc.dart';
import 'package:guildwars2_companion/features/configuration/services/configuration.dart';
import 'package:guildwars2_companion/features/achievement/repositories/achievement.dart';
import 'package:guildwars2_companion/features/build/repositories/build.dart';
import 'package:guildwars2_companion/features/item/repositories/item.dart';
import 'package:guildwars2_companion/core/widgets/appbar.dart';
import 'package:guildwars2_companion/core/localization/strings.dart';

class LanguageConfigurationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CompanionAccent(
      lightColor: Colors.blue,
      child: Scaffold(
        appBar: CompanionAppBar(
          title: AppStrings.apiAndWikiLanguage,
          color: Colors.blue,
        ),
        body: BlocBuilder<ConfigurationBloc, ConfigurationState>(
          builder: (context, state) {
            List<_Language> languages = [
              _Language('English', 'en'),
              _Language('Español', 'es'),
              _Language('Deutsch', 'de'),
              _Language('Français', 'fr'),
              _Language('簡體中文', 'zh'),
              _Language('繁體中文', ConfigurationService.traditionalChinese),
            ];

            return ListView(
              children: languages
                .map((language) =>RadioListTile(
                  groupValue: state.configuration.language,
                  value: language.value,
                  title: Text(
                    language.name,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  onChanged: (lang) => _changeLanguageDialog(
                    context: context,
                    achievementRepository: RepositoryProvider.of<AchievementRepository>(context),
                    itemRepository: RepositoryProvider.of<ItemRepository>(context),
                    buildRepository: RepositoryProvider.of<BuildRepository>(context),
                    lang: lang
                  ),
                ))
                .toList(),
            );
          },
        ),
      ),
    );
  }

  _changeLanguageDialog({
    @required BuildContext context,
    @required AchievementRepository achievementRepository,
    @required ItemRepository itemRepository,
    @required BuildRepository buildRepository,
    @required String lang,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppStrings.changeLanguage),
          content: Text(
AppStrings.changeLanguageConfirmation
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                AppStrings.cancel,
                style: TextStyle(
                  fontSize: 18.0
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text(
                AppStrings.changeLanguage,
                style: TextStyle(
                  fontSize: 18.0
                ),
              ),
              onPressed: () async {
                BlocProvider.of<ConfigurationBloc>(context).add(ChangeLanguageEvent(language: lang));

                Navigator.of(context).pop();

                await achievementRepository.clearCache();
                await itemRepository.clearCache();
                await buildRepository.clearCache();
              },
            )
          ],
        );
      },
    );
  }
}

class _Language {
  final String name;
  final String value;

  _Language(this.name, this.value);
}