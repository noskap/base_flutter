import 'package:flutter/foundation.dart';
import 'package:bingus_bongus/common/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StorageService {
  Future<void> init() async {
    StorageService().registerAdapters();
    await Hive.openBox(BingusBongusHiveBoxes.defaultBox.path);
  }

  // Future<Box<OtpAuthenticateResponseDto>> _getAuthBox() async {
  //   Box<OtpAuthenticateResponseDto> box = await Hive.openBox(BingusBongusHiveBoxes.auth.path);
  //   return box;
  // }

  Box _getDefaultBox() {
    return Hive.box(BingusBongusHiveBoxes.defaultBox.path);
  }

  T _get<T>(String path) {
    Box box = _getDefaultBox();
    return box.get(path);
  }

  Future<void> _put(String path, dynamic value) {
    Box box = _getDefaultBox();
    return box.put(path, value);
  }

  // Future<OtpRequestDto> saveAuth(OtpRequestDto auth) async {
  //   await _put(HiveFields.auth.name, auth);
  //   return auth;
  // }

  // Future<void> saveAuthToken(OtpAuthenticateResponseDto auth) async {
  //   Box box = await _getAuthBox();
  //   await box.put(HiveFields.auth.name, auth);
  //   return;
  // }

  // OtpRequestDto? getAuth() {
  //   return _get<OtpRequestDto>(HiveFields.auth.name);
  // }
  //
  // Future<OtpAuthenticateResponseDto?> getAuthToken() async {
  //   Box<OtpAuthenticateResponseDto> box = await _getAuthBox();
  //   return box.get(HiveFields.auth.name);
  // }

  Future<void> clearAuth() async {
    await _getDefaultBox().clear();
    // (await _getAuthBox())..clear();
  }

  void registerAdapters() {
    for (BingusBongusAdapter adapter in BingusBongusConstants.HiveAdapters) {
      if (kDebugMode) {
        print('registering adapter: ${adapter.name}');
      }
    }
  }
}
