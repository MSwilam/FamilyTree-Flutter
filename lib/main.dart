import 'dart:async';

import 'package:common_flutter/provider/commonCoreProvider.dart';
import 'package:common_flutter/services/ea_core.dart';
import 'package:family_tree/models/appSettings.dart';
import 'package:family_tree/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:common_flutter/api/notificationApi.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  EACore eaCore = EACore();
  // Provider.debugCheckInvalidValueType = null;

  await AppSettings.current.initialize();

  NotificationApi.init(initScheduled: false);

  eaCore.initialCore();
  await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/lang/',
  );

  // initGRPC();
  runApp(LocalizedApp(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return CommonCoreProvider();
      },
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        localizationsDelegates: translator.delegates,
        locale: translator.activeLocale,
        supportedLocales: translator.locals(),
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
