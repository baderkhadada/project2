// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tip.dart';

// **************************
// JsonSerializableGenerator
// **************************

Tip _$TipFromJson(Map<String, dynamic> json) => Tip(
      id: json['id'] as int?,
      text: json['text'] as String?,
      author: json['author'] as String?,
      upvotes:
          (json['upvotes'] as List<dynamic>?)?.map((e) => e as int).toList(),
      downvotes: (json['downvotes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$TipToJson(Tip instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'author': instance.author,
      'upvotes': instance.upvotes,
      'downvotes': instance.downvotes,
    };
