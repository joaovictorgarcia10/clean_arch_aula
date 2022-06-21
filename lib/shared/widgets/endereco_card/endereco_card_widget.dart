import 'package:clean_arch_aula/modules/enderecos/shared/entities/endereco.dart';
import 'package:clean_arch_aula/shared/utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class EnderecoCardWidget extends StatelessWidget {
  final Endereco endereco;
  final VoidCallback? onPressSalvar;

  const EnderecoCardWidget({
    Key? key,
    required this.endereco,
    this.onPressSalvar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (endereco.logradouro != null) ...[
              Text(
                "CEP: ${endereco.cep}",
                style: AppTextStyles.listTileTitle,
              ),
              const Divider(thickness: 1),
              const SizedBox(height: 5.0),
            ],
            if (endereco.logradouro != null) ...[
              Text(
                "Logradouro: ${endereco.logradouro}",
                style: AppTextStyles.listTileTitle,
              ),
              const Divider(thickness: 1),
              const SizedBox(height: 5.0),
            ],
            if (endereco.bairro != null) ...[
              Text(
                "Bairro: ${endereco.bairro},",
                style: AppTextStyles.listTileTitle,
              ),
              const Divider(thickness: 1),
              const SizedBox(height: 5.0),
            ],
            if (endereco.localidade != null) ...[
              Text(
                "Localidade: ${endereco.localidade}",
                style: AppTextStyles.listTileTitle,
              ),
              const Divider(thickness: 1),
              const SizedBox(height: 5.0),
            ],
            if (endereco.uf != null) ...[
              Text(
                "UF: ${endereco.uf}",
                style: AppTextStyles.listTileTitle,
              ),
              const Divider(thickness: 1),
              const SizedBox(height: 5.0),
            ],
            if (endereco.ddd != null) ...[
              Text(
                "DDD: ${endereco.ddd}",
                style: AppTextStyles.listTileTitle,
              ),
              const Divider(thickness: 1),
            ],
            const SizedBox(height: 10.0),
            if (onPressSalvar != null)
              TextButton(
                onPressed: onPressSalvar,
                child: const Text(
                  "Salvar Endereço",
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
