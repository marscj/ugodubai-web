import 'base_model.dart';

class RoleListRes extends BaseRes {
  RoleListRes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? RoleListData?.fromJson(json['data']) : null;
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

class RoleListData {
  int? currentPage;
  int? total;
  List<Role>? role;

  RoleListData({this.currentPage, this.total, this.role});

  RoleListData.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    total = json['total'];
    if (json['role'] != null) {
      role = <Role>[];
      json['role'].forEach((v) {
        role?.add(Role.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['total'] = total;
    if (role != null) {
      data['role'] = role?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Role {
  int? id;
  int? status;
  int? listOrder;
  String? name;
  String? remark;
  int? dataScope;
  String? createdAt;
  String? updatedAt;

  Role(
      {this.id,
      this.status,
      this.listOrder,
      this.name,
      this.remark,
      this.dataScope,
      this.createdAt,
      this.updatedAt});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    listOrder = json['listOrder'];
    name = json['name'];
    remark = json['remark'];
    dataScope = json['dataScope'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['listOrder'] = listOrder;
    data['name'] = name;
    data['remark'] = remark;
    data['dataScope'] = dataScope;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
