import 'package:clean_arch_aula/shared/utils/constants/app_colors.dart';
import 'package:clean_arch_aula/shared/utils/constants/app_text_styles.dart';
import 'package:clean_arch_aula/shared/widgets/button/button_widget.dart';
import 'package:clean_arch_aula/shared/widgets/text_form_field/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class EsqueciSenhaPage extends StatefulWidget {
  const EsqueciSenhaPage({Key? key}) : super(key: key);

  @override
  State<EsqueciSenhaPage> createState() => _EsqueciSenhaPageState();
}

class _EsqueciSenhaPageState extends State<EsqueciSenhaPage> {
  TextEditingController textController = TextEditingController();

//TODO: implementar processo de gerar nova senha para o firebase

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Esqueci a Senha'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Text(
                "Informe o seu email cadastrado e nós te enviaremos a sua nova senha.",
                style: AppTextStyles.title,
              ),
              const SizedBox(height: 50.0),
              TextFormFieldWidget(
                controller: textController,
                label: "Email",
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 80.0),
              ButtonWidget(
                title: "Enviar nova senha",
                color: AppColors.green,
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
