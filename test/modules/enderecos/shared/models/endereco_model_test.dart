import 'package:clean_arch_aula/modules/enderecos/shared/models/endereco_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("EnderecoModel Test", () {
    test("Parse Model", () {
      final json = {
        "cep": "cep",
        "logradouro": "logradouro",
        "complemento": "complemento",
        "bairro": "bairro",
        "localidade": "localidade",
        "uf": "uf",
        "ddd": "ddd",
        "userId": "userId",
      };

      final endereco = EnderecoModel.fromMap(json);
      expect(endereco.cep, "cep");
    });
  });
}
