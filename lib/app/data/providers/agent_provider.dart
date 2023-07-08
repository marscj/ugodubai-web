import 'package:get/get.dart';
import 'package:ugodubai/services/http_service.dart';

import '../agent_model.dart';

class AgentProvider extends HttpService {
  Future<Agent?> getAgent(int id) async {
    final response = await get('agent/$id');
    return response.body;
  }

  Future<AgentListRes> getAgents() async {
    final res = await get('system/agent/list');
    print(res.bodyString);
    return AgentListRes.fromJson(res.body);
  }

  Future<Response<Agent>> postAgent(Agent agent) async =>
      await post('agent', agent);
  Future<Response> deleteAgent(int id) async => await delete('agent/$id');
}
