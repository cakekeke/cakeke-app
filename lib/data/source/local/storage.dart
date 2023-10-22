import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static const _storage = FlutterSecureStorage();

  static void write(String key, String value) async =>
      await _storage.write(key: key, value: value);

  static Future<String?> read(String key) async =>
      await _storage.read(key: key);

  static Future<bool> containsKey(String key) async =>
      await _storage.containsKey(key: key);

  static void delete(String key) async => await _storage.delete(key: key);

  static void deleteAll() async => await _storage.deleteAll();

  static const String accessToken = "access_token";
  static const String id = "id";
  static const String password = "password";
}
