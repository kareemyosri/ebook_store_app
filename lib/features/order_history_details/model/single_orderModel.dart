class SingleOrderModel {
  SingleOrderData? data;
  String? message;
  int? status;

  SingleOrderModel({this.data, this.message, this.status});

  SingleOrderModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new SingleOrderData.fromJson(json['data']) : null;
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

class SingleOrderData {
  int? id;
  String? orderCode;
  String? total;
  String? name;
  String? email;
  String? address;
  String? governorate;
  String? phone;
  String? subTotal;
  String? orderDate;
  String? status;
  int? discount;
  List<OrderProducts>? orderProducts;

  SingleOrderData(
      {this.id,
        this.orderCode,
        this.total,
        this.name,
        this.email,
        this.address,
        this.governorate,
        this.phone,

        this.subTotal,
        this.orderDate,
        this.status,

        this.discount,
        this.orderProducts});

  SingleOrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderCode = json['order_code'];
    total = json['total'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    governorate = json['governorate'];
    phone = json['phone'];

    subTotal = json['sub_total'];
    orderDate = json['order_date'];
    status = json['status'];

    discount = json['discount'];
    if (json['order_products'] != null) {
      orderProducts = <OrderProducts>[];
      json['order_products'].forEach((v) {
        orderProducts!.add(new OrderProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_code'] = this.orderCode;
    data['total'] = this.total;
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['governorate'] = this.governorate;
    data['phone'] = this.phone;

    data['sub_total'] = this.subTotal;
    data['order_date'] = this.orderDate;
    data['status'] = this.status;

    data['discount'] = this.discount;
    if (this.orderProducts != null) {
      data['order_products'] =
          this.orderProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderProducts {
  int? orderProductId;
  int? productId;
  String? productName;
  String? productPrice;
  int? productDiscount;
  double? productPriceAfterDiscount;
  int? orderProductQuantity;
  String? productTotal;

  OrderProducts(
      {this.orderProductId,
        this.productId,
        this.productName,
        this.productPrice,
        this.productDiscount,
        this.productPriceAfterDiscount,
        this.orderProductQuantity,
        this.productTotal});

  OrderProducts.fromJson(Map<String, dynamic> json) {
    orderProductId = json['order_product_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productDiscount = json['product_discount'];
    productPriceAfterDiscount = json['product_price_after_discount'];
    orderProductQuantity = json['order_product_quantity'];
    productTotal = json['product_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_product_id'] = this.orderProductId;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_price'] = this.productPrice;
    data['product_discount'] = this.productDiscount;
    data['product_price_after_discount'] = this.productPriceAfterDiscount;
    data['order_product_quantity'] = this.orderProductQuantity;
    data['product_total'] = this.productTotal;
    return data;
  }
}
