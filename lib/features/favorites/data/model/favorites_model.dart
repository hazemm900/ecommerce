import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorites_model.g.dart';

@JsonSerializable()
class FavoritesModel {
  bool? status;
  String? message;
  Data? data;

  FavoritesModel({this.status, this.message, this.data});

  factory FavoritesModel.fromJson(Map<String, dynamic> json) =>
      _$FavoritesModelFromJson(json);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "current_page")
  int? currentPage;
  List<FavoritesItems>? data;
  @JsonKey(name: "first_page_url")
  String? firstPageUrl;
  int? from;
  @JsonKey(name: "last_page")
  int? lastPage;
  @JsonKey(name: "last_page_url")
  String? lastPageUrl;
  @JsonKey(name: "next_page_ul")
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
      this.data,
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
class FavoritesItems {
  int? id;
  Product? product;

  FavoritesItems({this.id, this.product});

  factory FavoritesItems.fromJson(Map<String, dynamic> json) =>
      _$FavoritesItemsFromJson(json);
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
