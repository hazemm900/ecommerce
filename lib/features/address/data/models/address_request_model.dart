import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_request_model.g.dart';

@JsonSerializable()
class AddressRequestModel {
  String? name;
  String? city;
  String? region;
  String? details;
  double? latitude;
  double? longitude;
  String? notes;

  AddressRequestModel(
      {this.name,
      this.city,
      this.region,
      this.details,
      this.latitude,
      this.longitude,
      this.notes});

  Map<String, dynamic> toJson() => _$AddressRequestModelToJson(this);
}
