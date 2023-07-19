import 'package:ugodubai/app/data/base_model.dart';

class OrderListRes extends BaseRes {
  OrderListRes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? OrderListData?.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class OrderListData {
  List<Order>? order;
  int? currentPage;
  int? total;

  OrderListData.fromJson(Map<String, dynamic> json) {
    if (json['order'] != null) {
      order = <Order>[];
      json['order'].forEach((v) {
        order?.add(Order.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (order != null) {
      data['order'] = order?.map((v) => v.toJson()).toList();
    }
    data['currentPage'] = currentPage;
    data['total'] = total;
    return data;
  }
}

class Order {
  int? id;
  String? uuid;
  String? name;
  String? orderNumber;
  String? actionDate;
  String? actionTime;
  int? agentId;
  String? agentCode;
  String? productName;
  String? guestName;
  String? guestContact;
  double? unitPrice;
  int? quantity;
  double? totalPrice;
  int? status;
  String? remark;
  String? currency;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;

  Order(
      {this.id,
      this.uuid,
      this.name,
      this.orderNumber,
      this.actionDate,
      this.actionTime,
      this.agentId,
      this.agentCode,
      this.productName,
      this.guestName,
      this.guestContact,
      this.unitPrice,
      this.quantity,
      this.totalPrice,
      this.status,
      this.remark,
      this.currency,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    orderNumber = json['orderNumber'];
    actionDate = json['actionDate'];
    actionTime = json['actionTime'];
    agentId = json['agentId'];
    agentCode = json['agentCode'];
    productName = json['productName'];
    guestName = json['guestName'];
    guestContact = json['guestContact'];
    unitPrice = json['unitPrice'];
    quantity = json['quantity'];
    totalPrice = json['totalPrice'];
    status = json['status'];
    remark = json['remark'];
    currency = json['currency'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['name'] = name;
    data['orderNumber'] = orderNumber;
    data['actionDate'] = actionDate;
    data['actionTime'] = actionTime;
    data['agentId'] = agentId;
    data['agentCode'] = agentCode;
    data['productName'] = productName;
    data['guestName'] = guestName;
    data['guestContact'] = guestContact;
    data['unitPrice'] = unitPrice;
    data['quantity'] = quantity;
    data['totalPrice'] = totalPrice;
    data['status'] = status;
    data['remark'] = remark;
    data['currency'] = currency;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
