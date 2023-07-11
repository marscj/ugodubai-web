import 'package:get/get.dart';
import 'package:ugodubai/services/http_service.dart';

import '../agent_list_model.dart';
import '../agent_model.dart';

class AgentProvider extends HttpService {
  Future<AgentRes> getAgent(int id, [bool? user]) async {
    final res = await get('system/agent/get',
        query: {'id': id.toString(), 'user': user?.toString()});

    return AgentRes.fromJson(res.body);
  }

  Future<AgentListRes> getAgents(Map<String, dynamic> payload) async {
    final res = await get('system/agent/list',
        query: payload
            .map((key, value) => MapEntry(key, value?.toString()))
            .cast());

    return AgentListRes.fromJson(res.body);
  }

  Future<Response<Agent>> postAgent(Agent agent) async =>
      await post('agent', agent);
  Future<Response> deleteAgent(int id) async => await delete('agent/$id');
}
