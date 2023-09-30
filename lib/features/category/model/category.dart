// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:book_store_app/features/home/model/productModel.dart';

class Category {
  int? id;
  String? name;
  String? slug;
  List<Products>? products;

  Category({this.id, this.name, this.slug, this.products});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
