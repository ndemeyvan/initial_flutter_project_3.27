

import 'package:maliya_mobile/1_share/data/config/app_config.dart';
import 'package:maliya_mobile/application.dart';
import 'package:maliya_mobile/bootstrap.dart';

void main() async {
  await bootstrap(
    builder: (bloc) => Application(),
    env: AppEnv.DEV,
    envFile: ".dev.env",
  );
}
