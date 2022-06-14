import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../entities/endereco.dart';

class EnderecoModel extends Endereco {
  EnderecoModel(
      {String? cep,
      String? logradouro,
      String? complemento,
      String? bairro,
      String? localidade,
      String? uf,
      String? ddd,
      DocumentReference? documentReference,
      String? userId})
      : super(
          cep: cep,
          logradouro: logradouro,
          complemento: complemento,
          bairro: bairro,
          localidade: localidade,
          uf: uf,
          ddd: ddd,
          documentReference: documentReference,
          userId: userId,
        );

  factory EnderecoModel.fromFirebase(DocumentSnapshot doc) {
    return EnderecoModel(
      cep: doc['cep'],
      logradouro: doc['logradouro'],
      complemento: doc['complemento'],
      bairro: doc['bairro'],
      localidade: doc['localidade'],
      uf: doc['uf'],
      ddd: doc['ddd'],
      documentReference: doc.reference,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (cep != null) {
      result.addAll({'cep': cep});
    }
    if (logradouro != null) {
      result.addAll({'logradouro': logradouro});
    }
    if (complemento != null) {
      result.addAll({'complemento': complemento});
    }
    if (bairro != null) {
      result.addAll({'bairro': bairro});
    }
    if (localidade != null) {
      result.addAll({'localidade': localidade});
    }
    if (uf != null) {
      result.addAll({'uf': uf});
    }
    if (ddd != null) {
      result.addAll({'ddd': ddd});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }

    return result;
  }

  factory EnderecoModel.fromMap(Map<String, dynamic> map) {
    return EnderecoModel(
      cep: map['cep'],
      logradouro: map['logradouro'],
      complemento: map['complemento'],
      bairro: map['bairro'],
      localidade: map['localidade'],
      uf: map['uf'],
      ddd: map['ddd'],
      userId: map['userId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EnderecoModel.fromJson(String source) =>
      EnderecoModel.fromMap(json.decode(source));
}
