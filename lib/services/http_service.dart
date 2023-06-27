import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:ugodubai/config.dart';
import 'package:ugodubai/services/auth_service.dart';

class HttpService extends GetConnect {
  HttpService() {
    httpClient.baseUrl = ConfigEnvironments.getEnvironments()['url'];
    httpClient.defaultDecoder = (map) {
      return map;
    };

    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
  }

  FutureOr<Request> requestInterceptor(Request request) async {
    request.headers['Authorization'] = AuthService.to.getToken();
    return request;
  }

  FutureOr<dynamic> responseInterceptor(
      Request request, Response response) async {
    if (response.statusCode == 200) {
      if (response.body != null) {
        var data = jsonDecode(response.body);
        if (data['code'] != 0) {
          Get.showSnackbar(
            GetSnackBar(
              message: data['message'],
              duration: Duration(seconds: 2),
              snackPosition: SnackPosition.TOP,
            ),
          );
        }
      }
    }

    return response;
  }
}
