import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details_model.g.dart';

@JsonSerializable()
class ProductDetailsModel {
  bool? status;
  String? message;
  Data? data;

  ProductDetailsModel({this.status, this.message, this.data});

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);
}

@JsonSerializable()
class Data {
  int? id;
  int? price;
  @JsonKey(name: "old_price")
  int? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  @JsonKey(name: "in_favorites")
  bool? inFavorites;
  @JsonKey(name: "in_cart")
  bool? inCart;
  List<String>? images;

  Data(
      {this.id,
      this.price,
      this.oldPrice,
      this.discount,
      this.image,
      this.name,
      this.description,
      this.inFavorites,
      this.inCart,
      this.images});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
