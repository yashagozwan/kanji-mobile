// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kanji_example_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KanjiExampleModel _$KanjiExampleModelFromJson(Map<String, dynamic> json) {
  return _KanjiExampleModel.fromJson(json);
}

/// @nodoc
mixin _$KanjiExampleModel {
  String get example => throw _privateConstructorUsedError;
  String get reading => throw _privateConstructorUsedError;
  String get meaning => throw _privateConstructorUsedError;
  String get romaji => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KanjiExampleModelCopyWith<KanjiExampleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KanjiExampleModelCopyWith<$Res> {
  factory $KanjiExampleModelCopyWith(
          KanjiExampleModel value, $Res Function(KanjiExampleModel) then) =
      _$KanjiExampleModelCopyWithImpl<$Res, KanjiExampleModel>;
  @useResult
  $Res call({String example, String reading, String meaning, String romaji});
}

/// @nodoc
class _$KanjiExampleModelCopyWithImpl<$Res, $Val extends KanjiExampleModel>
    implements $KanjiExampleModelCopyWith<$Res> {
  _$KanjiExampleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? example = null,
    Object? reading = null,
    Object? meaning = null,
    Object? romaji = null,
  }) {
    return _then(_value.copyWith(
      example: null == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as String,
      reading: null == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: null == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String,
      romaji: null == romaji
          ? _value.romaji
          : romaji // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KanjiExampleModelCopyWith<$Res>
    implements $KanjiExampleModelCopyWith<$Res> {
  factory _$$_KanjiExampleModelCopyWith(_$_KanjiExampleModel value,
          $Res Function(_$_KanjiExampleModel) then) =
      __$$_KanjiExampleModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String example, String reading, String meaning, String romaji});
}

/// @nodoc
class __$$_KanjiExampleModelCopyWithImpl<$Res>
    extends _$KanjiExampleModelCopyWithImpl<$Res, _$_KanjiExampleModel>
    implements _$$_KanjiExampleModelCopyWith<$Res> {
  __$$_KanjiExampleModelCopyWithImpl(
      _$_KanjiExampleModel _value, $Res Function(_$_KanjiExampleModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? example = null,
    Object? reading = null,
    Object? meaning = null,
    Object? romaji = null,
  }) {
    return _then(_$_KanjiExampleModel(
      example: null == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as String,
      reading: null == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: null == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String,
      romaji: null == romaji
          ? _value.romaji
          : romaji // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KanjiExampleModel implements _KanjiExampleModel {
  const _$_KanjiExampleModel(
      {this.example = '',
      this.reading = '',
      this.meaning = '',
      this.romaji = ''});

  factory _$_KanjiExampleModel.fromJson(Map<String, dynamic> json) =>
      _$$_KanjiExampleModelFromJson(json);

  @override
  @JsonKey()
  final String example;
  @override
  @JsonKey()
  final String reading;
  @override
  @JsonKey()
  final String meaning;
  @override
  @JsonKey()
  final String romaji;

  @override
  String toString() {
    return 'KanjiExampleModel(example: $example, reading: $reading, meaning: $meaning, romaji: $romaji)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KanjiExampleModel &&
            (identical(other.example, example) || other.example == example) &&
            (identical(other.reading, reading) || other.reading == reading) &&
            (identical(other.meaning, meaning) || other.meaning == meaning) &&
            (identical(other.romaji, romaji) || other.romaji == romaji));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, example, reading, meaning, romaji);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KanjiExampleModelCopyWith<_$_KanjiExampleModel> get copyWith =>
      __$$_KanjiExampleModelCopyWithImpl<_$_KanjiExampleModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KanjiExampleModelToJson(
      this,
    );
  }
}

abstract class _KanjiExampleModel implements KanjiExampleModel {
  const factory _KanjiExampleModel(
      {final String example,
      final String reading,
      final String meaning,
      final String romaji}) = _$_KanjiExampleModel;

  factory _KanjiExampleModel.fromJson(Map<String, dynamic> json) =
      _$_KanjiExampleModel.fromJson;

  @override
  String get example;
  @override
  String get reading;
  @override
  String get meaning;
  @override
  String get romaji;
  @override
  @JsonKey(ignore: true)
  _$$_KanjiExampleModelCopyWith<_$_KanjiExampleModel> get copyWith =>
      throw _privateConstructorUsedError;
}
