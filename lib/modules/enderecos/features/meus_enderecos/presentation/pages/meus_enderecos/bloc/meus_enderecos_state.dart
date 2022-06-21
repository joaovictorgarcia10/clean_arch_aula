import 'package:clean_arch_aula/modules/enderecos/shared/entities/endereco.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/modules/enderecos/shared/models/endereco_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meus_enderecos_state.freezed.dart';

@freezed
class MeusEnderecosState with _$MeusEnderecosState {
  const factory MeusEnderecosState.empty() = _$MeusEnderecosStateEmpty;
  const factory MeusEnderecosState.loading() = _$MeusEnderecosStateLoading;
  const factory MeusEnderecosState.failure({required Failure failure}) =
      _$MeusEnderecosStateFailure;
  const factory MeusEnderecosState.getListaEnderecosSuccess(
          {required List<Endereco> listaEnderecos}) =
      _$MeusEnderecosStateGetListaEnderecosSuccess;
}
