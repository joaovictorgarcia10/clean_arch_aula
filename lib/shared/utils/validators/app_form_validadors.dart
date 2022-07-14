import 'package:localization/localization.dart';

class AppFormValidadors {
  // Generic
  String? genericValidator(String? text) {
    if (text == null || text.isEmpty) {
      return "validator_generic_label".i18n();
    }
    return null;
  }

  // CEP
  String? cepValidator(String? text) {
    if (text == null || text.isEmpty) {
      return "validator_generic_label".i18n();
    }
    if (text.length != 9) {
      return "validator_cep_label".i18n();
    }
    return null;
  }

  //Email
  String? emailValidator(String? text) {
    if (text == null || text.isEmpty) {
      return "validator_generic_label".i18n();
    }
    if (!text.contains("@")) {
      return "validator_email_label".i18n();
    }
    return null;
  }

  // Password
  String? passwordValidator(String? text) {
    if (text == null || text.isEmpty) {
      return "validator_generic_label".i18n();
    }
    if (text.length < 6) {
      return "validator_password_label".i18n();
    }
    return null;
  }

  // Confirm Password
  String? confirmPasswordValidator(
      {String? confirmPassword, required String password}) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "validator_generic_label".i18n();
    }
    if (confirmPassword.length < 6) {
      return "validator_password_label".i18n();
    }
    if (confirmPassword != password) {
      return "validator_confirm_password_label".i18n();
    }
    return null;
  }
}
