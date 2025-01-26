import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel {
  bool? status;
  String? message;
  Data? data;

  CategoriesModel({this.status, this.message, this.data});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "data")
  List<CategoryItem>? categoryItem;
  @JsonKey(name: "next_page_url")
  String? nextPageUrl;
  Data({
    this.categoryItem,
    this.nextPageUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class CategoryItem {
  int? id;
  String? name;
  String? image;

  CategoryItem({this.id, this.name, this.image});

  factory CategoryItem.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemFromJson(json);
}
