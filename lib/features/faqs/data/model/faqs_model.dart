import 'package:freezed_annotation/freezed_annotation.dart';

part 'faqs_model.g.dart';

@JsonSerializable()
class FaqsModel {
  bool? status;
  String? message;
  Data? data;

  FaqsModel({this.status, this.message, this.data});

  factory FaqsModel.fromJson(Map<String, dynamic> json) =>
      _$FaqsModelFromJson(json);
}

@JsonSerializable()
class Data {
  int? currentPage;
  @JsonKey(name: "data")
  List<FaqsAnswerItem>? faqsAnswerItem;
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
      this.faqsAnswerItem,
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
class FaqsAnswerItem {
  int? id;
  String? question;
  String? answer;

  FaqsAnswerItem({this.id, this.question, this.answer});

  factory FaqsAnswerItem.fromJson(Map<String, dynamic> json) => _$FaqsAnswerItemFromJson(json);
}
