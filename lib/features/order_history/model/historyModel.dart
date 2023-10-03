class HistoryModel {
  Data? data;
  String? message;
  int? status;

  HistoryModel({this.data, this.message, this.status});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;

    data['status'] = this.status;
    return data;
  }
}

class Data {
  List<Orders>? orders;


  Data({this.orders});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Orders {
  int? id;
  String? orderCode;
  String? orderDate;
  String? status;
  String? total;

  Orders({this.id, this.orderCode, this.orderDate, this.status, this.total});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderCode = json['order_code'];
    orderDate = json['order_date'];
    status = json['status'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_code'] = this.orderCode;
    data['order_date'] = this.orderDate;
    data['status'] = this.status;
    data['total'] = this.total;
    return data;
  }
}

