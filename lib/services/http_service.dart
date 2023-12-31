import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:ugodubai/app/data/response_model.dart';
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
    request.headers['Authorization'] = 'Bearer ${AuthService.to.getToken()}';
    return request;
  }

  FutureOr<dynamic> responseInterceptor(
      Request request, Response response) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      final res = BaseResponse.fromJson(response.body);

      if (res.code != 0) {
        showMessage(res.message);
      }
    }
    return response;
  }

  void showMessage(message) {
    GetSnackBar(
      backgroundColor: Get.theme.colorScheme.background,
      userInputForm: Form(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error,
              color: Get.theme.colorScheme.error,
            ),
            Text(
              message,
              style: Get.theme.textTheme.labelLarge
                  ?.copyWith(color: Get.theme.colorScheme.error),
            ).paddingSymmetric(horizontal: 10)
          ],
        ),
      ),
      duration: Duration(seconds: 2),
      snackPosition: SnackPosition.TOP,
    ).show();
  }
}
