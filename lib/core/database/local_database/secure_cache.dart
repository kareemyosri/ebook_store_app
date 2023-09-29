
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../enums.dart';

class FlutterSecureStorageCache {
  static FlutterSecureStorage? secureStorage;

  // Constructor for FlutterSecureStorage

  static FlutterSecureStorage init() {
    return secureStorage=  const FlutterSecureStorage();

  }

  static Future<void> write({required MySharedKeys key, required String? value}) async {
    await secureStorage?.write(key: key.name, value: value);
  }

  static Future<String?> read({required MySharedKeys key}) async {
    return await secureStorage?.read(key: key.name)?? "";
  }

  static Future<void> delete({required MySharedKeys key}) async {
    await secureStorage?.delete(key: key.name);
  }


}
