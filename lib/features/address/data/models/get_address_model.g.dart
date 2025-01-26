// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAddressModel _$GetAddressModelFromJson(Map<String, dynamic> json) =>
    GetAddressModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAddressModelToJson(GetAddressModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      getAllAddresses: (json['data'] as List<dynamic>?)
          ?.map((e) => GetAllAddresses.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      from: (json['from'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      lastPageUrl: json['last_page_url'] as String?,
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String?,
      perPage: (json['per_page'] as num?)?.toInt(),
      prevPageUrl: json['prev_page_url'] as String?,
      to: (json['to'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'currentPage': instance.currentPage,
      'data': instance.getAllAddresses,
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'last_page': instance.lastPage,
      'last_page_url': instance.lastPageUrl,
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'prev_page_url': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };

GetAllAddresses _$GetAllAddressesFromJson(Map<String, dynamic> json) =>
    GetAllAddresses(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      city: json['city'] as String?,
      region: json['region'] as String?,
      details: json['details'] as String?,
      notes: json['notes'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GetAllAddressesToJson(GetAllAddresses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'region': instance.region,
      'details': instance.details,
      'notes': instance.notes,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
