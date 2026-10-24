import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guildwars2_companion/features/event/models/event_segment.dart';
import 'package:guildwars2_companion/core/widgets/accent.dart';
import 'package:guildwars2_companion/core/widgets/appbar.dart';
import 'package:guildwars2_companion/core/widgets/tip.dart';
import 'package:guildwars2_companion/core/widgets/warning.dart';
import 'package:guildwars2_companion/features/event/models/notification.dart';
import 'package:guildwars2_companion/features/event/pages/schedule_notification_time.dart';
import 'package:guildwars2_companion/core/localization/strings.dart';

class ScheduleNotificationTypePage extends StatefulWidget {
  final MetaEventSegment segment;

  ScheduleNotificationTypePage({
    @required this.segment
  });

  @override
  _ScheduleNotificationTypePageState createState() => _ScheduleNotificationTypePageState();
}

class _ScheduleNotificationTypePageState extends State<ScheduleNotificationTypePage> {
  NotificationType _notificationType = NotificationType.SINGLE;

  @override
  Widget build(BuildContext context) {
    return CompanionAccent(
      lightColor: Colors.red,
      child: Scaffold(
        appBar: CompanionAppBar(
          title: AppStrings.chooseNotificationType,
          color: Colors.red,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...NotificationType.values
                  .map((e) => RadioListTile(
                    groupValue: _notificationType,
                    value: e,
                    title: Text(
                      e == NotificationType.DAILY ? AppStrings.dailyNotification : AppStrings.oneTimeNotification,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    subtitle: Text(
                      e == NotificationType.DAILY ? AppStrings.dailyNotificationExplanation : AppStrings.oneTimeNotificationExplanation,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onChanged: (t) => setState(() => _notificationType = t),
                  ))
                  .toList(),
                Container(height: 8.0,),
                CompanionTip(
                  tip: AppStrings.multipleNotificationsTip,
                ),
                CompanionWarning(
                  warning: AppStrings.oneTimeNotificationWarning,
                  ios: false,
                ),
                CompanionWarning(
                  warning: AppStrings.dailyNotificationWarning,
                  ios: false,
                )
              ],
            )
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ScheduleNotificationTimePage(
              segment: widget.segment,
              notificationType: _notificationType,
            )
          )),
          label: Text(
            AppStrings.next
          ),
          icon: Icon(
            FontAwesomeIcons.arrowRight,
            size: 20.0,
          ),
        ),
      ),
    );
  }
}