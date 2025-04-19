

import 'package:maliya_mobile/1_share/business_logic/language_bloc.dart';
import 'package:maliya_mobile/1_share/data/config/app_config.dart';
import 'package:maliya_mobile/application.dart';
import 'package:maliya_mobile/bootstrap.dart';


void main() async {
  await bootstrap(
    builder: (LanguageBloc languageBloc) => Application(),
    env: AppEnv.PROD,
    envFile: ".env",
  );
}
