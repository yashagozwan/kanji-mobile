// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kanji_example_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KanjiExampleModel _$$_KanjiExampleModelFromJson(Map<String, dynamic> json) =>
    _$_KanjiExampleModel(
      example: json['example'] as String? ?? '',
      reading: json['reading'] as String? ?? '',
      meaning: json['meaning'] as String? ?? '',
      romaji: json['romaji'] as String? ?? '',
    );

Map<String, dynamic> _$$_KanjiExampleModelToJson(
        _$_KanjiExampleModel instance) =>
    <String, dynamic>{
      'example': instance.example,
      'reading': instance.reading,
      'meaning': instance.meaning,
      'romaji': instance.romaji,
    };
