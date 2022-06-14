import 'package:clean_arch_aula/modules/auth/domain/usecases/create_account.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/cadastro/bloc/cadastro_event.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/cadastro/bloc/cadastro_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CadastroBloc extends Bloc<CadastroEvent, CadastroState> {
  final CreateAccount _createAccount;

  CadastroBloc(
    this._createAccount,
  ) : super(const CadastroState.empty()) {
    on<CadastroEvent>(_onEvent);
  }

  Future<void> _onEvent(
      CadastroEvent event, Emitter<CadastroState> emit) async {
    emit(const CadastroState.loading());
    await event.when(
      createAccount: (params) async {
        final result = await _createAccount(params);
        result.fold(
          (l) => emit(CadastroState.failure(failure: l)),
          (r) => emit(const CadastroState.success()),
        );
      },
    );
  }
}
