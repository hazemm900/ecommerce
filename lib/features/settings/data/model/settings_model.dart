import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_model.g.dart';

@JsonSerializable()
class SettingsModel {
  bool? status;
  String? message;
  Data? data;

  SettingsModel({this.status, this.message, this.data});

  factory SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);
}

@JsonSerializable()
class Data {
  String? about;
  String? terms;

  Data({this.about, this.terms});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
