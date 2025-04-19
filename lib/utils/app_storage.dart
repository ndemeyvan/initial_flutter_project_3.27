import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:maliya_mobile/1_share/data/model/device.dart';
import 'package:maliya_mobile/1_share/data/model/pending_task.dart';

import 'package:path_provider/path_provider.dart';

class AppStorage {
  /// Initialize the Hive storage
  static Future<void> openAppStorage() async {
    await Hive.initFlutter();
    Hive
      ..registerAdapter(DeviceAdapter())
      ..registerAdapter(PendingTaskAdapter());
    await openHiveBox<dynamic>(BoxName.user);
    await createAndOpenEncryptedBox<dynamic>();
    await openHiveBox<Device>(BoxName.device);
    await openHiveBox<PendingTask>(BoxName.pendingTask);
  }

  static T? get<T>(dynamic key, {T? defaultValue}) {
    final box = Hive.box<dynamic>(BoxName.user);
    return box.get(key, defaultValue: defaultValue) as T?;
  }

  static void save<T>(dynamic key, T value) {
    Hive.box<dynamic>(BoxName.user).put(key, value);
  }

  static void delete(dynamic key) {
    Hive.box<dynamic>(BoxName.user).delete(key);
  }

  static void deleteAll(Iterable<dynamic> keys) {
    Hive.box<dynamic>(BoxName.user).deleteAll(keys);
  }

  static void clear<T>() {
    Hive.box<dynamic>(BoxName.user).clear();
  }

  // Secure storage to store sensitive information
  static void saveSecure<T>(dynamic key, T value) {
    Hive.box<dynamic>(BoxName.secured).put(key, value);
  }

  static T? getSecure<T>(String key) {
    return Hive.box<dynamic>(BoxName.secured).get(key) as T?;
  }

  static void deleteSecure(String key) {
    Hive.box<dynamic>(BoxName.secured).delete(key);
  }

  static void clearSecure() {
    Hive.box<dynamic>(BoxName.secured).clear();
  }

  static void saveUserDevice(Device device) {
    Hive.box<Device>(BoxName.device).add(device);
  }

  static Device? getUserDevice() {
    final box = Hive.box<Device>(BoxName.device);
    return box.values.firstOrNull;
  }

  static void savePendingTask(PendingTask value) {
    Hive.box<PendingTask>(BoxName.pendingTask).add(value);
  }

  static PendingTask? getPendingTask({String? taskName, String? processId}) {
    final box = Hive.box<PendingTask>(BoxName.pendingTask);
    return box.values.firstOrNull;
  }

  static void deletePendingTask(String taskName) {
    final box = Hive.box<PendingTask>(BoxName.pendingTask);

    final task = getPendingTask(taskName: taskName);
    if (task != null) {
      box.delete(task);
    }
  }
}

Future<void> openHiveBox<T>(String boxName,
    {HiveCipher? encryptionCipher, bool limit = false}) async {
  final box = await Hive.openBox<T>(boxName).onError(
    (error, stackTrace) async {
      final dir = await getApplicationDocumentsDirectory();
      final dirPath = dir.path;
      var dbFile = File('$dirPath/$boxName.hive');
      var lockFile = File('$dirPath/$boxName.lock');
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        dbFile = File('$dirPath/maliya/$boxName.hive');
        lockFile = File('$dirPath/maliya/$boxName.lock');
      }
      await dbFile.delete();
      await lockFile.delete();
      await Hive.openBox<T>(boxName, encryptionCipher: encryptionCipher);
      throw ArgumentError('Failed to open $boxName Box\nError: $error');
    },
  );
  // clear box if it grows large
  if (limit && box.length > 500) {
    await box.clear();
  }
}

// Storing sensitive information with encrypted boxes
Future<void> createAndOpenEncryptedBox<T>() async {
  try {
    const secureStorage = FlutterSecureStorage();
    final encryptionKeyString = await secureStorage.read(key: 'key');

    if (encryptionKeyString == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(key: 'key', value: base64UrlEncode(key));
    }

    final key = await secureStorage.read(key: 'key');
    final encryptionKey = base64Url.decode(key ?? '');

    await openHiveBox<T>(BoxName.secured,
        encryptionCipher: HiveAesCipher(encryptionKey));
  } catch (e) {
    log('Failed to create encrypted box');
    log(e.toString());
  }
}

class BoxName {
  static const String user = 'userBox';
  static const String secured = 'securedBox';
  static const String device = 'deviceBox';
  static const String pendingTask = 'pendingTaskBox';
}
