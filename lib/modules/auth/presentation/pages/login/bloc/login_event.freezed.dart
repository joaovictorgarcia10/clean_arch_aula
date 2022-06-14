// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DoLoginEventTearOff {
  const _$DoLoginEventTearOff();

  _$DoLoginEventLogin login({required DoLoginParams params}) {
    return _$DoLoginEventLogin(
      params: params,
    );
  }
}

/// @nodoc
const $DoLoginEvent = _$DoLoginEventTearOff();

/// @nodoc
mixin _$DoLoginEvent {
  DoLoginParams get params => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DoLoginParams params) login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DoLoginParams params)? login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DoLoginParams params)? login,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$DoLoginEventLogin value) login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_$DoLoginEventLogin value)? login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$DoLoginEventLogin value)? login,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DoLoginEventCopyWith<DoLoginEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoLoginEventCopyWith<$Res> {
  factory $DoLoginEventCopyWith(
          DoLoginEvent value, $Res Function(DoLoginEvent) then) =
      _$DoLoginEventCopyWithImpl<$Res>;
  $Res call({DoLoginParams params});
}

/// @nodoc
class _$DoLoginEventCopyWithImpl<$Res> implements $DoLoginEventCopyWith<$Res> {
  _$DoLoginEventCopyWithImpl(this._value, this._then);

  final DoLoginEvent _value;
  // ignore: unused_field
  final $Res Function(DoLoginEvent) _then;

  @override
  $Res call({
    Object? params = freezed,
  }) {
    return _then(_value.copyWith(
      params: params == freezed
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as DoLoginParams,
    ));
  }
}

/// @nodoc
abstract class _$$DoLoginEventLoginCopyWith<$Res>
    implements $DoLoginEventCopyWith<$Res> {
  factory _$$DoLoginEventLoginCopyWith(
          _$DoLoginEventLogin value, $Res Function(_$DoLoginEventLogin) then) =
      __$$DoLoginEventLoginCopyWithImpl<$Res>;
  @override
  $Res call({DoLoginParams params});
}

/// @nodoc
class __$$DoLoginEventLoginCopyWithImpl<$Res>
    extends _$DoLoginEventCopyWithImpl<$Res>
    implements _$$DoLoginEventLoginCopyWith<$Res> {
  __$$DoLoginEventLoginCopyWithImpl(
      _$DoLoginEventLogin _value, $Res Function(_$DoLoginEventLogin) _then)
      : super(_value, (v) => _then(v as _$DoLoginEventLogin));

  @override
  _$DoLoginEventLogin get _value => super._value as _$DoLoginEventLogin;

  @override
  $Res call({
    Object? params = freezed,
  }) {
    return _then(_$DoLoginEventLogin(
      params: params == freezed
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as DoLoginParams,
    ));
  }
}

/// @nodoc

class _$_$DoLoginEventLogin implements _$DoLoginEventLogin {
  const _$_$DoLoginEventLogin({required this.params});

  @override
  final DoLoginParams params;

  @override
  String toString() {
    return 'DoLoginEvent.login(params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoLoginEventLogin &&
            const DeepCollectionEquality().equals(other.params, params));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(params));

  @JsonKey(ignore: true)
  @override
  _$$DoLoginEventLoginCopyWith<_$DoLoginEventLogin> get copyWith =>
      __$$DoLoginEventLoginCopyWithImpl<_$DoLoginEventLogin>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DoLoginParams params) login,
  }) {
    return login(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DoLoginParams params)? login,
  }) {
    return login?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DoLoginParams params)? login,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$DoLoginEventLogin value) login,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_$DoLoginEventLogin value)? login,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$DoLoginEventLogin value)? login,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _$DoLoginEventLogin implements DoLoginEvent {
  const factory _$DoLoginEventLogin({required DoLoginParams params}) =
      _$_$DoLoginEventLogin;

  @override
  DoLoginParams get params;
  @override
  @JsonKey(ignore: true)
  _$$DoLoginEventLoginCopyWith<_$DoLoginEventLogin> get copyWith =>
      throw _privateConstructorUsedError;
}
