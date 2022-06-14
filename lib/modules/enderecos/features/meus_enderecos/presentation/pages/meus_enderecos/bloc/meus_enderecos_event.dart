import 'package:freezed_annotation/freezed_annotation.dart';
part 'meus_enderecos_event.freezed.dart';

@freezed
class MeusEnderecosEvent with _$MeusEnderecosEvent {
  const factory MeusEnderecosEvent.getListaEnderecos() =
      _$MeusEnderecosEventGetListaEnderecos;
}
