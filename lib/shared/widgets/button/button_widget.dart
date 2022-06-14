import 'package:flutter/material.dart';

import 'package:clean_arch_aula/shared/utils/constants/app_text_styles.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color color;
  final Color? borderColor;

  const ButtonWidget({
    Key? key,
    required this.title,
    required this.onTap,
    required this.color,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55.0,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: borderColor ?? Colors.transparent,
          ),
          color: color,
          borderRadius: BorderRadius.circular(32.0),
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.inputText,
          ),
        ),
      ),
    );
  }
}
