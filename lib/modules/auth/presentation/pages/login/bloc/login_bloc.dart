import 'package:clean_arch_aula/modules/auth/domain/usecases/do_login.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/login/bloc/login_event.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/login/bloc/login_state.dart';
import 'package:clean_arch_aula/shared/core/session/session.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginBloc extends Bloc<DoLoginEvent, DoLoginState> {
  final DoLogin _doLogin;

  LoginBloc(
    this._doLogin,
  ) : super(const DoLoginState.empty()) {
    on<DoLoginEvent>(_onEvent);
  }

  Future<void> _onEvent(
    DoLoginEvent event,
    Emitter<DoLoginState> emit,
  ) async {
    emit(const DoLoginState.loading());
    await event.when(
      login: (params) async {
        final result = await _doLogin(
            DoLoginParams(email: params.email, password: params.password));
        result.fold(
          (l) => emit(DoLoginState.failure(failure: l)),
          (r) => emit(DoLoginState.success(user: r)),
        );
      },
    );
  }

  @override
  void onTransition(Transition<DoLoginEvent, DoLoginState> transition) {
    super.onTransition(transition);
    final state = transition.nextState;
    state.maybeWhen(
      success: (user) => Modular.get<Session>().usuario = user,
      orElse: () {},
    );
  }
}
