import 'agent_model.dart';
import 'base_model.dart';

class AgentListRes extends BaseRes {
  AgentListRes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? AgentListData?.fromJson(json['data']) : null;
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

class AgentListData {
  List<Agent>? agent;
  int? currentPage;
  int? total;

  AgentListData({this.agent, this.currentPage, this.total});

  AgentListData.fromJson(Map<String, dynamic> json) {
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
