abstract class Parser {
  static parsingData<T>(
      var data, T Function(Map<String, dynamic> json) fromJson) {
    if (data is List) {
      List<T> parsed = <T>[];
      try {
        for (var json in data) {
          parsed.add(fromJson(json));
        }
        return parsed;
      } catch (e) {
        return [];
      }
    } else if (data is Map<String, dynamic>) {
      try {
        return fromJson(data);
      } catch (_) {
        return null;
      }
    } else {
      return null;
    }
  }
}
