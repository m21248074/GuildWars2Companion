import 'package:flutter/material.dart';
import 'package:guildwars2_companion/core/utils/urls.dart';
import 'package:guildwars2_companion/core/widgets/appbar.dart';
import 'package:guildwars2_companion/core/widgets/simple_button.dart';
import 'package:guildwars2_companion/core/localization/strings.dart';

class HowToTokenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CompanionAppBar(
        title: AppStrings.howToGetApiKey,
        color: Colors.red,
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          Text(
            AppStrings.howToIntro,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Center(
            child: CompanionSimpleButton(
              text: 'account.arena.net/applications',
              onPressed: () => Urls.launchUrl('https://account.arena.net/applications'),
            ),
          ),
          Text(
            AppStrings.howToInstructions,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            AppStrings.howToStep1,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Container(height: 16.0,),
          Text(
            AppStrings.howToStep2,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            AppStrings.howToStep3,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            AppStrings.howToStep4,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Container(height: 16.0,),
          Text(
            AppStrings.howToStep5,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}