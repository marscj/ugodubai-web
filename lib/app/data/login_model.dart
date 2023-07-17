import 'base_model.dart';
import 'user_model.dart';

class LoginRes extends BaseRes {
  LoginRes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? LoginData?.fromJson(json['data']) : null;
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

class LoginData {
  User? userInfo;
  String? token;
  List<MenuList>? menuList;
  List<String>? permissions;

  LoginData({this.userInfo, this.token, this.menuList, this.permissions});

  LoginData.fromJson(Map<String, dynamic> json) {
    userInfo =
        json['userInfo'] != null ? User?.fromJson(json['userInfo']) : null;
    token = json['token'];
    if (json['menuList'] != null) {
      menuList = <MenuList>[];
      json['menuList'].forEach((v) {
        menuList?.add(MenuList.fromJson(v));
      });
    }
    permissions = json['permissions'].cast<String>();
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
    data['permissions'] = permissions;
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
  List<MenuList>? children;

  MenuList(
      {this.id,
      this.pid,
      this.name,
      this.component,
      this.path,
      this.meta,
      this.children});

  MenuList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pid = json['pid'];
    name = json['name'];
    component = json['component'];
    path = json['path'];
    meta = json['meta'] != null ? Meta?.fromJson(json['meta']) : null;
    if (json['children'] != null) {
      children = <MenuList>[];
      json['children'].forEach((v) {
        children?.add(MenuList.fromJson(v));
      });
    }
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
    if (children != null) {
      data['children'] = children?.map((v) => v.toJson()).toList();
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
