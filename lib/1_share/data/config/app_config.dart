import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maliya_mobile/1_share/data/model/language.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum AppEnv {
  DEV("dev"),
  PROD("dev"),
  STAGING("staging");

  const AppEnv(this.value);
  final String value;
}

class AppConfig {
  late AppEnv env;
    static const String BASE_URL = String.fromEnvironment(
    "BASE_URL",
    defaultValue: "https://keycloak.dev.neero.io",
  );

  static const String LOCO_KEY = String.fromEnvironment(
    "LOCO_KEY",
    defaultValue: "shBsxeI5dqgk2QtzLsWtB2oTNdDpWLgW",
  );


  static const String employeeGatewayUrl = "${BASE_URL}/employee-gateway";

  AppConfig._privateConstructor();

  static final AppConfig instance = AppConfig._privateConstructor();

  init({
    required AppEnv env,
  }) {
    instance.env = env;
  }

  factory AppConfig() {
    return instance;
  }

  static final FlutterSecureStorage _secureStorage = new FlutterSecureStorage();
  static final GetStorage _getStorage = new GetStorage();

  static final bool shuffleKeyboard = false;
  static PackageInfo? info;
  static final Duration localTransactionTimeoutDuration =
      Duration(seconds: 60 * 2 + 30);

  static final Language defaultLanguage =
      Language(languageCode: 'fr', countryCode: 'FR', name: 'French');

  static final List<Language> nrSupportedLanguageList = <Language>[
    Language(languageCode: 'en', countryCode: 'US', name: 'English'),
    Language(languageCode: 'fr', countryCode: 'FR', name: 'French'),
  ];

  static String translationAssetPath = 'https://localise.biz/api/export/locale';

  static FlutterSecureStorage getSecureStorage() {
    return _secureStorage;
  }

  static GetStorage getStorage() {
    return _getStorage;
  }
}
