import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_or_remove_favorites_model.g.dart';

@JsonSerializable()
class AddOrRemoveFavoritesModel {
  bool? status;
  String? message;
  Data? data;

  AddOrRemoveFavoritesModel({this.status, this.message, this.data});

  factory AddOrRemoveFavoritesModel.fromJson(Map<String, dynamic> json) =>
      _$AddOrRemoveFavoritesModelFromJson(json);
}

@JsonSerializable()
class Data {
  int? id;
  int? quantity;
  Product? product;

  Data({this.id, this.quantity, this.product});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class Product {
  int? id;
  int? price;
  @JsonKey(name: "old_price")
  int? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;

  Product(
      {this.id,
        this.price,
        this.oldPrice,
        this.discount,
        this.image,
        this.name,
        this.description});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
