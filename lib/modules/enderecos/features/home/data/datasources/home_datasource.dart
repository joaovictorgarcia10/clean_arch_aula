import 'package:clean_arch_aula/modules/enderecos/shared/entities/endereco.dart';
import 'package:clean_arch_aula/modules/enderecos/shared/models/endereco_model.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';

abstract class HomeDatasource {
  Future<Either<Failure, EnderecoModel>> buscarEndreco({required String cep});
  Future<Either<Failure, bool>> saveEndereco({required Endereco endereco});
  Future<Either<Failure, bool>> disconnetAccount();
}
