class Failure implements Exception {
  final String? message;
  Failure({this.message});
}

class ServerFailure extends Failure {
  @override
  String get message =>
      "Não foi possível processar seu pedido, tente novamente mais tarde.";
}

class NotFoundFailure extends Failure {
  @override
  String get message => "Endereço não encontrado...";
}

class UserNotFoundFailure extends Failure {
  @override
  String get message => "Endereço de email não encontrado.";
}

class IncorrectPasswordFailure extends Failure {
  @override
  String get message => "Email ou senha incorretos.";
}

class EmailAlreadyInUseFailure extends Failure {
  @override
  String get message => "Já existe uma conta vinculada a este email.";
}

class GeolocationPermissionDeniedFailure extends Failure {
  @override
  String get message => "Você precisa autorizar o acesso a localização.";
}

class GeolocationNotActiveFailure extends Failure {
  @override
  String get message => "Por favor habilite a localização";
}
