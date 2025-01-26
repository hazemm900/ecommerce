import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  bool? status;
  String? message;
  Data? data;

  HomeModel({this.status, this.message, this.data});

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
}

@JsonSerializable()
class Data {
  List<Banners>? banners;
  List<Products>? products;
  String? ad;

  Data({this.banners, this.products, this.ad});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class Banners {
  int? id;
  String? image;
  Category? category;
  Products? product;

  Banners({this.id, this.image, this.category, this.product});

  factory Banners.fromJson(Map<String, dynamic> json) =>
      _$BannersFromJson(json);
}

@JsonSerializable()
class Category {
  int? id;
  String? image;
  String? name;

  Category({this.id, this.image, this.name});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@JsonSerializable()
class Products {
  int? id;
  double? price;
  @JsonKey(name: "old_price")
  double? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  @JsonKey(name: "in_favorites")
  bool? inFavorites;
  @JsonKey(name: "in_cart")
  bool? inCart;

  Products(
      {this.id,
      this.price,
      this.oldPrice,
      this.discount,
      this.image,
      this.name,
      this.description,
      this.images,
      this.inFavorites,
      this.inCart});

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);
}
