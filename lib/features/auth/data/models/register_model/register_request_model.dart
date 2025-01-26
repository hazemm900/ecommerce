import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterRequestModel {
  String? name;
  String? phone;
  String? email;
  String? password;
  String? image;

  RegisterRequestModel(
      {this.name, this.phone, this.email, this.password, this.image});

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
