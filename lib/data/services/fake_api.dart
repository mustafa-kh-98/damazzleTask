import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FakeApi extends GetxService {
  Future<dynamic> loadJsonData(String path) async {
    try {
      String jsonString = await rootBundle.loadString(path);
      return jsonDecode(jsonString);
    } catch (e) {
      rethrow;
    }
  }
}
