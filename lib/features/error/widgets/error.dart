import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guildwars2_companion/core/widgets/simple_button.dart';
import 'package:guildwars2_companion/core/localization/strings.dart';

class CompanionError extends StatelessWidget {
  final String title;
  final VoidCallback onTryAgain;

  CompanionError({
    @required this.title,
    @required this.onTryAgain
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(FontAwesomeIcons.frown, size: 64.0,),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            AppStrings.somethingWentWrongWhileLoading(title),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            AppStrings.checkInternetConnection,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: CompanionSimpleButton(
            text: AppStrings.tryAgain,
            onPressed: () => onTryAgain(),
          ),
        )
      ],
    );
  }
}