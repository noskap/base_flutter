import 'package:hive_flutter/hive_flutter.dart';

enum BingusBongusHiveBoxes {
  defaultBox('default');

  const BingusBongusHiveBoxes(this.path);

  final String path;

  @override
  String toString() => path;
}

class StorageService {
  Future<void> init() async {
    // StorageService().registerAdapters();
    await Hive.openBox(BingusBongusHiveBoxes.defaultBox.path);
  }

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

  // Future<void> saveChannel(String app) async {
  //   await _put('app', app);
  //   return;
  // }
  //
  // String? getChannel() {
  //   return _get<String?>('app');
  // }
//
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
}
