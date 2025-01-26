import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  bool? status;
  String? message;
  Data? data;

  AddressModel({this.status, this.message, this.data});

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);
}

@JsonSerializable()
class Data {
  String? name;
  String? city;
  String? region;
  String? details;
  double? latitude;
  double? longitude;
  String? notes;
  int? id;

  Data(
      {this.name,
      this.city,
      this.region,
      this.details,
      this.latitude,
      this.longitude,
      this.notes,
      this.id});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
