import 'package:clean_arch_aula/modules/auth/domain/entities/user.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class DoLoginState with _$DoLoginState {
  const factory DoLoginState.empty() = _$DoLoginStateEmpty;
  const factory DoLoginState.loading() = _$DoLoginStateLoading;
  const factory DoLoginState.failure({required Failure failure}) =
      _$DoLoginStateFailure;
  const factory DoLoginState.success({required User user}) =
      _$DoLoginStateSuccess;
}
