import 'package:clean_arch_aula/shared/utils/constants/app_colors.dart';
import 'package:clean_arch_aula/shared/utils/constants/app_text_styles.dart';
import 'package:clean_arch_aula/shared/widgets/button/button_widget.dart';
import 'package:flutter/material.dart';

class ErrorModalWidget extends StatelessWidget {
  final String? message;

  const ErrorModalWidget({
    Key? key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30.0),
            Center(
              child: Text(
                message ??
                    "Não conseguimos processar o seu pedido. Tente novamente mais tarde.",
                textAlign: TextAlign.center,
                style: AppTextStyles.title,
              ),
            ),
            const SizedBox(height: 30.0),
            ButtonWidget(
              title: "Ok, entendi.",
              onTap: () => Navigator.pop(context),
              color: AppColors.green,
            ),
          ],
        ),
      ),
    );
  }
}
