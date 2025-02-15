import 'dart:async';

import 'package:damazsle/data/constants/end_points.dart';
import 'package:damazsle/data/helper/request.dart';
import 'package:damazsle/data/helper/response_model.dart';
import 'package:damazsle/data/utils/queue.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;

import '../helper/api_error.dart';
import '../helper/exceptions.dart';
import 'api_interceptor.dart';

class APIService extends GetxService {
  //=========== CONFIGURATION ===========
  late Map<String, dynamic> _headers;
  late Dio _dio;

  APIService({
    Map<String, dynamic>? headers,
    String? token,
    String? language,
  }) {
    _headers = headers ?? {};
    if (token != null) {
      _headers["Authorization"] = "Bearer $token";
    }
    if (language != null) {
      _headers["Accept-Language"] = language;
    }
    _dio = Dio();
    _dio.options = BaseOptions(
      headers: _headers,
      responseType: ResponseType.json,
    );
    _dio.interceptors.add(ApiInterceptor());
  }

  // ===================== PRIORITY QUEUE ===================
  ///Queue that listed requested api's
  final PriorityQueue _queue = PriorityQueue();

  ///Get all pending requests in the queue
  List<Request> get pendingsApis =>
      _queue.queue.where((e) => e.isPending).toList();

  ///Get all requested and not ended api's in the queue
  List<Request> get currentApis =>
      _queue.queue.where((e) => e.isLoading).toList();

  ///Add [Request] to our [PriorityQueue]
  ///you can use the listener in this function that help you to listen on [Request] by its [RequestStatus]
  Future<ResponseModel> request({
    required Request request,
    bool forceRequest = false,
  }) async {
    if (forceRequest) return await request.request();
    _queue.add(request);
    Completer<ResponseModel> completer = Completer<ResponseModel>();
    Worker worker = ever<RequestStatus>(request.status, (status) {
      if (status == RequestStatus.done) {
        _queueRefresh();
        completer.complete(request.response);
      }
      _queue.queueLog();
    });
    _queueRefresh(forceRequest: forceRequest);
    ResponseModel response = await completer.future;
    worker.dispose();
    return response;
  }

  _queueRefresh({bool forceRequest = false}) {
    _queue.refresh();
    if (currentApis.isEmpty && pendingsApis.isEmpty) {
      return;
    } else if (forceRequest || currentApis.isEmpty) {
      List<Request> requests = _queue.pop();
      for (var element in requests) {
        element.status.value = RequestStatus.loading;
        element.request();
      }
    }
  }

  //============== API Methods ================

  ///Get method
  Future<ResponseModel> getData(
    String url, {
    bool isFullURL = false,
    Map<String, dynamic>? param,
    Map<String, dynamic>? header,
    Map<String, dynamic>? copyHeader,
    Function(int count, int total)? onReceiveProgress,
    required CancelToken cancelToken,
  }) async {
    String fullEndPoint = isFullURL ? url : EndPoints.baseUrl + url;
    Response? response;
    ResponseModel responseModel;
    Map<String, dynamic> requestHeader = header ?? _headers;
    if (copyHeader != null) {
      for (var key in copyHeader.keys) {
        requestHeader[key] = copyHeader[key];
      }
    }
    try {
      response = await _dio.get(
        fullEndPoint,
        options: Options(headers: requestHeader),
        queryParameters: param,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      responseModel = ResponseModel.fromJson(response.data);
    } on ModellingException catch (error) {
      responseModel = ResponseModel(
        success: false,
        errorType: ModellingError(),
        message: error.message,
      );
    } on DioResponseException catch (e) {
      responseModel = e.responseModel!;
    } catch (e) {
      responseModel =
          ResponseModel(success: false, data: e, message: 'some error')
            ..statusCode = 0;
    }
    return responseModel;
  }

  ///Post method
  Future<ResponseModel> postData(
    String url, {
    bool isFullURL = false,
    Map<String, dynamic>? header,
    Map<String, dynamic>? copyHeader,
    Map<String, dynamic>? param,
    Function(int count, int total)? onReceiveProgress,
    Function(int count, int total)? onSendProgress,
    var body,
    required CancelToken cancelToken,
  }) async {
    String fullEndPoint = isFullURL ? url : EndPoints.baseUrl + url;
    Response? response;
    ResponseModel responseModel;
    Map<String, dynamic> requestHeader = header ?? _headers;
    if (copyHeader != null) {
      for (var key in copyHeader.keys) {
        requestHeader[key] = copyHeader[key];
      }
    }
    try {
      response = await _dio.post(
        fullEndPoint,
        options: Options(headers: requestHeader),
        data: body,
        queryParameters: param,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      responseModel = ResponseModel.fromJson(response.data);
    } on ModellingException catch (error) {
      responseModel = ResponseModel(
          success: false, errorType: ModellingError(), message: error.message);
    } on DioResponseException catch (e) {
      responseModel = e.responseModel!;
    } catch (e) {
      responseModel =
          ResponseModel(success: false, data: e, message: 'some error')
            ..statusCode = 0;
    }
    return responseModel;
  }

  stop(Request request) {
    if (request.isPending) {
      request.response = ResponseModel(
        success: false,
        message: 'Canceled',
        errorType: CANCELED(),
      );
      _queue.queue.remove(request);
      request.status.value = RequestStatus.done;
    } else {
      request.cancelToken.cancel();
    }
  }
}
