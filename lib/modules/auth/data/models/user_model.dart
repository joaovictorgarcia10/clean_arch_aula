import 'dart:convert';
import 'package:clean_arch_aula/modules/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({String? nome, String? email, String? photoUrl, String? userId})
      : super(nome: nome, email: email, photoUrl: photoUrl, userId: userId);

  UserModel copyWith({
    String? nome,
    String? email,
    String? photoUrl,
    String? userId,
  }) {
    return UserModel(
      nome: nome ?? this.nome,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (nome != null) {
      result.addAll({'nome': nome});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (photoUrl != null) {
      result.addAll({'photoUrl': photoUrl});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      nome: map['nome'],
      email: map['email'],
      photoUrl: map['photoUrl'],
      userId: map['userId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(nome: $nome, email: $email, photoUrl: $photoUrl, userId: $userId)';
  }
}
