import 'dart:developer';

import 'package:get/get.dart';

import '../services/api_service.dart';
import '../helper/api_error.dart';
import '../helper/request.dart';
import '../helper/response_model.dart';

class PriorityQueue {
  List<Request> queue = [];

  ///Add a request to [queue] based on it's [RequestPriority]
  add(Request request) {
    if (queue.isEmpty) {
      queue.add(request);
      return;
    }
    if (request.type == RequestType.first) {
      request.response = ResponseModel(
        success: false,
        message: 'There is an api of the same end point executed',
        errorType: CANCELED(),
      );
      request.status.value = RequestStatus.done;
    } else if (request.type == RequestType.latest) {
      int index =
      queue.indexWhere((element) => element.endPoint == request.endPoint);
      if (index != -1) {
        Get.find<APIService>().stop(queue[index]);
      }
    }
    int index = queue.length - 1;
    for (int i = 0; i < queue.length; i++) {
      if (request.priority.index >= queue[i].priority.index) {
        index = i;
        break;
      }
    }
    queue.insert(index, request);
  }

  ///Get [List] of [Request] from the [queue] to be request from server.
  ///return the requests based on it's [RequestPriority].
  ///[RequestPriority.high] => [RequestPriority.mid] => [RequestPriority.low].
  List<Request> pop() {
    if (queue.isEmpty) return [];
    List<Request> requests = queue
        .where((element) => element.priority == RequestPriority.high)
        .toList();
    if (requests.isEmpty) {
      requests = queue
          .where((element) => element.priority == RequestPriority.mid)
          .toList();
    }
    if (requests.isEmpty) {
      requests = queue
          .where((element) => element.priority == RequestPriority.low)
          .toList();
    }
    return requests;
  }

  ///function to delete all finished requests from the queue
  refresh() => queue.removeWhere((element) => element.isDone);

  ///Log Queue
  void queueLog() {
    log('################ API QUEUE ################', name: 'API SERVICE');
    if (queue.isEmpty) log('        Empty          ', name: 'API SERVICE');
    for (int i = 0; i < queue.length; i++) {
      log('========== ${queue[i].endPoint} ==========', name: 'API SERVICE');
      log('${i + 1}\t${queue[i].priority.name}\t${queue[i].status.value.name}',
          name: 'API SERVICE');
    }
    log('###########################################', name: 'API SERVICE');
  }
}
