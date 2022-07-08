import 'dart:async';
import 'package:clean_arch_aula/modules/enderecos/features/home/domain/usecases/buscar_endreco.dart';
import 'package:clean_arch_aula/modules/enderecos/features/home/presentation/pages/home_page/bloc/home_bloc.dart';
import 'package:clean_arch_aula/modules/enderecos/features/home/presentation/pages/home_page/bloc/home_event.dart';
import 'package:clean_arch_aula/modules/enderecos/features/home/presentation/pages/home_page/bloc/home_state.dart';
import 'package:clean_arch_aula/modules/enderecos/features/home/presentation/pages/home_page/widgets/menu_lateral_items.dart';
import 'package:clean_arch_aula/shared/core/session/session.dart';
import 'package:clean_arch_aula/shared/utils/constants/app_colors.dart';
import 'package:clean_arch_aula/shared/widgets/menu_lateral/menu_lateral_widget.dart';
import 'package:clean_arch_aula/shared/utils/constants/app_text_styles.dart';
import 'package:clean_arch_aula/shared/utils/masks/app_masks.dart';
import 'package:clean_arch_aula/shared/utils/validators/app_form_validadors.dart';
import 'package:clean_arch_aula/shared/widgets/button/button_widget.dart';
import 'package:clean_arch_aula/shared/widgets/endereco_card/endereco_card_widget.dart';
import 'package:clean_arch_aula/shared/widgets/message_card/message_card_widget.dart';
import 'package:clean_arch_aula/shared/widgets/error_modal/error_modal_widget.dart';
import 'package:clean_arch_aula/shared/widgets/loading_modal/loading_modal_widget.dart';
import 'package:clean_arch_aula/shared/widgets/message_modal/message_modal_widget.dart';
import 'package:clean_arch_aula/shared/widgets/text_form_field/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textFieldController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final bloc = Modular.get<HomeBloc>();
  late StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = bloc.stream.listen((state) {
      state.maybeWhen(
        saveEnderecoSuccess: () {
          Navigator.pop(context);
          Modular.to.pushNamed("/meus_enderecos");
        },
        loading: () {
          showModalBottomSheet(
            context: context,
            isDismissible: false,
            isScrollControlled: false,
            enableDrag: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22.0),
                topRight: Radius.circular(22.0),
              ),
            ),
            builder: (context) => const LoadingModalWidget(),
          );
        },
        failure: (failure) {
          Navigator.pop(context);
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22.0),
                topRight: Radius.circular(22.0),
              ),
            ),
            builder: (context) => ErrorModalWidget(message: failure.message),
          );
        },
        buscarEnderecoSuccess: (endreco) {
          Navigator.pop(context);
        },
        disconnectAccountSuccess: () {
          Navigator.pop(context);
          Modular.to.pushReplacementNamed("/login");
        },
        orElse: () {},
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateralWidget(
        user: Modular.get<Session>().usuario,
        options: MenuLateralItems(),
      ),
      appBar: AppBar(
        title: const Text("Buscar CEP"),
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormFieldWidget(
                    controller: textFieldController,
                    label: "CEP:",
                    prefixIcon: Icons.location_on_outlined,
                    inputFormatters: [AppMasks.cepMask],
                    keyboardType: TextInputType.number,
                    validator: (text) => AppFormValidadors().cepValidator(text),
                  ),
                  const SizedBox(height: 50.0),
                  BlocBuilder<HomeBloc, HomeState>(
                      bloc: bloc,
                      builder: (context, state) {
                        return state.maybeWhen(
                          buscarEnderecoSuccess: (endereco) {
                            if (endereco.logradouro != null) {
                              return EnderecoCardWidget(
                                endereco: endereco,
                                onPressSalvar: () => showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(22.0),
                                      topRight: Radius.circular(22.0),
                                    ),
                                  ),
                                  builder: (context) {
                                    return MessageModalWidget(
                                      message:
                                          "Quer mesmo salvar este endereço?",
                                      onConfirm: () {
                                        Navigator.pop(context);
                                        bloc.add(
                                          HomeEvent.saveEndereco(
                                            model: endereco,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            }
                            return const MessageCardWidget(
                              message:
                                  "Não encontramos nenhum entedereço neste CEP, por favor busque outro.",
                            );
                          },
                          orElse: () => SizedBox(
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/img1.png",
                                  height: 175,
                                ),
                                const SizedBox(height: 20.0),
                                const Text(
                                  "Aqui você pode fazer a busca de um endereço, apenas informando o seu CEP.",
                                  style: AppTextStyles.bodyText,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                  const SizedBox(height: 100.0),
                  ButtonWidget(
                    title: "Buscar Endereço",
                    color: AppColors.green,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        bloc.add(HomeEvent.buscarEndereco(
                            params: BuscarEndrecoParams(
                                cep: textFieldController.text
                                    .replaceAll("-", ""))));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
