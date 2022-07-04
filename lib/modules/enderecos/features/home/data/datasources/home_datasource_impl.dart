import 'package:clean_arch_aula/modules/enderecos/shared/entities/endereco.dart';
import 'package:clean_arch_aula/modules/enderecos/shared/models/endereco_model.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/shared/core/services/http_service/http_service.dart';
import 'package:clean_arch_aula/shared/core/session/session.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'home_datasource.dart';

class HomeDatasourceImpl implements HomeDatasource {
  final HttpService httpService;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;

  HomeDatasourceImpl({
    required this.httpService,
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });

  @override
  Future<Either<Failure, EnderecoModel>> buscarEndreco(
      {required String cep}) async {
    try {
      final result =
          await httpService.get(path: "https://viacep.com.br/ws/$cep/json/");
      if (result.statusCode == 200 && result.data != null) {
        return Right(EnderecoModel.fromMap(result.data));
      } else {
        throw ServerFailure().message;
      }
    } on DioError catch (_) {
      return Left(Failure(message: NotFoundFailure().message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> saveEndereco(
      {required Endereco endereco}) async {
    try {
      final response = firebaseFirestore.collection("enderecos");

      final map = {
        "cep": endereco.cep,
        "logradouro": endereco.logradouro,
        "complemento": endereco.complemento,
        "bairro": endereco.bairro,
        "localidade": endereco.localidade,
        "uf": endereco.uf,
        "ddd": endereco.ddd,
        "documentReference": endereco.documentReference,
        "userId": GetIt.I.get<Session>().usuario!.userId,
      };

      response.add(map);

      return const Right(true);
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.toString()));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> disconnetAccount() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      await firebaseAuth.signOut();
      return const Right(true);
    } on FirebaseAuthException catch (_) {
      return Left(Failure(message: ServerFailure().message));
    } catch (e) {
      return Left(Failure(message: ServerFailure().message));
    }
  }
}
