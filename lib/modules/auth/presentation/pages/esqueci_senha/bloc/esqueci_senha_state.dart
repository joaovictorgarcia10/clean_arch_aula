import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'esqueci_senha_state.freezed.dart';

@freezed
class EsqueciSenhaState with _$EsqueciSenhaState {
  const factory EsqueciSenhaState.empty() = _$EsqueciSenhaStateEmpty;
  const factory EsqueciSenhaState.loading() = _$EsqueciSenhaStateLoading;
  const factory EsqueciSenhaState.failure({required Failure failure}) =
      _$EsqueciSenhaStateFailure;
  const factory EsqueciSenhaState.success() = _$EsqueciSenhaStateSuccess;
}
