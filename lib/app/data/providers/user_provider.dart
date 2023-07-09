import 'package:get/get.dart';

import 'package:ugodubai/services/http_service.dart';

import '../user_list_model.dart';
import '../user_model.dart';

class UserProvider extends HttpService {
  Future<User?> getUser(int id) async {
    final response = await get('user/get', query: {'id': id});
    return response.body;
  }

  Future<UserListRes> getUsers(Map<String, dynamic> payload) async {
    final res = await get('system/user/list',
        query: payload
            .map((key, value) => MapEntry(key, value?.toString()))
            .cast());
    return UserListRes.fromJson(res.body);
  }

  Future<Response<User>> postUser(User user) async => await post('user', user);
  Future<Response> deleteUser(int id) async => await delete('user/$id');
}
