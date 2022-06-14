import 'package:clean_arch_aula/modules/auth/domain/usecases/do_login.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.freezed.dart';

@freezed
class DoLoginEvent with _$DoLoginEvent {
  const factory DoLoginEvent.login({required DoLoginParams params}) =
      _$DoLoginEventLogin;
}
