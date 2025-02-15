import 'api_error.dart';

class ResponseModel {
  late bool success;
  late String message;
  int? statusCode;
  APIError? errorType;
  var data;

  ResponseModel({
    required this.success,
    this.data,
    required this.message,
    this.errorType,
    this.statusCode,
  });

  ResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['status'] ?? false;
    message = '${json['message']}';
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['status_code'] = statusCode;
    data['data'] = this.data;
    data['message'] = message;
    data['code'] = errorType;
    return data;
  }
}