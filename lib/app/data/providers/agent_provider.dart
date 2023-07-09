import 'package:get/get.dart';
import 'package:ugodubai/services/http_service.dart';

import '../agent_list_model.dart';
import '../agent_model.dart';

class AgentProvider extends HttpService {
  Future<AgentRes> getAgent(int id) async {
    final response =
        await get('system/agent/get', query: {'id': id.toString()});
    print(response.bodyString);
    return AgentRes.fromJson(response.body);
  }

  Future<AgentListRes> getAgents() async {
    final res = await get('system/agent/list');

    return AgentListRes.fromJson(res.body);
  }

  Future<Response<Agent>> postAgent(Agent agent) async =>
      await post('agent', agent);
  Future<Response> deleteAgent(int id) async => await delete('agent/$id');
}
