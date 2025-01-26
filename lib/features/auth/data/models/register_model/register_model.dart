import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
  bool? status;
  String? message;
  Data? data;

  RegisterModel({this.status, this.message, this.data});

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
}

@JsonSerializable()
class Data {
  String? name;
  String? phone;
  String? email;
  int? id;
  String? image;
  String? token;

  Data({this.name, this.phone, this.email, this.id, this.image, this.token});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
