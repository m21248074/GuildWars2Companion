import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guildwars2_companion/core/localization/strings.dart';
import 'package:guildwars2_companion/core/utils/assets.dart';
import 'package:guildwars2_companion/core/widgets/button.dart';
import 'package:guildwars2_companion/features/strike_mission/bloc/bloc.dart';
import 'package:guildwars2_companion/features/strike_mission/pages/strike_missions.dart';

class StrikeMissionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CompanionButton(
      color: Colors.teal,
      title: AppStrings.strikeMissions,
      onTap: () {
        BlocProvider.of<StrikeMissionBloc>(context).add(LoadStrikeMissionsEvent());
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => StrikeMissionsPage()
        ));
      },
      leading: Image.asset(Assets.buttonHeaderStrikeMissions),
    );
  }
}
