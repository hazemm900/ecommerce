// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressRequestModel _$AddressRequestModelFromJson(Map<String, dynamic> json) =>
    AddressRequestModel(
      name: json['name'] as String?,
      city: json['city'] as String?,
      region: json['region'] as String?,
      details: json['details'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$AddressRequestModelToJson(
        AddressRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'city': instance.city,
      'region': instance.region,
      'details': instance.details,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'notes': instance.notes,
    };
