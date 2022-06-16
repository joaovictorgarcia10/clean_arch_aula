import 'package:dartz/dartz.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/modules/enderecos/shared/models/endereco_model.dart';

abstract class HomeDatasource {
  Future<Either<Failure, EnderecoModel>> buscarEndreco({required String cep});
  Future<Either<Failure, bool>> saveEndereco({required EnderecoModel endereco});
  Future<Either<Failure, bool>> disconnetAccount();
}
