import 'package:ugodubai/app/data/user_model.dart';

class LoginRes {
  int? code;
  String? message;
  UserData? data;

  LoginRes({this.code, this.message, this.data});

  LoginRes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? UserData?.fromJson(json['data']) : null;
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

class UserData {
  User? userInfo;
  String? token;
  List<MenuList>? menuList;

  UserData({this.userInfo, this.token, this.menuList});

  UserData.fromJson(Map<String, dynamic> json) {
    userInfo =
        json['userInfo'] != null ? User?.fromJson(json['userInfo']) : null;
    token = json['token'];
    if (json['menuList'] != null) {
      menuList = <MenuList>[];
      json['menuList'].forEach((v) {
        menuList?.add(MenuList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (userInfo != null) {
      data['userInfo'] = userInfo?.toJson();
    }
    data['token'] = token;
    if (menuList != null) {
      data['menuList'] = menuList?.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class MenuList {
  int? id;
  int? pid;
  String? name;
  String? component;
  String? path;
  Meta? meta;

  MenuList({
    this.id,
    this.pid,
    this.name,
    this.component,
    this.path,
    this.meta,
  });

  MenuList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pid = json['pid'];
    name = json['name'];
    component = json['component'];
    path = json['path'];
    meta = json['meta'] != null ? Meta?.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['pid'] = pid;
    data['name'] = name;
    data['component'] = component;
    data['path'] = path;
    if (meta != null) {
      data['meta'] = meta?.toJson();
    }
    return data;
  }
}

class Meta {
  String? icon;
  String? title;
  String? isLink;
  bool? isHide;
  bool? isKeepAlive;
  bool? isAffix;
  bool? isIframe;

  Meta(
      {this.icon,
      this.title,
      this.isLink,
      this.isHide,
      this.isKeepAlive,
      this.isAffix,
      this.isIframe});

  Meta.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    isLink = json['isLink'];
    isHide = json['isHide'];
    isKeepAlive = json['isKeepAlive'];
    isAffix = json['isAffix'];
    isIframe = json['isIframe'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['icon'] = icon;
    data['title'] = title;
    data['isLink'] = isLink;
    data['isHide'] = isHide;
    data['isKeepAlive'] = isKeepAlive;
    data['isAffix'] = isAffix;
    data['isIframe'] = isIframe;
    return data;
  }
}
