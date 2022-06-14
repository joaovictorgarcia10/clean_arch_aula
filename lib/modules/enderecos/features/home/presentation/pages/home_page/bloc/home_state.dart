import 'package:clean_arch_aula/modules/enderecos/shared/models/endereco_model.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.empty() = _$HomeStateEmpty;
  const factory HomeState.loading() = _$HomeStateLoading;
  const factory HomeState.failure({required Failure failure}) =
      _$HomeStateFailure;
  const factory HomeState.buscarEnderecoSuccess(
      {required EnderecoModel endereco}) = _$HomeStateBuscarEnderecoSuccess;
  const factory HomeState.saveEnderecoSuccess() =
      _$HomeStateSaveEnderecoSuccess;
  const factory HomeState.disconnectAccountSuccess() =
      _$HomeStateDisconnectAccountSuccess;
}
