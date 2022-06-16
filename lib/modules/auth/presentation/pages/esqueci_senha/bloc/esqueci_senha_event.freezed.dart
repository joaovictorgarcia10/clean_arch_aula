// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'esqueci_senha_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EsqueciSenhaEventTearOff {
  const _$EsqueciSenhaEventTearOff();

  _$EsqueciSenhaEventResetPassword resetPassword({required String email}) {
    return _$EsqueciSenhaEventResetPassword(
      email: email,
    );
  }
}

/// @nodoc
const $EsqueciSenhaEvent = _$EsqueciSenhaEventTearOff();

/// @nodoc
mixin _$EsqueciSenhaEvent {
  String get email => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? resetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$EsqueciSenhaEventResetPassword value)
        resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_$EsqueciSenhaEventResetPassword value)? resetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$EsqueciSenhaEventResetPassword value)? resetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EsqueciSenhaEventCopyWith<EsqueciSenhaEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EsqueciSenhaEventCopyWith<$Res> {
  factory $EsqueciSenhaEventCopyWith(
          EsqueciSenhaEvent value, $Res Function(EsqueciSenhaEvent) then) =
      _$EsqueciSenhaEventCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class _$EsqueciSenhaEventCopyWithImpl<$Res>
    implements $EsqueciSenhaEventCopyWith<$Res> {
  _$EsqueciSenhaEventCopyWithImpl(this._value, this._then);

  final EsqueciSenhaEvent _value;
  // ignore: unused_field
  final $Res Function(EsqueciSenhaEvent) _then;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$EsqueciSenhaEventResetPasswordCopyWith<$Res>
    implements $EsqueciSenhaEventCopyWith<$Res> {
  factory _$$EsqueciSenhaEventResetPasswordCopyWith(
          _$EsqueciSenhaEventResetPassword value,
          $Res Function(_$EsqueciSenhaEventResetPassword) then) =
      __$$EsqueciSenhaEventResetPasswordCopyWithImpl<$Res>;
  @override
  $Res call({String email});
}

/// @nodoc
class __$$EsqueciSenhaEventResetPasswordCopyWithImpl<$Res>
    extends _$EsqueciSenhaEventCopyWithImpl<$Res>
    implements _$$EsqueciSenhaEventResetPasswordCopyWith<$Res> {
  __$$EsqueciSenhaEventResetPasswordCopyWithImpl(
      _$EsqueciSenhaEventResetPassword _value,
      $Res Function(_$EsqueciSenhaEventResetPassword) _then)
      : super(_value, (v) => _then(v as _$EsqueciSenhaEventResetPassword));

  @override
  _$EsqueciSenhaEventResetPassword get _value =>
      super._value as _$EsqueciSenhaEventResetPassword;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_$EsqueciSenhaEventResetPassword(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_$EsqueciSenhaEventResetPassword
    implements _$EsqueciSenhaEventResetPassword {
  const _$_$EsqueciSenhaEventResetPassword({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'EsqueciSenhaEvent.resetPassword(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EsqueciSenhaEventResetPassword &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$$EsqueciSenhaEventResetPasswordCopyWith<_$EsqueciSenhaEventResetPassword>
      get copyWith => __$$EsqueciSenhaEventResetPasswordCopyWithImpl<
          _$EsqueciSenhaEventResetPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) resetPassword,
  }) {
    return resetPassword(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? resetPassword,
  }) {
    return resetPassword?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? resetPassword,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$EsqueciSenhaEventResetPassword value)
        resetPassword,
  }) {
    return resetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_$EsqueciSenhaEventResetPassword value)? resetPassword,
  }) {
    return resetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$EsqueciSenhaEventResetPassword value)? resetPassword,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(this);
    }
    return orElse();
  }
}

abstract class _$EsqueciSenhaEventResetPassword implements EsqueciSenhaEvent {
  const factory _$EsqueciSenhaEventResetPassword({required String email}) =
      _$_$EsqueciSenhaEventResetPassword;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$EsqueciSenhaEventResetPasswordCopyWith<_$EsqueciSenhaEventResetPassword>
      get copyWith => throw _privateConstructorUsedError;
}
