// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'start_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StartState {
  Status get status => throw _privateConstructorUsedError;
  AuthStatus get authStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StartStateCopyWith<StartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartStateCopyWith<$Res> {
  factory $StartStateCopyWith(
          StartState value, $Res Function(StartState) then) =
      _$StartStateCopyWithImpl<$Res, StartState>;
  @useResult
  $Res call({Status status, AuthStatus authStatus});
}

/// @nodoc
class _$StartStateCopyWithImpl<$Res, $Val extends StartState>
    implements $StartStateCopyWith<$Res> {
  _$StartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? authStatus = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      authStatus: null == authStatus
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StartStateCopyWith<$Res>
    implements $StartStateCopyWith<$Res> {
  factory _$$_StartStateCopyWith(
          _$_StartState value, $Res Function(_$_StartState) then) =
      __$$_StartStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, AuthStatus authStatus});
}

/// @nodoc
class __$$_StartStateCopyWithImpl<$Res>
    extends _$StartStateCopyWithImpl<$Res, _$_StartState>
    implements _$$_StartStateCopyWith<$Res> {
  __$$_StartStateCopyWithImpl(
      _$_StartState _value, $Res Function(_$_StartState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? authStatus = null,
  }) {
    return _then(_$_StartState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      authStatus: null == authStatus
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
    ));
  }
}

/// @nodoc

class _$_StartState implements _StartState {
  const _$_StartState(
      {this.status = Status.initial,
      this.authStatus = AuthStatus.unauthenticated});

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final AuthStatus authStatus;

  @override
  String toString() {
    return 'StartState(status: $status, authStatus: $authStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.authStatus, authStatus) ||
                other.authStatus == authStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, authStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartStateCopyWith<_$_StartState> get copyWith =>
      __$$_StartStateCopyWithImpl<_$_StartState>(this, _$identity);
}

abstract class _StartState implements StartState {
  const factory _StartState(
      {final Status status, final AuthStatus authStatus}) = _$_StartState;

  @override
  Status get status;
  @override
  AuthStatus get authStatus;
  @override
  @JsonKey(ignore: true)
  _$$_StartStateCopyWith<_$_StartState> get copyWith =>
      throw _privateConstructorUsedError;
}
