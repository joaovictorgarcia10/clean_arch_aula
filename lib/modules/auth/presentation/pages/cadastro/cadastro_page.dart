import 'dart:async';
import 'package:clean_arch_aula/modules/auth/domain/usecases/create_account.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/cadastro/bloc/cadastro_bloc.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/cadastro/bloc/cadastro_event.dart';
import 'package:clean_arch_aula/shared/utils/constants/app_colors.dart';
import 'package:clean_arch_aula/shared/utils/validators/app_form_validadors.dart';
import 'package:clean_arch_aula/shared/widgets/button/button_widget.dart';
import 'package:clean_arch_aula/shared/widgets/loading_modal/loading_modal_widget.dart';
import 'package:clean_arch_aula/shared/widgets/text_form_field/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:localization/localization.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  TextEditingController confirmPasswordText = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool obscureTextPassword = true;
  bool obscureTextConfirmPassword = true;

  late StreamSubscription subscription;
  final _bloc = GetIt.I.get<CadastroBloc>();

  @override
  void initState() {
    super.initState();

    subscription = _bloc.stream.listen((state) {
      state.maybeWhen(
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
        success: () {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("cadastro_page_label_6".i18n())));
          Navigator.pop(context);
        },
        orElse: () {},
      );
    });
  }

  @override
  void dispose() {
    emailText.dispose();
    passwordText.dispose();
    confirmPasswordText.dispose();
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cadastro_page_label_1".i18n()),
        elevation: 5,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormFieldWidget(
                      controller: emailText,
                      label: "cadastro_page_label_2".i18n(),
                      prefixIcon: Icons.email_outlined,
                      validator: (text) =>
                          AppFormValidadors().emailValidator(text),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormFieldWidget(
                      controller: passwordText,
                      label: "cadastro_page_label_3".i18n(),
                      prefixIcon: Icons.vpn_key_outlined,
                      obscureText: obscureTextPassword,
                      suffixIcon: obscureTextPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      onTapSuffixIcon: () {
                        setState(() {
                          obscureTextPassword = !obscureTextPassword;
                        });
                      },
                      validator: (text) =>
                          AppFormValidadors().passwordValidator(text),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormFieldWidget(
                      controller: confirmPasswordText,
                      label: "cadastro_page_label_4".i18n(),
                      prefixIcon: Icons.vpn_key_outlined,
                      obscureText: obscureTextConfirmPassword,
                      suffixIcon: obscureTextConfirmPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      onTapSuffixIcon: () {
                        setState(() {
                          obscureTextConfirmPassword =
                              !obscureTextConfirmPassword;
                        });
                      },
                      validator: (text) =>
                          AppFormValidadors().confirmPasswordValidator(
                        confirmPassword: text,
                        password: passwordText.text,
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    ButtonWidget(
                      title: "cadastro_page_label_5".i18n(),
                      color: AppColors.green,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _bloc.add(
                            CadastroEvent.createAccount(
                              params: CreateAccountParams(
                                email: emailText.text,
                                password: passwordText.text,
                              ),
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
