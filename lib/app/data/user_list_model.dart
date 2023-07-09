import 'base_model.dart';
import 'user_model.dart';

class UserListRes extends BaseRes {
  UserListRes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? UserListData?.fromJson(json['data']) : null;
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

class UserListData {
  List<User>? user;
  int? currentPage;
  int? total;

  UserListData({this.user, this.currentPage, this.total});

  UserListData.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user?.add(User.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user?.map((v) => v.toJson()).toList();
    }
    data['currentPage'] = currentPage;
    data['total'] = total;
    return data;
  }
}
