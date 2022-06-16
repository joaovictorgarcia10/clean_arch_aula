import 'package:freezed_annotation/freezed_annotation.dart';

part 'esqueci_senha_event.freezed.dart';

@freezed
class EsqueciSenhaEvent with _$EsqueciSenhaEvent {
  const factory EsqueciSenhaEvent.resetPassword({required String email}) =
      _$EsqueciSenhaEventResetPassword;
}
