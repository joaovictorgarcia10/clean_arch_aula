import 'package:dartz/dartz.dart';
import '../error/failure.dart';

abstract class UsecaseCore<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams {}
