import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:starter_kit/app/app.module.dart';
import 'package:starter_kit/app/app.view.dart';
import 'package:starter_kit/config/application.dart';
import 'package:starter_kit/utils/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Color.fromRGBO(0, 181, 156, 1),
    ),
  );
  await Future.wait([
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]),
  ]);
  Application.sharePreference = await SpUtil.getInstance();
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
