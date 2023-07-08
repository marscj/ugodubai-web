import 'dart:async';

import 'package:get/get.dart';
import 'package:ugodubai/app/data/agent_model.dart';
import 'package:ugodubai/app/data/providers/agent_provider.dart';
import 'package:ugodubai/app/modules/auth/agent_list/controllers/user_source.dart';

class AgentListController extends GetxController {
  final _source = Rx<AgentDataSource>(AgentDataSource());

  AgentDataSource get source => this._source.value;
  set source(value) => this._source.value = value;

  @override
  void onReady() {
    super.onReady();

    unawaited(getSource({'pageSize': 20, 'pageNum': 1}));
  }

  Future<AgentListRes> getSource(Map<String, dynamic> payload) async {
    return AgentProvider().getAgents().then((value) {
      source = AgentDataSource(
        data: value.data?.agents ?? [],
        rowsPerPage: payload['pageSize'],
        total: value.data!.total!,
        future: getSource,
      );
      return value;
    });
  }
}
