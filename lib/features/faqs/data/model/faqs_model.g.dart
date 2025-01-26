// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faqs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaqsModel _$FaqsModelFromJson(Map<String, dynamic> json) => FaqsModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FaqsModelToJson(FaqsModel instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      faqsAnswerItem: (json['data'] as List<dynamic>?)
          ?.map((e) => FaqsAnswerItem.fromJson(e as Map<String, dynamic>))
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
      'data': instance.faqsAnswerItem,
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

FaqsAnswerItem _$FaqsAnswerItemFromJson(Map<String, dynamic> json) =>
    FaqsAnswerItem(
      id: (json['id'] as num?)?.toInt(),
      question: json['question'] as String?,
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$FaqsAnswerItemToJson(FaqsAnswerItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
    };
