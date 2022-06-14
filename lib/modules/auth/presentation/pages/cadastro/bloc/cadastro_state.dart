import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cadastro_state.freezed.dart';

@freezed
class CadastroState with _$CadastroState {
  const factory CadastroState.empty() = _$CadastroStateEmpty;
  const factory CadastroState.loading() = _$CadastroStateLoading;
  const factory CadastroState.failure({required Failure failure}) =
      _$CadastroStateFailure;
  const factory CadastroState.success() = _$CadastroStateSuccess;
}
