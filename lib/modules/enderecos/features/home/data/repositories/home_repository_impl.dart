import 'package:clean_arch_aula/modules/enderecos/features/home/data/datasources/home_datasource.dart';
import 'package:clean_arch_aula/modules/enderecos/features/home/domain/repositories/home_repository.dart';
import 'package:clean_arch_aula/modules/enderecos/shared/models/endereco_model.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource _homeDatasource;
  HomeRepositoryImpl(this._homeDatasource);

  @override
  Future<Either<Failure, EnderecoModel>> buscarEndereco(
      {required String cep}) async {
    final result = await _homeDatasource.buscarEndreco(cep: cep);
    return result;
  }

  @override
  Future<Either<Failure, bool>> saveEndereco(
      {required EnderecoModel endereco}) async {
    final result = await _homeDatasource.saveEndereco(endereco: endereco);
    return result;
  }

  @override
  Future<Either<Failure, bool>> disconnet() {
    final result = _homeDatasource.disconnetAccount();
    return result;
  }
}
