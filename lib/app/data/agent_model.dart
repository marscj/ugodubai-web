class AgentListRes {
  int? code;
  String? message;
  AgentList? data;

  AgentListRes({this.code, this.message, this.data});

  AgentListRes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? AgentList?.fromJson(json['data']) : null;
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
  int? availableLimit;
  int? creditLimit;
  int? usedLimit;
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
    contactName = json['contactName'];
    contactPhone = json['contactPhone'];
    address = json['address'];
    nationality = json['nationality'];
    agentCode = json['agentCode'];
    availableLimit = json['availableLimit'];
    creditLimit = json['creditLimit'];
    usedLimit = json['usedLimit'];
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
    data['usedLimit'] = usedLimit;
    data['status'] = status;
    data['adminId'] = adminId;
    data['licenseUrl'] = licenseUrl;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
