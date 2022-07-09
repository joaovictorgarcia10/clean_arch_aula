// ignore_for_file: avoid_print

import 'package:clean_arch_aula/app_widget.dart';
import 'package:clean_arch_aula/shared/utils/constants/app_theme.dart';
import 'package:clean_arch_aula/shared/widgets/error_card/error_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

enum FirebaseStatus {
  loading,
  error,
  success,
}

class FirebaseAppWidget extends StatefulWidget {
  const FirebaseAppWidget({Key? key}) : super(key: key);

  @override
  FirebaseAppWidgetState createState() => FirebaseAppWidgetState();
}

class FirebaseAppWidgetState extends State<FirebaseAppWidget> {
  final firebaseStatus = ValueNotifier<FirebaseStatus>(FirebaseStatus.loading);

  void _initApplication() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      await Firebase.initializeApp();
      firebaseStatus.value = FirebaseStatus.success;
      print("Firebase Started!");
    } on FirebaseException {
      firebaseStatus.value = FirebaseStatus.error;
    } catch (e) {
      firebaseStatus.value = FirebaseStatus.error;
    }
  }

  @override
  void initState() {
    super.initState;
    _initApplication();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: firebaseStatus,
      builder: (_, status, __) {
        if (status == FirebaseStatus.error) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme().appTheme(),
            home: ErrorCardWidget(
              message:
                  "Tivemos uma falha de conexão e já estamos trabalhando para solucionar este problema, por favor, tente novamente mais tarde.",
              onTapButton: () => _initApplication(),
            ),
          );
        } else if (status == FirebaseStatus.success) {
          return const AppWidget();
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme().appTheme(),
            home: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
