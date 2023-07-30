// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'japanese_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JapaneseModel _$JapaneseModelFromJson(Map<String, dynamic> json) {
  return _JapaneseModel.fromJson(json);
}

/// @nodoc
mixin _$JapaneseModel {
  String get jlpt => throw _privateConstructorUsedError;
  String get word => throw _privateConstructorUsedError;
  String get reading => throw _privateConstructorUsedError;
  String get romaji => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JapaneseModelCopyWith<JapaneseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JapaneseModelCopyWith<$Res> {
  factory $JapaneseModelCopyWith(
          JapaneseModel value, $Res Function(JapaneseModel) then) =
      _$JapaneseModelCopyWithImpl<$Res, JapaneseModel>;
  @useResult
  $Res call({String jlpt, String word, String reading, String romaji});
}

/// @nodoc
class _$JapaneseModelCopyWithImpl<$Res, $Val extends JapaneseModel>
    implements $JapaneseModelCopyWith<$Res> {
  _$JapaneseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jlpt = null,
    Object? word = null,
    Object? reading = null,
    Object? romaji = null,
  }) {
    return _then(_value.copyWith(
      jlpt: null == jlpt
          ? _value.jlpt
          : jlpt // ignore: cast_nullable_to_non_nullable
              as String,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      reading: null == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
      romaji: null == romaji
          ? _value.romaji
          : romaji // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JapaneseModelCopyWith<$Res>
    implements $JapaneseModelCopyWith<$Res> {
  factory _$$_JapaneseModelCopyWith(
          _$_JapaneseModel value, $Res Function(_$_JapaneseModel) then) =
      __$$_JapaneseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String jlpt, String word, String reading, String romaji});
}

/// @nodoc
class __$$_JapaneseModelCopyWithImpl<$Res>
    extends _$JapaneseModelCopyWithImpl<$Res, _$_JapaneseModel>
    implements _$$_JapaneseModelCopyWith<$Res> {
  __$$_JapaneseModelCopyWithImpl(
      _$_JapaneseModel _value, $Res Function(_$_JapaneseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jlpt = null,
    Object? word = null,
    Object? reading = null,
    Object? romaji = null,
  }) {
    return _then(_$_JapaneseModel(
      jlpt: null == jlpt
          ? _value.jlpt
          : jlpt // ignore: cast_nullable_to_non_nullable
              as String,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      reading: null == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
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
class _$_JapaneseModel implements _JapaneseModel {
  const _$_JapaneseModel(
      {this.jlpt = '', this.word = '', this.reading = '', this.romaji = ''});

  factory _$_JapaneseModel.fromJson(Map<String, dynamic> json) =>
      _$$_JapaneseModelFromJson(json);

  @override
  @JsonKey()
  final String jlpt;
  @override
  @JsonKey()
  final String word;
  @override
  @JsonKey()
  final String reading;
  @override
  @JsonKey()
  final String romaji;

  @override
  String toString() {
    return 'JapaneseModel(jlpt: $jlpt, word: $word, reading: $reading, romaji: $romaji)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JapaneseModel &&
            (identical(other.jlpt, jlpt) || other.jlpt == jlpt) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.reading, reading) || other.reading == reading) &&
            (identical(other.romaji, romaji) || other.romaji == romaji));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, jlpt, word, reading, romaji);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JapaneseModelCopyWith<_$_JapaneseModel> get copyWith =>
      __$$_JapaneseModelCopyWithImpl<_$_JapaneseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JapaneseModelToJson(
      this,
    );
  }
}

abstract class _JapaneseModel implements JapaneseModel {
  const factory _JapaneseModel(
      {final String jlpt,
      final String word,
      final String reading,
      final String romaji}) = _$_JapaneseModel;

  factory _JapaneseModel.fromJson(Map<String, dynamic> json) =
      _$_JapaneseModel.fromJson;

  @override
  String get jlpt;
  @override
  String get word;
  @override
  String get reading;
  @override
  String get romaji;
  @override
  @JsonKey(ignore: true)
  _$$_JapaneseModelCopyWith<_$_JapaneseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
