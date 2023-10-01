// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final int id;
  final String name;
  final String email;
  final String? address;
  final String? city;
  final String? phone;
  final bool email_verified;
  final String? image;

  const ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    this.address,
    this.city,
    this.phone,
    required this.email_verified,
    this.image,
  });

  static const empty = ProfileModel(
    id: 0,
    name: '',
    email: '',
    email_verified: false,
  );
  @override
  List<Object?> get props => [
        id,
        name,
        email,
        address,
        city,
        phone,
        email_verified,
        image,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'phone': phone,
      'email_verified': email_verified,
      // 'image': image,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      address: map['address'] != null ? map['address'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      email_verified: map['email_verified'] as bool,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  ProfileModel copyWith({
    int? id,
    String? name,
    String? email,
    String? address,
    String? city,
    String? phone,
    bool? email_verified,
    String? image,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      city: city ?? this.city,
      phone: phone ?? this.phone,
      email_verified: email_verified ?? this.email_verified,
      image: image ?? this.image,
    );
  }
}
