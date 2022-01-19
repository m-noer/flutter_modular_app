import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core/core.dart' as core;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular_app/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final prefs = core.sl<SharedPrefs>();

  @override
  Widget build(BuildContext context) {
    final isLogin = prefs.isKeyExists(KeyConstants.keyAccessToken);

    final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());

    String initialRoute() {
      if (isLogin) {
        return LoginPage.route;
      } else {
        return LoginPage.route;
      }
    }

    return GetMaterialApp(
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: localizedLabels.keys.first,
      supportedLocales: localizedLabels.keys.toList(),
      navigatorObservers: [routeObserver],
      initialRoute: initialRoute(),
      getPages: Routes.page.map((page) => page).toList(),
    );
  }
}
