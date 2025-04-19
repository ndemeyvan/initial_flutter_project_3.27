import 'dart:async';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logging/logging.dart';
import 'package:maliya_mobile/1_share/business_logic/language_bloc.dart';
import 'package:maliya_mobile/1_share/data/config/app_config.dart';
import 'package:maliya_mobile/1_share/data/config/remote_local_loader.dart';
import 'package:maliya_mobile/1_share/locator_service.dart';
import 'package:maliya_mobile/utils/app_bloc_observer.dart';
import 'package:maliya_mobile/utils/app_storage.dart';
import 'package:maliya_mobile/utils/utils_helper.dart';
import 'package:path_provider/path_provider.dart';

/// Bootstrap is responsible for any common setup and calls
/// [runApp] with the widget returned by [builder] in an error zone.3
Future<void> bootstrap({
  required FutureOr<Widget> Function(
    LanguageBloc languageBloc,
  ) builder,
  required String envFile,
  required AppEnv env,
}) async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // await Firebase.initializeApp(
      //   options: DefaultFirebaseOptions.currentPlatform,
      // );

      // Fonts license
      LicenseRegistry.addLicense(() async* {
        final license = await rootBundle.loadString('assets/fonts/OFL.txt');
        yield LicenseEntryWithLineBreaks(['assets/fonts'], license);
      });

      await Future.delayed(Duration(milliseconds: 100));

      // Ensure storage is ready
      await GetStorage.init();
      await EasyLocalization.ensureInitialized();

      await AppConfig.getSecureStorage().delete(key: "token");

      await ScreenUtil.ensureScreenSize();

      // load config
      AppConfig.instance.init(
        env: env,
      );

      EasyLocalization.logger.enableBuildModes = [];

      // bloc observer
      Bloc.observer = AppBlocObserver();


      // // bloc local storage
      final storage = await HydratedStorage.build(
        storageDirectory: kIsWeb
            ? HydratedStorage.webStorageDirectory
            : await getTemporaryDirectory(),
      );

      HydratedBloc.storage = storage;
      // Initialize the app storage
      await AppStorage.openAppStorage();
      //
      setupLocator();

      // LanguageBloc languageBloc = LanguageBloc();

      _setupLogging();

      // Set the ErrorWidget's builder before the app is started.
      ErrorWidget.builder = (FlutterErrorDetails details) {
        // If we're in debug mode, use the normal error widget which shows the error
        // message:
        if (kDebugMode) {
          return ErrorWidget(details.exception);
        }
        // In release builds, show a yellow-on-blue message instead:

        return Material(
          color: Colors.transparent,
          child: Text(
            '${UtilsHelper.trans("an_error_occured")}',
            style: const TextStyle(color: Colors.yellow),
            textAlign: TextAlign.center,
          ),
        );

      };

      runApp(EasyLocalization(
        supportedLocales: [
          Locale('en'),
          Locale('fr'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        assetLoader: const RemoteLocalesLoader(),
        child: await builder(
          getIt<LanguageBloc>(),
        ),
      ));
    },
    (Object error, StackTrace stackTrace) async {
      final String errorAndTrace =
          "${error.toString()} '\n' ${stackTrace.toString()}";
      print(errorAndTrace);
    },
  );
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    log('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
