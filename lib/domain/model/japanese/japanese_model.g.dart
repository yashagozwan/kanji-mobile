// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'japanese_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JapaneseModel _$$_JapaneseModelFromJson(Map<String, dynamic> json) =>
    _$_JapaneseModel(
      jlpt: json['jlpt'] as String? ?? '',
      word: json['word'] as String? ?? '',
      reading: json['reading'] as String? ?? '',
      romaji: json['romaji'] as String? ?? '',
    );

Map<String, dynamic> _$$_JapaneseModelToJson(_$_JapaneseModel instance) =>
    <String, dynamic>{
      'jlpt': instance.jlpt,
      'word': instance.word,
      'reading': instance.reading,
      'romaji': instance.romaji,
    };
