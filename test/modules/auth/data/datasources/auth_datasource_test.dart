// TODO: descobrir como testar essas requests ao firebase


// import 'package:clean_arch_aula/modules/auth/data/datasources/auth_datasource.dart';
// import 'package:clean_arch_aula/modules/auth/data/datasources/auth_datasource_impl.dart';
// import 'package:clean_arch_aula/modules/auth/data/models/user_model.dart';
// import 'package:dartz/dartz.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';



// class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// void main() {
//   late MockFirebaseAuth firebaseAuth;
//   late AuthDatasource authDatasource;

//   setUp(() {
//     firebaseAuth = MockFirebaseAuth();
//     authDatasource = AuthDatasourceImpl(firebaseAuth: firebaseAuth);
//   });

//   group("doLogin", () {
//     test("doLogin - success", () async {
//       final userModel = UserModel(
//         email: "email",
//         nome: "nome",
//         photoUrl: "photoUrl",
//         userId: "userId",
//       );

//       when(() => authDatasource.doLogin(email: "email", password: "password"))
//           .thenAnswer((_) => Future.value(Right(userModel)));

//       final result =
//           await authDatasource.doLogin(email: "email", password: "password");

//       result.fold((l) => null, (r) => expect(r, isInstanceOf<UserModel>()));
//       result.fold((l) => null, (r) => expect(r.email, "email"));
//     });

//     test("doLogin - failure", () {});
//   });

//   group("createAccount", () {
//     test("createAccount - failure", () {});

//     test("createAccount - success", () {});
//   });

//   group("resetPassword", () {
//     test("resetPassword - failure", () {});

//     test("resetPassword - success", () {});
//   });
// }
