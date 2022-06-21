import 'package:clean_arch_aula/modules/enderecos/features/home/domain/usecases/buscar_endreco.dart';
import 'package:clean_arch_aula/modules/enderecos/shared/entities/endereco.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.buscarEndereco(
      {required BuscarEndrecoParams params}) = _$HomeEventBuscarEndereco;
  const factory HomeEvent.saveEndereco({required Endereco model}) =
      _$HomeEventSaveEndereco;
  const factory HomeEvent.disconnectAccount() = _$HomeEventDisconnectAccount;
}
