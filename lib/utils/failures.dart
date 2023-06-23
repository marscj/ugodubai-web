import 'package:get/get.dart';

abstract class Failure {
  final String message;

  final int? code;

  Failure(this.message, {this.code});

  @override
  String toString() => this.message;
}

// General failures
class ServerFailure extends Failure {
  ServerFailure() : super('errors_server'.tr);
}

class RequestFailure extends Failure {
  RequestFailure() : super('errors_request'.tr);
}

class CacheFailure extends Failure {
  CacheFailure() : super('errors_cache'.tr);
}

class ConnetFailure extends Failure {
  ConnetFailure() : super('errors_connet'.tr);
}

class FailureMessage extends Failure {
  FailureMessage(String message) : super(message);
}

class FailureResponse extends Failure {
  FailureResponse(String message, int code) : super(message, code: code);
}
