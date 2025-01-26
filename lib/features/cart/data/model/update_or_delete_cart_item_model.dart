import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_or_delete_cart_item_model.g.dart';

@JsonSerializable()
class UpdateOrDeleteCartItemModel {
  bool? status;
  String? message;
  Data? data;

  UpdateOrDeleteCartItemModel({this.status, this.message, this.data});

  factory UpdateOrDeleteCartItemModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrDeleteCartItemModelFromJson(json);
}

@JsonSerializable()
class Data {
  Cart? cart;
  @JsonKey(name: "sub_total")
  int? subTotal;
  int? total;

  Data({this.cart, this.subTotal, this.total});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class Cart {
  int? id;
  int? quantity;
  Product? product;

  Cart({this.id, this.quantity, this.product});

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@JsonSerializable()
class Product {
  int? id;
  int? price;
  @JsonKey(name: "old_price")
  int? oldPrice;
  int? discount;
  String? image;

  Product({this.id, this.price, this.oldPrice, this.discount, this.image});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
