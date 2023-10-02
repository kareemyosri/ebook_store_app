class GovernorateModel {
  List<GovernoratesData>? data;
  String? message;
  int? status;

  GovernorateModel({this.data, this.message, this.status});

  GovernorateModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GovernoratesData>[];
      json['data'].forEach((v) {
        data!.add(new GovernoratesData.fromJson(v));
      });
    }
    message = json['message'];

    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;

    data['status'] = this.status;
    return data;
  }
}

class GovernoratesData {
  int? id;
  String? governorateNameEn;

  GovernoratesData({this.id, this.governorateNameEn});

  GovernoratesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    governorateNameEn = json['governorate_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['governorate_name_en'] = this.governorateNameEn;
    return data;
  }
}
