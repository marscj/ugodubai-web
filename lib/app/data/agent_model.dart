import 'package:ugodubai/app/data/base_model.dart';

class AgentRes extends BaseRes {
  AgentRes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? AgentData?.fromJson(json['data']) : null;
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

class AgentData {
  Agent? agent;

  AgentData({this.agent});

  AgentData.fromJson(Map<String, dynamic> json) {
    agent = json['agent'] != null ? Agent?.fromJson(json['agent']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (agent != null) {
      data['agent'] = agent?.toJson();
    }
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
      this.updatedAt});

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
    return data;
  }
}
