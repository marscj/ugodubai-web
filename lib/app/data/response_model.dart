class BaseResponse<T> {
  int? code;
  String? message;

  BaseResponse({this.code, this.message});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;

    return data;
  }
}
