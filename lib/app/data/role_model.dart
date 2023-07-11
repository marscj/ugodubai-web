import 'package:ugodubai/app/data/base_model.dart';

class RoleRes extends BaseRes {
  RoleRes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? RoleData?.fromJson(json['data']) : null;
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

class RoleData {
  Agent? agent;
  int? currentPage;
  int? total;

  RoleData({this.agent, this.currentPage, this.total});

  RoleData.fromJson(Map<String, dynamic> json) {
    agent = json['agent'] != null ? Agent?.fromJson(json['agent']) : null;
    currentPage = json['currentPage'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (agent != null) {
      data['agent'] = agent?.toJson();
    }
    data['currentPage'] = currentPage;
    data['total'] = total;
    return data;
  }
}

class Agent {
  int? id;
  String? name;
  String? email;
  String? contactName;
  String? contactPhone;
  String? address;
  String? nationality;
  String? agentCode;
  double? availableLimit;
  double? creditLimit;
  double? outstandingBalance;
  double? accountBlance;
  int? status;
  int? adminId;
  String? licenseUrl;
  String? createdAt;
  String? updatedAt;
  List<User>? user;

  Agent(
      {this.id,
      this.name,
      this.email,
      this.contactName,
      this.contactPhone,
      this.address,
      this.nationality,
      this.agentCode,
      this.availableLimit,
      this.creditLimit,
      this.outstandingBalance,
      this.accountBlance,
      this.status,
      this.adminId,
      this.licenseUrl,
      this.createdAt,
      this.updatedAt,
      this.user});

  Agent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    contactName = json['contactName'];
    contactPhone = json['contactPhone'];
    address = json['address'];
    nationality = json['nationality'];
    agentCode = json['agentCode'];
    availableLimit = json['availableLimit'];
    creditLimit = json['creditLimit'];
    outstandingBalance = json['outstandingBalance'];
    accountBlance = json['accountBlance'];
    status = json['status'];
    adminId = json['adminId'];
    licenseUrl = json['licenseUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user?.add(User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['contactName'] = contactName;
    data['contactPhone'] = contactPhone;
    data['address'] = address;
    data['nationality'] = nationality;
    data['agentCode'] = agentCode;
    data['availableLimit'] = availableLimit;
    data['creditLimit'] = creditLimit;
    data['outstandingBalance'] = outstandingBalance;
    data['accountBlance'] = accountBlance;
    data['status'] = status;
    data['adminId'] = adminId;
    data['licenseUrl'] = licenseUrl;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (user != null) {
      data['user'] = user?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? avatar;
  int? sex;
  String? userName;
  String? userNickname;
  int? agentId;

  User(
      {this.id,
      this.avatar,
      this.sex,
      this.userName,
      this.userNickname,
      this.agentId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    sex = json['sex'];
    userName = json['userName'];
    userNickname = json['userNickname'];
    agentId = json['agentId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['avatar'] = avatar;
    data['sex'] = sex;
    data['userName'] = userName;
    data['userNickname'] = userNickname;
    data['agentId'] = agentId;
    return data;
  }
}
