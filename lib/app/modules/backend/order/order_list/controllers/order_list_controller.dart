import 'dart:async';

import 'package:get/get.dart';
import 'package:ugodubai/app/data/order_list_model.dart';
import 'package:ugodubai/app/data/providers/order_provider.dart';
import 'package:ugodubai/app/modules/backend/order/order_list/controllers/order_source.dart';

class OrderListController extends GetxController {
  final _source = Rx<OrderDataSource>(OrderDataSource());

  OrderDataSource get source => this._source.value;
  set source(value) => this._source.value = value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    unawaited(getSource({'pageSize': 100, 'pageNum': 1}));
  }

  Future<OrderListRes> getSource(Map<String, dynamic> payload) async {
    return OrderProvider().getOrders(payload).then((value) {
      source = OrderDataSource(
        data: value.data?.order ?? [],
        rowsPerPage: payload['pageSize'],
        total: value.data!.total!,
        future: getSource,
      );
      return value;
    });
  }
}
