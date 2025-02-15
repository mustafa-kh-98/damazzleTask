import 'dart:developer';

import 'package:get_storage/get_storage.dart';

class AppStorage {
  late GetStorage box;

  static final AppStorage _instance = AppStorage._internal();

  factory AppStorage() {
    return _instance;
  }

  AppStorage._internal();

  static bool _isInit = false;

  Future<void> initBox({required String target}) async {
    if (_isInit) return;
    box = GetStorage(target);
    bool init = await box.initStorage;
    log(":INIT $init:",name: "APP STORAGE");
    _isInit = true;
  }

  T? read<T>(String key) => box.read<T>(key);

  Future write<T>(String key, T value) => box.write(key, value);

  bool isHasData(String key) {
    return box.hasData(key);
  }

  Future remove(String key) => box.remove(key);

  Future removeAll() => box.erase();

  Future cashList(List<dynamic> data, storageKey) async {
    List<Map<String, dynamic>> toCash = [];
    for (var element in data) {
      toCash.add(element.toJson());
    }
    write(storageKey, toCash);
  }
}
