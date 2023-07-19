import 'package:get/get.dart';

import 'package:ugodubai/services/http_service.dart';

import '../menu_model.dart';

class MenuProvider extends HttpService {
  Future<Menu?> getMenu(int id) async {
    final response = await get('menu/get', query: {'id': id});
    return response.body;
  }

  Future<MenuListRes> getMenus([Map<String, dynamic>? payload]) async {
    final res = await get('system/menu/list',
        query: payload
            ?.map((key, value) => MapEntry(key, value?.toString()))
            .cast());
    return MenuListRes.fromJson(res.body);
  }

  Future<Response<Menu>> postMenu(Menu menu) async => await post('menu', menu);
  Future<Response> deleteMenu(int id) async => await delete('menu/$id');
}
