import 'package:clean_arch_aula/shared/utils/constants/app_colors.dart';
import 'package:clean_arch_aula/shared/utils/constants/app_text_styles.dart';
import 'package:clean_arch_aula/shared/widgets/button/button_widget.dart';
import 'package:flutter/material.dart';

class ErrorCardWidget extends StatelessWidget {
  final VoidCallback onTapButton;
  final String message;

  const ErrorCardWidget({
    Key? key,
    required this.onTapButton,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: Card(
          elevation: 5,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(22))),
          child: SizedBox(
            height: 250.0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    message,
                    style: AppTextStyles.title,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  ButtonWidget(
                    title: "Tentar novamente",
                    onTap: onTapButton,
                    color: AppColors.green,
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
