import 'package:clean_arch_aula/shared/features/session/domain/entities/session.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/modules/enderecos/shared/models/endereco_model.dart';

abstract class MeusEnderecosDatasource {
  Future<Either<Failure, List<EnderecoModel>>> getListaEnderecos();
  Future<Either<Failure, bool>> deleteEndereco({required String idEndereco});
}

class MeusEnderecosDatasourceImpl implements MeusEnderecosDatasource {
  final FirebaseFirestore firebaseFirestore;

  MeusEnderecosDatasourceImpl({
    required this.firebaseFirestore,
  });

  @override
  Future<Either<Failure, List<EnderecoModel>>> getListaEnderecos() async {
    try {
      final userId = Modular.get<Session>().usuario!.userId;

      final response = firebaseFirestore
          .collection("enderecos")
          .where("userId", isEqualTo: userId);

      final List<EnderecoModel> enderecos = await response.get().then((query) =>
          query.docs.map((e) => EnderecoModel.fromFirebase(e)).toList());

      return Right(enderecos);
    } on FirebaseException catch (_) {
      return Left(Failure(message: ServerFailure().message));
    } catch (e) {
      return Left(Failure(message: ServerFailure().message));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteEndereco(
      {required String idEndereco}) async {
    try {
      if (idEndereco.isNotEmpty) {
        await firebaseFirestore
            .collection("enderecos")
            .doc(idEndereco)
            .delete();

        return const Right(true);
      } else {
        return Left(Failure(message: ServerFailure().message));
      }
    } on FirebaseException catch (_) {
      return Left(Failure(message: ServerFailure().message));
    } catch (e) {
      return Left(Failure(message: ServerFailure().message));
    }
  }
}
