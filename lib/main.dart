import 'package:clean_arch_aula/app_module.dart';
import 'package:clean_arch_aula/firebase_app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(ModularApp(module: AppModule(), child: const FirebaseAppWidget()));
}
