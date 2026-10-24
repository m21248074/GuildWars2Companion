import 'package:flutter/material.dart';
import 'package:guildwars2_companion/core/widgets/accent.dart';
import 'package:guildwars2_companion/core/widgets/appbar.dart';
import 'package:guildwars2_companion/features/event/widgets/notification_list.dart';
import 'package:guildwars2_companion/core/localization/strings.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CompanionAccent(
      lightColor: Colors.blue,
      child: Scaffold(
        appBar: CompanionAppBar(
          title: AppStrings.scheduledNotifications,
          color: Colors.blue,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                EventNotificationList(),
              ],
            ),
          ),
        )
      ),
    );
  }
}