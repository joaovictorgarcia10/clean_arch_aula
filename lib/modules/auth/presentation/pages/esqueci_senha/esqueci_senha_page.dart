import 'dart:async';
import 'package:clean_arch_aula/modules/auth/presentation/pages/esqueci_senha/bloc/esqueci_senha_event.dart';
import 'package:clean_arch_aula/shared/utils/constants/app_colors.dart';
import 'package:clean_arch_aula/shared/utils/constants/app_text_styles.dart';
import 'package:clean_arch_aula/shared/utils/validators/app_form_validadors.dart';
import 'package:clean_arch_aula/shared/widgets/button/button_widget.dart';
import 'package:clean_arch_aula/shared/widgets/loading_modal/loading_modal_widget.dart';
import 'package:clean_arch_aula/shared/widgets/text_form_field/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
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
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("esqueci_senha_page_label_5".i18n()),
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
        title: Text("esqueci_senha_page_label_1".i18n()),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "esqueci_senha_page_label_2".i18n(),
                    style: AppTextStyles.title,
                  ),
                  const SizedBox(height: 50.0),
                  TextFormFieldWidget(
                    controller: textController,
                    label: "esqueci_senha_page_label_3".i18n(),
                    prefixIcon: Icons.email_outlined,
                    validator: (text) =>
                        AppFormValidadors().emailValidator(text),
                  ),
                  const SizedBox(height: 80.0),
                  ButtonWidget(
                    title: "esqueci_senha_page_label_4".i18n(),
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
      ),
    );
  }
}
