import 'package:flutter/material.dart';
import 'package:guildwars2_companion/core/widgets/accent.dart';
import 'package:guildwars2_companion/core/widgets/appbar.dart';
import 'package:guildwars2_companion/core/localization/strings.dart';

class FaqPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CompanionAccent(
      lightColor: Colors.blue,
      child: Scaffold(
        appBar: CompanionAppBar(
          title: AppStrings.faq,
          color: Colors.blue,
        ),
        body: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            Text(
              AppStrings.faqQuestion,
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              AppStrings.faqAnswer,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        )
      ),
    );
  }
}