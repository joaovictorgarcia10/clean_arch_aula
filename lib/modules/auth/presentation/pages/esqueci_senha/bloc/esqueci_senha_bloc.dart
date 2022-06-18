import 'package:clean_arch_aula/modules/auth/domain/usecases/reset_password.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_arch_aula/modules/auth/presentation/pages/esqueci_senha/bloc/esqueci_senha_event.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/esqueci_senha/bloc/esqueci_senha_state.dart';

class EsqueciSenhaBloc extends Bloc<EsqueciSenhaEvent, EsqueciSenhaState> {
  final ResetPassword _resetPassword;

  EsqueciSenhaBloc(
    this._resetPassword,
  ) : super(const EsqueciSenhaState.empty()) {
    on<EsqueciSenhaEvent>(_onEvent);
  }

  Future<void> _onEvent(
    EsqueciSenhaEvent event,
    Emitter<EsqueciSenhaState> emit,
  ) async {
    await event.when(
      resetPassword: (email) async {
        emit(const EsqueciSenhaState.loading());
        final result = await _resetPassword(email);
        result.fold(
          (l) => emit(EsqueciSenhaState.failure(failure: l)),
          (r) => emit(const EsqueciSenhaState.success()),
        );
      },
    );
  }
}
