class AppFormValidadors {
  // Generic
  String? genericValidator(String? text) {
    if (text == null || text.isEmpty) {
      return "Este campo deve ser preenchido";
    }
    return null;
  }

  // CEP
  String? cepValidator(String? text) {
    if (text == null || text.isEmpty) {
      return "Este campo deve ser preenchido";
    }
    if (text.length != 9) {
      return "Preencha com um CEP válido";
    }
    return null;
  }

  //Email
  String? emailValidator(String? text) {
    if (text == null || text.isEmpty) {
      return "Este campo deve ser preenchido";
    }
    if (!text.contains("@")) {
      return "Preencha com um email válido";
    }
    return null;
  }

  // Password
  String? passwordValidator(String? text) {
    if (text == null || text.isEmpty) {
      return "Este campo deve ser preenchido";
    }
    if (text.length < 6) {
      return "Sua senha deve ter pelo menos 6 dígitos";
    }
    return null;
  }

  // Confirm Password
  String? confirmPasswordValidator(
      {String? confirmPassword, required String password}) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Este campo deve ser preenchido";
    }
    if (confirmPassword.length < 6) {
      return "Sua senha deve ter pelo menos 6 dígitos";
    }
    if (confirmPassword != password) {
      return "As senhas estão diferentes";
    }
    return null;
  }
}
