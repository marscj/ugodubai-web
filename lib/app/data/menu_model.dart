import 'package:ugodubai/app/data/base_model.dart';

class MenuListRes extends BaseRes {
  MenuListRes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? MenuListData?.fromJson(json['data']) : null;
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

class MenuListData {
  List<Menu>? menu;

  MenuListData.fromJson(Map<String, dynamic> json) {
    if (json['menu'] != null) {
      menu = <Menu>[];
      json['menu'].forEach((v) {
        menu?.add(Menu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (menu != null) {
      data['menu'] = menu?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Menu {
  int? id;
  int? pid;
  String? name;
  String? title;
  String? icon;
  String? condition;
  String? remark;
  int? menuType;
  int? weigh;
  int? isHide;
  int? isCached;
  int? isAffix;
  String? path;
  String? redirect;
  String? component;
  int? isIframe;
  int? isLink;
  String? linkUrl;

  Menu(
      {this.id,
      this.pid,
      this.name,
      this.title,
      this.icon,
      this.condition,
      this.remark,
      this.menuType,
      this.weigh,
      this.isHide,
      this.isCached,
      this.isAffix,
      this.path,
      this.redirect,
      this.component,
      this.isIframe,
      this.isLink,
      this.linkUrl});

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pid = json['pid'];
    name = json['name'];
    title = json['title'];
    icon = json['icon'];
    condition = json['condition'];
    remark = json['remark'];
    menuType = json['menuType'];
    weigh = json['weigh'];
    isHide = json['isHide'];
    isCached = json['isCached'];
    isAffix = json['isAffix'];
    path = json['path'];
    redirect = json['redirect'];
    component = json['component'];
    isIframe = json['isIframe'];
    isLink = json['isLink'];
    linkUrl = json['linkUrl'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['pid'] = pid;
    data['name'] = name;
    data['title'] = title;
    data['icon'] = icon;
    data['condition'] = condition;
    data['remark'] = remark;
    data['menuType'] = menuType;
    data['weigh'] = weigh;
    data['isHide'] = isHide;
    data['isCached'] = isCached;
    data['isAffix'] = isAffix;
    data['path'] = path;
    data['redirect'] = redirect;
    data['component'] = component;
    data['isIframe'] = isIframe;
    data['isLink'] = isLink;
    data['linkUrl'] = linkUrl;
    return data;
  }
}
