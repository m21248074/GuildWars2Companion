import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guildwars2_companion/core/utils/assets.dart';
import 'package:guildwars2_companion/core/utils/urls.dart';
import 'package:guildwars2_companion/core/widgets/button.dart';
import 'package:guildwars2_companion/core/widgets/header.dart';
import 'package:guildwars2_companion/features/changelog/pages/changelog.dart';
import 'package:guildwars2_companion/features/configuration/pages/theme.dart';
import 'package:guildwars2_companion/features/configuration/pages/time.dart';
import 'package:package_info/package_info.dart';

import 'caching.dart';
import 'faq.dart';
import 'language.dart';
import 'notifications.dart';
import 'package:guildwars2_companion/core/localization/strings.dart';

class ConfigurationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CompanionHeader(
            color: Theme.of(context).scaffoldBackgroundColor,
            enforceColor: true,
            foregroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
            includeBack: true,
            includeShadow: false,
            child: Column(
              children: <Widget>[
                Image.asset(
                  Assets.appLogo,
                  width: 80.0,
                ),
                Container(height: 4.0,),
                Text(
                  'Guild Wars 2 Companion',
                  style: Theme.of(context).textTheme.headline1.copyWith(
                    color: Theme.of(context).textTheme.headline2.color,
                  )
                ),
                Text(
                  AppStrings.aboutAuthor,
                  style: Theme.of(context).textTheme.bodyText1
                ),
                _AppVersion()
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  child: Text(
                    AppStrings.thanksForEventTimers,
                    style: Theme.of(context).textTheme.bodyText1
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  child: Text(
                    '©2010–2018 ArenaNet, LLC. All rights reserved. Guild Wars, Guild Wars 2, Heart of Thorns, Guild Wars 2: Path of Fire, ArenaNet, NCSOFT, the Interlocking NC Logo, and all associated logos and designs are trademarks or registered trademarks of NCSOFT Corporation. All other trademarks are the property of their respective owners.',
                    style: Theme.of(context).textTheme.bodyText1
                  ),
                ),
                Container(height: 4.0,),
                CompanionButton(
                  title: AppStrings.theme,
                  color: Colors.blue,
                  leading: Icon(
                    FontAwesomeIcons.palette,
                    color: Colors.white,
                  ),
                  height: 64.0,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ThemeConfigurationPage()
                  )),
                ),
                CompanionButton(
                  title: AppStrings.scheduledNotifications,
                  color: Colors.blue,
                  leading: Icon(
                    FontAwesomeIcons.solidBell,
                    color: Colors.white,
                  ),
                  height: 64.0,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NotificationsPage()
                  )),
                ),
                CompanionButton(
                  title: AppStrings.apiAndWikiLanguage,
                  color: Colors.blue,
                  leading: Icon(
                    FontAwesomeIcons.globeEurope,
                    color: Colors.white,
                  ),
                  height: 64.0,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LanguageConfigurationPage()
                  )),
                ),
                CompanionButton(
                  title: AppStrings.timeNotation,
                  color: Colors.blue,
                  leading: Icon(
                    FontAwesomeIcons.clock,
                    color: Colors.white,
                  ),
                  height: 64.0,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TimeConfigurationPage()
                  )),
                ),
                CompanionButton(
                  title: AppStrings.caching,
                  color: Colors.blue,
                  leading: Icon(
                    FontAwesomeIcons.hourglassHalf,
                    color: Colors.white,
                  ),
                  height: 64.0,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CachingConfigurationPage()
                  )),
                ),
                CompanionButton(
                  title: AppStrings.faq,
                  color: Colors.blue,
                  leading: Icon(
                    FontAwesomeIcons.question,
                    color: Colors.white,
                  ),
                  height: 64.0,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FaqPage()
                  )),
                ),
                CompanionButton(
                  title: AppStrings.changelog,
                  color: Colors.blue,
                  leading: Icon(
                    FontAwesomeIcons.listOl,
                    color: Colors.white,
                  ),
                  height: 64.0,
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChangelogPage()
                  )),
                ),
                CompanionButton(
                  title: AppStrings.viewProjectOnGithub,
                  color: Colors.blue,
                  leading: Icon(
                    FontAwesomeIcons.github,
                    color: Colors.white,
                  ),
                  height: 64.0,
                  onTap: () => Urls.launchUrl(Urls.repositoryUrl),
                ),
                SafeArea(
                  top: false,
                  left: false,
                  right: false,
                  child: Container(height: 8.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppVersion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container();
        }

        if (!snapshot.hasData) {
          return Container(
            width: 32.0,
            height: 32.0,
            child: CircularProgressIndicator(),
          );
        }

        return Text(
          AppStrings.version(snapshot.data.version, snapshot.data.buildNumber),
          style: Theme.of(context).textTheme.bodyText1.copyWith(
            color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black
          )
        );
      },
    );
  }
}