import 'package:clean_arch_aula/modules/enderecos/features/home/domain/usecases/buscar_endreco.dart';
import 'package:clean_arch_aula/modules/enderecos/features/home/domain/usecases/disconnect_account.dart';
import 'package:clean_arch_aula/modules/enderecos/features/home/domain/usecases/save_endereco.dart';
import 'package:clean_arch_aula/modules/enderecos/features/home/presentation/pages/home_page/bloc/home_event.dart';
import 'package:clean_arch_aula/modules/enderecos/features/home/presentation/pages/home_page/bloc/home_state.dart';
import 'package:clean_arch_aula/shared/core/session/session.dart';
import 'package:clean_arch_aula/modules/auth/domain/entities/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BuscarEndreco _buscarEndreco;
  final SaveEndereco _saveEndereco;
  final DisconnectAccount _disconnectAccount;

  HomeBloc(
    this._buscarEndreco,
    this._saveEndereco,
    this._disconnectAccount,
  ) : super(const HomeState.empty()) {
    on<HomeEvent>(_onEvent);
  }

  Future<void> _onEvent(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());
    await event.when(
      buscarEndereco: (params) async {
        final result = await _buscarEndreco(params);
        result.fold(
          (l) => emit(HomeState.failure(failure: l)),
          (r) => emit(HomeState.buscarEnderecoSuccess(endereco: r)),
        );
      },
      saveEndereco: (endereco) async {
        final result = await _saveEndereco(endereco);
        result.fold(
          (l) => emit(HomeState.failure(failure: l)),
          (r) => emit(const HomeState.saveEnderecoSuccess()),
        );
      },
      disconnectAccount: () async {
        final result = await _disconnectAccount();
        result.fold(
          (l) => emit(HomeState.failure(failure: l)),
          (r) => emit(const HomeState.disconnectAccountSuccess()),
        );
      },
    );
  }

  @override
  void onTransition(Transition<HomeEvent, HomeState> transition) {
    super.onTransition(transition);
    final state = transition.nextState;
    state.maybeWhen(
      disconnectAccountSuccess: () => Modular.get<Session>().usuario = null,
      orElse: () {},
    );
  }
}
