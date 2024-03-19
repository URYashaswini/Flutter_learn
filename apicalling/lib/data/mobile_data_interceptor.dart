import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class MobileDataInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    final connectivtyResult = await Connectivity().checkConnectivity();
    final isMobile = connectivtyResult == ConnectivityResult.mobile;
    final isLargeFile =
        request.url.toString().contains(RegExp(r'/large|/video|/posts'));
    if (isMobile && isLargeFile) {
      throw MobileDataClassException();
    }
    return request;
  }
}

class MobileDataClassException implements Exception {
  final message = "Downlaoding large files on mobile data connection";
  @override
  String toString() => message;
}
