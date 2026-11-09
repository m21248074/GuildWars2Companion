import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guildwars2_companion/core/utils/assets.dart';
import 'package:guildwars2_companion/core/localization/strings.dart';

class ErrorPage extends StatelessWidget {
  final String exception;

  ErrorPage({@required this.exception});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).primaryColor,
        systemNavigationBarIconBrightness: Brightness.light
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      Assets.tokenHeaderLogo,
                      height: 128.0,
                    ),
                    Container(height: 16),
                    Text(
                      AppStrings.errorLoadingApp,
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                    ),
                    Container(height: MediaQuery.of(context).size.height / 7),
                    Text(
                      AppStrings.errorSendLogHint,
                      style: Theme.of(context).textTheme.headline2.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Container(height: 16),
                    _CopyLogsButton(exception: exception)
                  ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CopyLogsButton extends StatelessWidget {
  final String exception;

  _CopyLogsButton({@required this.exception});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
        border: Border.all(
          color: Colors.white,
          width: 2
        )
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () async {
            await Clipboard.setData(ClipboardData(text: exception));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                AppStrings.errorLogCopied,
                style: Theme.of(context).textTheme.headline2.copyWith(color: Colors.white)
              ),
              backgroundColor: Colors.green,
            ));
          },
          child: Container(
            height: 48,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              AppStrings.copyErrorLog,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              )
            ),
          ),
        ),
      ),
    );
  }
}