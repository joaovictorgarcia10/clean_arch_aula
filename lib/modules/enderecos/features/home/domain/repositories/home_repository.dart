import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/modules/enderecos/shared/models/endereco_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, EnderecoModel>> buscarEndereco({required String cep});
  Future<Either<Failure, bool>> saveEndereco({required EnderecoModel endereco});
  Future<Either<Failure, bool>> disconnet();
}
