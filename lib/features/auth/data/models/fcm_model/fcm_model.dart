import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_model.g.dart';

@JsonSerializable()
class FCMModel {
  bool? status;
  String? message;
  Data? data;

  FCMModel({this.status, this.message, this.data});

  factory FCMModel.fromJson(Map<String, dynamic> json) => _$FCMModelFromJson(json);

}

@JsonSerializable()
class Data {
  String? token;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "created_at")
  String? createdAt;
  int? id;

  Data({this.token, this.userId, this.updatedAt, this.createdAt, this.id});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

}
