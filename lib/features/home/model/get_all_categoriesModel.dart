class GetAllCategotiesModel {
  Data? data;
  String? message;
  int? status;

  GetAllCategotiesModel({this.data, this.message,  this.status});

  GetAllCategotiesModel.fromJson(Map<String, dynamic> json) {
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
  List<AllCategories>? categories;
  Meta? meta;
  Links? links;

  Data({this.categories, this.meta, this.links});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <AllCategories>[];
      json['categories'].forEach((v) {
        categories!.add(new AllCategories.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
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

class AllCategories {
  int? id;
  String? name;
  int? productsCount;

  AllCategories({this.id, this.name, this.productsCount});

  AllCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productsCount = json['products_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['products_count'] = this.productsCount;
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
