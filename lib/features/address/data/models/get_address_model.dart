import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_address_model.g.dart';

@JsonSerializable()
class GetAddressModel {
  bool? status;
  String? message;
  Data? data;

  GetAddressModel({this.status, this.message, this.data});

  factory GetAddressModel.fromJson(Map<String, dynamic> json) =>
      _$GetAddressModelFromJson(json);
}

@JsonSerializable()
class Data {
  int? currentPage;
  @JsonKey(name: "data")
  List<GetAllAddresses>? getAllAddresses;
  @JsonKey(name: "first_page_url")
  String? firstPageUrl;
  int? from;
  @JsonKey(name: "last_page")
  int? lastPage;
  @JsonKey(name: "last_page_url")
  String? lastPageUrl;
  @JsonKey(name: "next_page_url")
  String? nextPageUrl;
  String? path;
  @JsonKey(name: "per_page")
  int? perPage;
  @JsonKey(name: "prev_page_url")
  String? prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
      this.getAllAddresses,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class GetAllAddresses {
  int? id;
  String? name;
  String? city;
  String? region;
  String? details;
  String? notes;
  double? latitude;
  double? longitude;

  GetAllAddresses(
      {this.id,
      this.name,
      this.city,
      this.region,
      this.details,
      this.notes,
      this.latitude,
      this.longitude});

  factory GetAllAddresses.fromJson(Map<String, dynamic> json) =>
      _$GetAllAddressesFromJson(json);
}
