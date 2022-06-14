import 'package:clean_arch_aula/shared/utils/constants/app_colors.dart';
import 'package:clean_arch_aula/shared/utils/constants/app_text_styles.dart';
import 'package:clean_arch_aula/shared/widgets/button/button_widget.dart';
import 'package:flutter/material.dart';

class MessageModalWidget extends StatelessWidget {
  final String message;
  final VoidCallback onConfirm;
  final VoidCallback? onDismiss;

  const MessageModalWidget({
    Key? key,
    required this.message,
    required this.onConfirm,
    this.onDismiss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: AppTextStyles.title,
            ),
            const SizedBox(height: 40.0),
            ButtonWidget(
              title: "Sim",
              onTap: onConfirm,
              color: AppColors.green,
            ),
            const SizedBox(height: 10.0),
            ButtonWidget(
              title: "Não",
              onTap: onDismiss ?? () => Navigator.pop(context),
              color: Colors.transparent,
              borderColor: AppColors.white,
            )
          ],
        ),
      ),
    );
  }
}
