import 'package:get/get.dart';
import 'package:ugodubai/services/http_service.dart';

import '../order_list_model.dart';

class OrderProvider extends HttpService {
  // Future<OrderRes> getOrder(int id, [bool? user]) async {
  //   final res = await get('system/order/get',
  //       query: {'id': id.toString(), 'user': user?.toString()});

  //   return OrderRes.fromJson(res.body);
  // }

  Future<OrderListRes> getOrders(Map<String, dynamic> payload) async {
    final res = await get('system/order/list',
        query: payload
            .map((key, value) => MapEntry(key, value?.toString()))
            .cast());

    print(res.bodyString);
    return OrderListRes.fromJson(res.body);
  }

  Future<Response<Order>> postOrder(Order order) async =>
      await post('order', order);
  Future<Response> deleteOrder(int id) async => await delete('order/$id');
}
