import 'package:clean_arch_aula/modules/auth/data/models/user_model.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_datasource.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final FirebaseAuth firebaseAuth;
  AuthDatasourceImpl({required this.firebaseAuth});

  @override
  Future<Either<Failure, UserModel>> doLogin(
      {required String email, required String password}) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = UserModel(
        email: result.user?.email,
        nome: result.user?.displayName,
        photoUrl: result.user?.photoURL,
        userId: result.user?.uid,
      );

      return Right(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        return Left(Failure(message: UserNotFoundFailure().message));
      } else if (e.code == "wrong-password") {
        return Left(Failure(message: IncorrectPasswordFailure().message));
      }
      return Left(Failure(message: ServerFailure().message));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> createAccount(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return const Right(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return Left(Failure(message: EmailAlreadyInUseFailure().message));
      }
      return Left(Failure(message: ServerFailure().message));
    } catch (e) {
      return Left(Failure(message: ServerFailure().message));
    }
  }

  @override
  Future<Either<Failure, bool>> resetPassword({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);

      return const Right(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        return Left(Failure(message: UserNotFoundFailure().message));
      }
      return Left(Failure(message: ServerFailure().message));
    } catch (e) {
      return Left(Failure(message: ServerFailure().message));
    }
  }
}
