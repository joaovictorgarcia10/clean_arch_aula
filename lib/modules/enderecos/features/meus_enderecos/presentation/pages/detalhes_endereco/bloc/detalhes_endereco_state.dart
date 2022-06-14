import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/shared/features/geolocation/domain/entities/geolocation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detalhes_endereco_state.freezed.dart';

@freezed
class DetalhesEnderecoState with _$DetalhesEnderecoState {
  const factory DetalhesEnderecoState.empty() = _$DetalhesEnderecoStateEmpty;
  const factory DetalhesEnderecoState.loading() =
      _$DetalhesEnderecoStateLoading;
  const factory DetalhesEnderecoState.failure({required Failure failure}) =
      _$DetalhesEnderecoStateFailure;
  const factory DetalhesEnderecoState.deleteEnderecoSuccess() =
      _$DetalhesEnderecoStateDeleteEnderecoSuccess;
  const factory DetalhesEnderecoState.getGeoLocationSuccess(
          {required Geolocation geolocation}) =
      _$DetalhesEnderecoStateGetGeoLocationSuccess;
}
