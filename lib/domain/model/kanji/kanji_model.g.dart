// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kanji_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KanjiModel _$$_KanjiModelFromJson(Map<String, dynamic> json) =>
    _$_KanjiModel(
      kanji: json['kanji'] as String? ?? '',
      jlptLevel: json['jlptLevel'] as String? ?? '',
      kunyomi: (json['kunyomi'] as List<dynamic>?)?.map((e) => e as String) ??
          const [],
      onyomi: (json['onyomi'] as List<dynamic>?)?.map((e) => e as String) ??
          const [],
      onyomiExamples: (json['onyomiExamples'] as List<dynamic>?)?.map(
              (e) => KanjiExampleModel.fromJson(e as Map<String, dynamic>)) ??
          const [],
      kunyomiExamples: (json['kunyomiExamples'] as List<dynamic>?)?.map(
              (e) => KanjiExampleModel.fromJson(e as Map<String, dynamic>)) ??
          const [],
      strokeCount: json['strokeCount'] as int? ?? 0,
      meaning: json['meaning'] as String? ?? '',
    );

Map<String, dynamic> _$$_KanjiModelToJson(_$_KanjiModel instance) =>
    <String, dynamic>{
      'kanji': instance.kanji,
      'jlptLevel': instance.jlptLevel,
      'kunyomi': instance.kunyomi.toList(),
      'onyomi': instance.onyomi.toList(),
      'onyomiExamples': instance.onyomiExamples.toList(),
      'kunyomiExamples': instance.kunyomiExamples.toList(),
      'strokeCount': instance.strokeCount,
      'meaning': instance.meaning,
    };
