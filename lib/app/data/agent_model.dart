import 'list_model.dart';

class AgentListRes extends ListRes {
  AgentListRes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? AgentList.fromJson(json['data']) : null;
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

class AgentList {
  List<Agent>? agent;
  int? currentPage;
  int? total;

  AgentList({this.agent, this.currentPage, this.total});

  AgentList.fromJson(Map<String, dynamic> json) {
    if (json['agent'] != null) {
      agent = <Agent>[];
      json['agent'].forEach((v) {
        agent?.add(Agent.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (agent != null) {
      data['agent'] = agent?.map((v) => v.toJson()).toList();
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
  double? usedLimit;
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
      this.usedLimit,
      this.status,
      this.adminId,
      this.licenseUrl,
      this.createdAt,
      this.updatedAt});

  Agent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    contactName = json['contact_name'];
    contactPhone = json['contact_phone'];
    address = json['address'];
    nationality = json['nationality'];
    agentCode = json['agent_code'];
    availableLimit = json['available_limit'];
    creditLimit = json['credit_limit'];
    usedLimit = json['used_limit'];
    status = json['status'];
    adminId = json['admin_id'];
    licenseUrl = json['license_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['contact_name'] = contactName;
    data['contact_phone'] = contactPhone;
    data['address'] = address;
    data['nationality'] = nationality;
    data['agent_code'] = agentCode;
    data['available_limit'] = availableLimit;
    data['credit_limit'] = creditLimit;
    data['used_limit'] = usedLimit;
    data['status'] = status;
    data['admin_id'] = adminId;
    data['license_url'] = licenseUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
