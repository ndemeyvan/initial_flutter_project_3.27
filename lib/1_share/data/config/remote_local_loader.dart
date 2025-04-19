import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:maliya_mobile/1_share/data/config/app_config.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
///
/// default used is RemoteLocalLoader which uses flutter's assetloader
///
class RemoteLocalesLoader extends AssetLoader {
  const RemoteLocalesLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) async {
    try {
      var key = AppConfig.LOCO_KEY;
      var cacheDir = await getTemporaryDirectory();
      Dio dio = Dio(
        BaseOptions(
          headers: {
            "Authorization": "Loco $key",
          },
          connectTimeout: Duration(seconds: 3), // 60 seconds
          receiveTimeout: Duration(seconds: 3),
        ),
      )..interceptors.addAll([
          DioCacheInterceptor(
            options: CacheOptions(
              store: HiveCacheStore(
                cacheDir.path,
                hiveBoxName: "neero_locales",
              ),
              policy: CachePolicy.refreshForceCache,
              hitCacheOnErrorExcept: [],
              maxStale: const Duration(
                days: 30,
              ), //increase number of days for loger cache
              priority: CachePriority.high,
            ),
          ),
        ]);
      var response = await dio.get("$path/${locale.languageCode}.json");
      return response.data as Map<String, dynamic>;
    } catch (e) {
      return RootBundleAssetLoader().load("assets/translations", locale);
    }
  }
}
