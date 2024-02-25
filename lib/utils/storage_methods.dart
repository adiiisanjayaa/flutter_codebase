import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageMethods {
  StorageMethods._privateConstructor();

  static final StorageMethods find = StorageMethods._privateConstructor();

  /// set data to local
  Future<bool?> setData(String? key, dynamic value) async {
    try {
      final SharedPreferences pref = Get.find<SharedPreferences>();
      String encodeData = "";
      encodeData = json.encode(value);
      final String jsonVal = encodeData;
      return pref.setString(key!, jsonVal);
    } catch (e, _) {
      log("error encode");
      try {
        // FirebaseCrashlytics.instance.recordError(e, s, reason: 'IDEAL: failed to set data SharedPreferences with key $key and value $value');
      } catch (_) {}
      return false;
    }
  }

  /// set bool to local
  Future<bool?> setBool(String? key, bool? value) async {
    final SharedPreferences pref = Get.find<SharedPreferences>();
    try {
      return await pref.setBool(key!, value!);
    } catch (e) {
      return false;
    }
  }

  /// remove data from local
  Future<bool?> remove(String? key) async {
    final SharedPreferences pref = Get.find<SharedPreferences>();
    try {
      return await pref.remove(key!);
    } catch (e) {
      return false;
    }
  }

  /// set data to local
  getData(String? key) {
    try {
      final SharedPreferences pref = Get.find<SharedPreferences>();
      final String? source = pref.getString(key!);
      if (source == null) return null;
      final map = json.decode(source);
      return map;
    } catch (e, _) {
      try {
        // FirebaseCrashlytics.instance.recordError(e, s, reason: 'IDEAL: failed to get data SharedPreferences with key $key');
      } catch (_) {}
    }
  }

  /// set bool to local
  bool getBool(String? key) {
    final SharedPreferences pref = Get.find<SharedPreferences>();
    try {
      return pref.getBool(key!) ?? false;
    } catch (e) {
      return false;
    }
  }
}
