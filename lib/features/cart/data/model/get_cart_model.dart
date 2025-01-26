import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_cart_model.g.dart';

@JsonSerializable()
class GetCartModel {
  bool? status;
  String? message;
  Data? data;

  GetCartModel({this.status, this.message, this.data});

  factory GetCartModel.fromJson(Map<String, dynamic> json) =>
      _$GetCartModelFromJson(json);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "cart_items")
  List<CartItems>? cartItems;
  @JsonKey(name: "sub_total")
  int? subTotal;
  int? total;

  Data({this.cartItems, this.subTotal, this.total});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class CartItems {
  int? id;
  int? quantity;
  Product? product;

  CartItems({this.id, this.quantity, this.product});

  factory CartItems.fromJson(Map<String, dynamic> json) =>
      _$CartItemsFromJson(json);
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
  List<String>? images;
  @JsonKey(name: "in_favorites")
  bool? inFavorites;
  @JsonKey(name: "in_cart")
  bool? inCart;

  Product(
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

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
