class CaptchaRes {
  int? code;
  String? message;
  Captcha? data;

  CaptchaRes({this.code, this.message, this.data});

  CaptchaRes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Captcha?.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Captcha {
  String? key;
  String? img;

  Captcha({this.key, this.img});

  Captcha.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['key'] = key;
    data['img'] = img;
    return data;
  }
}
