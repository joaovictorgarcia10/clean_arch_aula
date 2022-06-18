import 'dart:async';
import 'package:clean_arch_aula/modules/auth/presentation/pages/esqueci_senha/bloc/esqueci_senha_event.dart';
import 'package:clean_arch_aula/shared/utils/constants/app_colors.dart';
import 'package:clean_arch_aula/shared/utils/constants/app_text_styles.dart';
import 'package:clean_arch_aula/shared/widgets/button/button_widget.dart';
import 'package:clean_arch_aula/shared/widgets/loading_modal/loading_modal_widget.dart';
import 'package:clean_arch_aula/shared/widgets/text_form_field/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'bloc/esqueci_senha_bloc.dart';

class EsqueciSenhaPage extends StatefulWidget {
  const EsqueciSenhaPage({Key? key}) : super(key: key);

  @override
  State<EsqueciSenhaPage> createState() => _EsqueciSenhaPageState();
}

class _EsqueciSenhaPageState extends State<EsqueciSenhaPage> {
  final bloc = Modular.get<EsqueciSenhaBloc>();
  late StreamSubscription subscription;

  TextEditingController textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    subscription = bloc.stream.listen((state) {
      state.maybeWhen(
        success: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Enviamos uma nova senha para o seu email"),
            ),
          );
          Modular.to.pop();
        },
        loading: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            isDismissible: false,
            isScrollControlled: false,
            enableDrag: false,
            builder: (context) => const LoadingModalWidget(),
          );
        },
        failure: (failure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(failure.message.toString())));
        },
        orElse: () {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Esqueci a Senha'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
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
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.add(EsqueciSenhaEvent.resetPassword(
                          email: textController.text));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
