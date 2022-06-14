import 'package:clean_arch_aula/modules/enderecos/shared/models/endereco_model.dart';
import 'package:clean_arch_aula/shared/utils/constants/app_colors.dart';
import 'package:clean_arch_aula/shared/utils/constants/app_text_styles.dart';
import 'package:clean_arch_aula/shared/utils/masks/app_masks.dart';
import 'package:clean_arch_aula/shared/utils/url_launch/launch_browser.dart';
import 'package:clean_arch_aula/shared/utils/validators/app_validadors.dart';
import 'package:clean_arch_aula/shared/widgets/button/button_widget.dart';
import 'package:clean_arch_aula/shared/widgets/error_modal/error_modal_widget.dart';
import 'package:clean_arch_aula/shared/widgets/message_modal/message_modal_widget.dart';
import 'package:clean_arch_aula/shared/widgets/text_form_field/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class InformarNumeracaoPage extends StatefulWidget {
  final EnderecoModel endereco;
  final double latitude;
  final double longitude;

  const InformarNumeracaoPage({
    Key? key,
    required this.endereco,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  State<InformarNumeracaoPage> createState() => _InformarNumeracaoPageState();
}

class _InformarNumeracaoPageState extends State<InformarNumeracaoPage> {
  TextEditingController textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Numeração'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Informando a numeração, você terá uma maior assertividade na localização.",
                      style: AppTextStyles.title,
                    ),
                    const SizedBox(height: 50.0),
                    TextFormFieldWidget(
                      controller: textController,
                      label: "Numeração",
                      prefixIcon: Icons.location_city_outlined,
                      inputFormatters: [AppMasks.cepMask],
                      keyboardType: TextInputType.number,
                      validator: (text) =>
                          AppValidadors().genericValidator(text),
                    ),
                    const SizedBox(height: 50.0),
                    ButtonWidget(
                      color: AppColors.green,
                      title: "Ver no Mapa",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          showModalBottomSheet(
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
                                    "Você será direcionado para o Google Maps, quer mesmo ir?",
                                onConfirm: () async {
                                  Navigator.pop(context);

                                  final String url =
                                      "https://www.google.com.br/maps/dir/${widget.latitude},${widget.longitude}/${widget.endereco.logradouro}${textController.text},${widget.endereco.cep}";

                                  if (await LaunchBrowser()
                                      .canOpenBrowser(url: Uri.parse(url))) {
                                    await LaunchBrowser()
                                        .openBrowser(url: Uri.parse(url));
                                  } else {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return const ErrorModalWidget();
                                      },
                                    );
                                  }
                                },
                              );
                            },
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20.0),
                    ButtonWidget(
                      color: Colors.transparent,
                      borderColor: AppColors.white,
                      title: "Não sei o número",
                      onTap: () {
                        showModalBottomSheet(
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
                                  "Você será direcionado para o Google Maps e buscará o endereço sem numeração, quer mesmo ir?",
                              onConfirm: () async {
                                Navigator.pop(context);

                                final String url =
                                    "https://www.google.com.br/maps/dir/${widget.latitude},${widget.longitude}/${widget.endereco.logradouro},${widget.endereco.cep}";

                                if (await LaunchBrowser()
                                    .canOpenBrowser(url: Uri.parse(url))) {
                                  await LaunchBrowser()
                                      .openBrowser(url: Uri.parse(url));
                                } else {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return const ErrorModalWidget();
                                    },
                                  );
                                }
                              },
                            );
                          },
                        );
                      },
                    ),
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
