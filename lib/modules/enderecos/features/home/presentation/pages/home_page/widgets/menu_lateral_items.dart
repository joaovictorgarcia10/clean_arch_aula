import 'package:clean_arch_aula/modules/enderecos/features/home/presentation/pages/home_page/bloc/home_bloc.dart';
import 'package:clean_arch_aula/modules/enderecos/features/home/presentation/pages/home_page/bloc/home_event.dart';
import 'package:clean_arch_aula/shared/widgets/list_tile/list_tile_widget.dart';
import 'package:clean_arch_aula/shared/widgets/message_modal/message_modal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MenuLateralItems extends StatelessWidget {
  MenuLateralItems({Key? key}) : super(key: key);

  final bloc = Modular.get<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileWidget(
          title: "Meus Endereços",
          leadingIcon: Icons.location_on_outlined,
          onTap: () => Modular.to.popAndPushNamed("/meus_enderecos"),
        ),
        ListTileWidget(
          title: "Sair",
          leadingIcon: Icons.exit_to_app_outlined,
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
                  message: "Quer mesmo desconectar da sua conta?",
                  onConfirm: () {
                    Navigator.pop(context);
                    bloc.add(const HomeEvent.disconnectAccount());
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}
