// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      banners: (json['banners'] as List<dynamic>?)
          ?.map((e) => Banners.fromJson(e as Map<String, dynamic>))
          .toList(),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList(),
      ad: json['ad'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'banners': instance.banners,
      'products': instance.products,
      'ad': instance.ad,
    };

Banners _$BannersFromJson(Map<String, dynamic> json) => Banners(
      id: (json['id'] as num?)?.toInt(),
      image: json['image'] as String?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      product: json['product'] == null
          ? null
          : Products.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BannersToJson(Banners instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'category': instance.category,
      'product': instance.product,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: (json['id'] as num?)?.toInt(),
      image: json['image'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
    };

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      id: (json['id'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      oldPrice: (json['old_price'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toInt(),
      image: json['image'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      inFavorites: json['in_favorites'] as bool?,
      inCart: json['in_cart'] as bool?,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
      'images': instance.images,
      'in_favorites': instance.inFavorites,
      'in_cart': instance.inCart,
    };
