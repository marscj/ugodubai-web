import 'package:ugodubai/services/http_service.dart';

import '../role_list_model.dart';

class RoleProvider extends HttpService {
  Future<RoleListRes> getRoles(Map<String, dynamic> payload) async {
    final res = await get('system/role/list',
        query: payload
            .map((key, value) => MapEntry(key, value?.toString()))
            .cast());

    return RoleListRes.fromJson(res.body);
  }

  // Future<Response<RoleList>> postRoleList(RoleList rolelist) async =>
  //     await post('rolelist', rolelist);
  // Future<Response> deleteRoleList(int id) async => await delete('rolelist/$id');
}
