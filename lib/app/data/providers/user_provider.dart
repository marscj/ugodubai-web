import 'package:get/get.dart';
import 'package:ugodubai/app/data/login_model.dart';
import 'package:ugodubai/services/http_service.dart';

class UserProvider extends HttpService {
  Future<User?> getUser(int id) async {
    final response = await get('user/$id');
    return response.body;
  }

  Future<dynamic> getUsers() async {
    final res = await get('system/user/list');
    return res.body;
  }

  Future<Response<User>> postUser(User user) async => await post('user', user);
  Future<Response> deleteUser(int id) async => await delete('user/$id');
}
