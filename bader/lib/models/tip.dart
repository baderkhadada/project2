// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'tip_generate.dart';

@JsonSerializable()
class Tip {
  int? id;
  String? text;
  String? author;
  List<int>? upvotes;
  List<String>? downvotes;

  Tip({
    this.id,
    this.text,
    this.author,
    this.upvotes,
    this.downvotes,
  });

  factory Tip.fromJson(Map<String, dynamic> json) => _$TipFromJson(json);
  Map<String, dynamic> toJson() => _$TipToJson(this);
}
