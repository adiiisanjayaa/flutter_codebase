import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageMethods {
  StorageMethods._privateConstructor();

  static final StorageMethods find = StorageMethods._privateConstructor();

  /// set data to local
  Future<bool?> setData(String key, dynamic value) async {
    try {
      const storage = FlutterSecureStorage();
      String encodeData = "";
      encodeData = json.encode(value);
      final String jsonVal = encodeData;
      storage.write(key: key, value: jsonVal);
      return true;
    } catch (e) {
      log('Failed to set data : $e');
      return false;
    }
  }

  /// set bool to local
  Future<bool?> setBool(String key, bool value) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: key, value: value.toString());
      return true;
    } catch (e) {
      return false;
    }
  }

  /// remove data from local
  Future<bool?> remove(String key) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.delete(key: key);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// set data to local
  getData(String key) async {
    try {
      const storage = FlutterSecureStorage();
      final String? source = await storage.read(key: key);
      if (source == null) return null;
      // final map = json.decode(source);
      return source;
    } catch (e) {
      log('Failed to get data : $e');
    }
  }

  /// set bool to local
  bool getBool(String key) {
    try {
      const storage = FlutterSecureStorage();
      return storage.read(key: key).toString() == "true" ? true : false;
    } catch (e) {
      return false;
    }
  }
}
