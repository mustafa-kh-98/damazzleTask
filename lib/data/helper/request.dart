// ignore_for_file: constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../services/api_service.dart';
import '../utils/parser.dart';
import 'response_model.dart';

enum RequestMethod {
  Get,
  Post,
}

enum RequestStatus { pending, loading, done }

enum RequestPriority { low, mid, high }

enum RequestType { normal, latest, first }

class Request<T> {
  ///Type of request [RequestMethod]
  RequestMethod method;

  ///Api end point
  String endPoint;

  ///Is the end point has the base url or not
  bool isFullURL;

  ///Priority of the request
  RequestPriority priority;

  ///force request
  bool forceRequest;

  ///Type of request that indicate if request can be executed multiple time [RequestMethod.normal] which it is the default
  ///[RequestMethod.latest] will cancel any previous api with same end point in the queue
  ///[RequestMethod.first] will cancel any coming api if there is an api with the same end point in the queue
  RequestType type;

  ///Used for deactivate request
  late CancelToken cancelToken;

  ///Custom header
  Map<String, dynamic>? header;

  ///Copy header
  Map<String, dynamic>? copyHeader;

  ///Request params
  Map<String, dynamic>? params;

  ///Body of the Request
  var body;

  ///Response of this request
  ResponseModel? response;

  ///Listener for receiving data
  Function(int count, int total)? onReceiveProgress;

  ///Status of request in queue
  Rx<RequestStatus> status = RequestStatus.pending.obs;

  bool get isPending => status.value == RequestStatus.pending;

  bool get isLoading => status.value == RequestStatus.loading;

  bool get isDone => status.value == RequestStatus.done;

  ///Optional Modelling
  final T Function(Map<String, dynamic> json)? fromJson;

  Request({
    required this.endPoint,
    this.isFullURL = false,
    this.method = RequestMethod.Get,
    this.priority = RequestPriority.mid,
    this.forceRequest = false,
    this.type = RequestType.normal,
    this.header,
    this.copyHeader,
    this.params,
    this.body,
    cancelToken,
    this.fromJson,
    this.onReceiveProgress,
  }) {
    if (cancelToken == null) {
      this.cancelToken = CancelToken();
    } else {
      this.cancelToken = cancelToken;
    }
  }

  ///Used by [APIService] to perform request
  Future<ResponseModel> request() async {
    APIService service = Get.find();
    switch (method) {
      case RequestMethod.Get:
        response = await service.getData(
          endPoint,
          isFullURL: isFullURL,
          header: header,
          copyHeader: copyHeader,
          param: params,
          cancelToken: cancelToken,
        );
        break;
      case RequestMethod.Post:
        response = await service.postData(
          endPoint,
          isFullURL: isFullURL,
          header: header,
          copyHeader: copyHeader,
          param: params,
          body: body,
          cancelToken: cancelToken,
        );
        break;
    }
    status.value = RequestStatus.done;
    if (fromJson != null && response!.success) {
      dynamic parsedData = Parser.parsingData(
        response!.data!,
        (json) => fromJson!(json),
      );
      response!.data = parsedData ?? response!.data;
    }
    return response!;
  }

  stop() {
    Get.find<APIService>().stop(this);
  }

}
