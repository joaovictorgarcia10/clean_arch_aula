import 'package:clean_arch_aula/modules/auth/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("UserModel Test", () {
    test("Parse Model", () {
      final json = {
        "nome": "nome",
        "email": "email",
        "photoUrl": "photoUrl",
        "userId": "userId",
      };

      final user = UserModel.fromMap(json);
      expect(user.nome, "nome");
      expect(user.email, "email");
      expect(user.photoUrl, "photoUrl");
      expect(user.userId, "userId");
    });
  });
}
