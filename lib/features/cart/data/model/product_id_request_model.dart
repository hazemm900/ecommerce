import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_id_request_model.g.dart';

@JsonSerializable()
class ProductIdRequestModel {
  @JsonKey(name: "product_id")
  int? productId;

  ProductIdRequestModel({this.productId});

  Map<String, dynamic> toJson() => _$ProductIdRequestModelToJson(this);
}
