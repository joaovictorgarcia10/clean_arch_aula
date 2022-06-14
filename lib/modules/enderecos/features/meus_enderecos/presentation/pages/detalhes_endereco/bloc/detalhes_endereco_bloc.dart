import 'package:clean_arch_aula/modules/enderecos/features/meus_enderecos/domain/usecases/delete_endereco.dart';
import 'package:clean_arch_aula/modules/enderecos/features/meus_enderecos/presentation/pages/detalhes_endereco/bloc/detalhes_endereco_state.dart';
import 'package:clean_arch_aula/shared/features/geolocation/domain/usecase/get_geolocation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'detalhes_endereco_event.dart';

class DetalhesEnderecoBloc
    extends Bloc<DetalhesEnderecoEvent, DetalhesEnderecoState> {
  final DeleteEndereco _deleteEndereco;
  final GetGeolocation _getGeolocation;

  DetalhesEnderecoBloc(
    this._deleteEndereco,
    this._getGeolocation,
  ) : super(const DetalhesEnderecoState.empty()) {
    on<DetalhesEnderecoEvent>(_onEvent);
  }

  Future<void> _onEvent(
    DetalhesEnderecoEvent event,
    Emitter<DetalhesEnderecoState> emit,
  ) async {
    emit(const DetalhesEnderecoState.loading());

    await event.when(
      deleteEndereco: (params) async {
        final result = await _deleteEndereco(params);
        result.fold(
          (l) => emit(DetalhesEnderecoState.failure(failure: l)),
          (r) => emit(const DetalhesEnderecoState.deleteEnderecoSuccess()),
        );
      },
      getGeolocation: () async {
        final result = await _getGeolocation();
        result.fold(
          (l) => emit(DetalhesEnderecoState.failure(failure: l)),
          (r) =>
              emit(DetalhesEnderecoState.getGeoLocationSuccess(geolocation: r)),
        );
      },
    );
  }
}
