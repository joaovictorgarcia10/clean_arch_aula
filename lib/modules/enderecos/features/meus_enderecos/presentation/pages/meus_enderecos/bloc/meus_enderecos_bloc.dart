import 'package:clean_arch_aula/modules/enderecos/features/meus_enderecos/domain/usecases/get_lista_enderecos.dart';
import 'package:clean_arch_aula/modules/enderecos/features/meus_enderecos/presentation/pages/meus_enderecos/bloc/meus_enderecos_event.dart';
import 'package:clean_arch_aula/modules/enderecos/features/meus_enderecos/presentation/pages/meus_enderecos/bloc/meus_enderecos_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeusEnderecosBloc extends Bloc<MeusEnderecosEvent, MeusEnderecosState> {
  final GetListaEnderecos _getListaEnderecos;

  MeusEnderecosBloc(
    this._getListaEnderecos,
  ) : super(const MeusEnderecosState.empty()) {
    on<MeusEnderecosEvent>(_onEvent);
  }

  Future<void> _onEvent(
    MeusEnderecosEvent event,
    Emitter<MeusEnderecosState> emit,
  ) async {
    emit(const MeusEnderecosState.loading());
    await event.when(
      getListaEnderecos: () async {
        final result = await _getListaEnderecos();
        result.fold(
          (l) => emit(MeusEnderecosState.failure(failure: l)),
          (r) => emit(
              MeusEnderecosState.getListaEnderecosSuccess(listaEnderecos: r)),
        );
      },
    );
  }
}
