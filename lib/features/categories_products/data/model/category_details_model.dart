import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_details_model.g.dart';

@JsonSerializable()
class CategoryDetailsModel {
  bool? status;
  String? message;
  Data? data;

  CategoryDetailsModel({this.status, this.message, this.data});

  factory CategoryDetailsModel.fromJson(Map<String, dynamic> json) => _$CategoryDetailsModelFromJson(json);

}

@JsonSerializable()
class Data {
  int? currentPage;
  @JsonKey(name: "data")
  List<CategoryItemDetails>? categoryItemDetails;
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
      this.categoryItemDetails,
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
class CategoryItemDetails {
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

  CategoryItemDetails(
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

  factory CategoryItemDetails.fromJson(Map<String, dynamic> json) => _$CategoryItemDetailsFromJson(json);

}
