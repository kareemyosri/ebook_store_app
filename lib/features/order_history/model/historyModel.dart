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
  Meta? meta;
  Links? links;

  Data({this.orders, this.meta, this.links});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
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

class Meta {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;

  Meta({this.total, this.perPage, this.currentPage, this.lastPage});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['last_page'] = this.lastPage;
    return data;
  }
}

class Links {
  String? first;
  String? last;


  Links({this.first, this.last});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;

    return data;
  }
}
