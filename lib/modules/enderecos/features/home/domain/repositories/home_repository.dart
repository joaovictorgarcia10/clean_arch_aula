import 'package:clean_arch_aula/modules/enderecos/shared/entities/endereco.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, Endereco>> buscarEndereco({required String cep});
  Future<Either<Failure, bool>> saveEndereco({required Endereco endereco});
  Future<Either<Failure, bool>> disconnet();
}
