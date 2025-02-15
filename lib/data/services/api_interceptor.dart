import 'dart:developer';

import 'package:damazsle/data/helper/response_model.dart';
import 'package:dio/dio.dart';

import '../helper/api_error.dart';
import 'fake_api.dart';

class ApiInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    log('############# 🔵API Interceptor ###############\n',
        name: "API Interceptor");
    log('Method ${options.method}', name: "API Interceptor");
    log('Requesting ${options.uri}', name: "API Interceptor");
    log('Headers    ${options.headers.toString()}', name: "API Interceptor");
    log(
      'Params     ${options.queryParameters.toString()}',
      name: "API Interceptor",
    );
    if (options.data is FormData) {
      log('Body files:       ${options.data.files}', name: "API Interceptor");
      log('Body fields:      ${options.data.fields}', name: "API Interceptor");
    } else {
      log('Body       ${options.data.toString()}', name: "API Interceptor");
    }
    log('\n#########################################', name: "API Interceptor");
    if (options.uri.path.contains("assets/apis")) {
      try {
        await Future.delayed(const Duration(seconds: 3));
        final FakeApi fakeApi = FakeApi();
        final data =await fakeApi.loadJsonData(options.uri.path);
        ResponseModel  responseModel = ResponseModel(
          success: true,
          message: "",
          data: data["data"],
        );
        Response fakeResponse = Response(
          requestOptions: options,
          data: responseModel.toJson(),
          statusCode: 200,
        );
        return handler.resolve(fakeResponse);
      } catch (e) {
        return handler.reject(
          DioResponseException(
            responseModel: ResponseModel(
              success: false,
              message: e.toString(),
              errorType: NO_INTERNET(),
            ),
            requestOptions: options,
          ),
        );
      }
    } else {
      return handler.next(options);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('############# 🟢 API Service ###############\n',
        name: "API Interceptor");
    log('Response of ${response.realUri}', name: "API Interceptor");
    log(response.data.toString(), name: "API SERVICE");
    log('\n#########################################', name: "API Interceptor");
    ResponseModel responseModel;
    switch (response.statusCode) {
      case 200:
      case 201:
        if (response.data is Map<String, dynamic> &&
            response.data.containsKey("data")) {
          response.data = response.data["data"];
        }
        responseModel = ResponseModel(
          success: true,
          message: "",
          data: response.data,
        );
        break;
      case 204:
        return handler.reject(
          DioResponseException(
            requestOptions: response.requestOptions,
            responseModel: ResponseModel(
              success: false,
              message: "No Data",
              errorType: NO_CONTENT(),
            ),
          ),
        );
      default:
        if (response.data is Map<String, dynamic> &&
            response.data.containsKey("data")) {
          response.data = response.data["data"];
        }
        responseModel = ResponseModel(
          success: true,
          message: "",
          data: response.data,
        );
        break;
    }
    response.data = responseModel.toJson();
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    DioResponseException resError = DioResponseException(
      requestOptions: err.requestOptions,
      responseModel: null,
    );
    log(
      '############# 🔴 API Interceptor ###############\n',
      name: "API Interceptor",
    );
    log('Error ${err.message}', name: "API Interceptor");
    log('\n#########################################', name: "API Interceptor");
    if (err.type == DioExceptionType.badResponse && err.response != null) {
      switch (err.response!.statusCode) {
        case 401:
          resError = resError.copy(
            responseModel: ResponseModel(
              success: false,
              statusCode: 401,
              message: 'No Auth',
              errorType: UN_AUTHORIZED(),
            ),
          );
          break;
        case 403:
          resError = resError.copy(
            responseModel: ResponseModel(
              success: false,
              statusCode: 403,
              message: 'Forbidden',
              errorType: FORBIDDEN(),
            ),
          );
          break;
        case 500:
          resError = resError.copy(
            responseModel: ResponseModel(
              success: false,
              errorType: SERVER_ERROR(),
              statusCode: 500,
              message: 'Server Error',
            ),
          );
          break;
        default:
          resError = resError.copy(
            responseModel: ResponseModel(
              success: false,
              message: "OTHER",
              errorType: OTHER(),
              statusCode: err.response?.statusCode ?? 0,
              data: err.response?.data,
            ),
          );
          break;
      }
    } else {
      switch (err.type) {
        case DioExceptionType.badCertificate:
        case DioExceptionType.unknown:
        case DioExceptionType.connectionError:
        case DioExceptionType.connectionTimeout:
          resError = resError.copy(
            responseModel: ResponseModel(
              success: false,
              message: 'No Internet',
              errorType: NO_INTERNET(),
            ),
          );
          break;
        case DioExceptionType.receiveTimeout:
          resError = resError.copy(
            responseModel: ResponseModel(
              success: false,
              message: 'No Internet',
              errorType: RECIEVE_TIMEOUT(),
            ),
          );
          break;
        case DioExceptionType.sendTimeout:
          resError = resError.copy(
            responseModel: ResponseModel(
              success: false,
              message: 'No Internet',
              errorType: SEND_TIMEOUT(),
            ),
          );
          break;
        case DioExceptionType.cancel:
          resError = resError.copy(
            responseModel: ResponseModel(
              success: false,
              errorType: CANCELED(),
              message: 'Request Canceled',
            ),
          );
          break;
        default:
          resError = resError.copy(
            responseModel: ResponseModel(
              success: false,
              message: 'Unhandled Error',
              errorType: OTHER(),
            ),
          );
          break;
      }
    }

    handler.next(resError);
  }
}

class DioResponseException extends DioException {
  final ResponseModel? responseModel;

  DioResponseException({
    required super.requestOptions,
    required this.responseModel,
  });

  DioResponseException copy({
    ResponseModel? responseModel,
  }) {
    return DioResponseException(
      requestOptions: requestOptions,
      responseModel: responseModel ?? this.responseModel,
    );
  }
}
