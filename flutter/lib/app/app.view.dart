import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:intl/intl.dart';
import 'package:starter_kit/config/application.dart';
import 'package:starter_kit/config/locale.dart';
import 'package:starter_kit/themes/theme.dart';
import 'package:starter_kit/utils/api.dart';
import 'package:starter_kit/utils/custom_toast.dart';

class AppWidget extends StatefulWidget {
  AppWidget() {
    Application.api = API();
    Application.toast = Toastify();
    Application.sharePreference.putString('locale', "vi_vn");
    Intl.defaultLocale = Application.sharePreference.getString('locale');
  }

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return I18n(
      initialLocale: AppLocale.locales[Application.sharePreference.getString('locale')],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          // FormBuilderLocalizations.delegate,
        ],
        supportedLocales: AppLocale.locales.values.toList(),
        locale: AppLocale.locales[Application.sharePreference.getString('locale')],
        theme: themeData,
        debugShowCheckedModeBanner: false,
      ).modular(),
    );
  }
}
