import 'package:cloud_firestore/cloud_firestore.dart';

class Endereco {
  final String? cep;
  final String? logradouro;
  final String? complemento;
  final String? bairro;
  final String? localidade;
  final String? uf;
  final String? ddd;
  final DocumentReference? documentReference;
  final String? userId;

  Endereco({
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.localidade,
    this.uf,
    this.ddd,
    this.documentReference,
    this.userId,
  });
}
