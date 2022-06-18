import 'package:clean_arch_aula/shared/utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> navigate() async {
    await Future.delayed(const Duration(seconds: 3));
    Modular.to.pushReplacementNamed("/login");
  }

  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Icons.location_on_outlined, size: 72.0),
            SizedBox(height: 20.0),
            Text("Buscar CEP", style: AppTextStyles.title)
          ],
        ),
      ),
    );
  }
}
