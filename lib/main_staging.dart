import 'dart:async';
import 'dart:developer';

import 'package:auth/auth.dart' as auth;
import 'package:bloc/bloc.dart';
import 'package:core/core.dart' as core;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular_app/presentation/app/app.dart';
import 'package:flutter_modular_app/presentation/app/app_bloc_observer.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared/shared.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background,
  // such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  log('Handling a background message ${message.messageId}', name: 'FIREBASE');
}

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      FlutterError.onError = (details) {
        log(details.exceptionAsString(), stackTrace: details.stack);
      };

      FlavorSettings.staging();

      await core.init();
      await auth.init();
      if (GetPlatform.isMobile || GetPlatform.isWeb) {
        await Firebase.initializeApp();

        /// Set the background messaging handler early on, as a named
        /// top-level function
        FirebaseMessaging.onBackgroundMessage(
            _firebaseMessagingBackgroundHandler);
      }

      await BlocOverrides.runZoned(
        () async => Sentry.init(
          (options) => options..dsn = EnvConfig.getInstance().apiSentry,
          appRunner: () => runApp(App()),
        ),
        blocObserver: AppBlocObserver(),
      );

      ///[console] flavor running
      if (!kReleaseMode) {
        final settings = EnvConfig.getInstance();
        log('🚀 APP FLAVOR NAME      : ${settings.flavorName}', name: 'ENV');
        log('🚀 APP API_BASE_URL     : ${settings.apiBaseUrl}', name: 'ENV');
        log('🚀 APP API_SENTRY       : ${settings.apiSentry}', name: 'ENV');
      }
    },
    (error, stackTrace) async {
      log(error.toString(), stackTrace: stackTrace);
      await Sentry.captureException(error, stackTrace: stackTrace);
    },
  );
}
