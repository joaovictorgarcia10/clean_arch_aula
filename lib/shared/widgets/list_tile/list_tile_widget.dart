import 'package:clean_arch_aula/shared/utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData leadingIcon;
  final IconData? trailingIcon;
  final VoidCallback? onTapTrailing;
  final VoidCallback? onTap;

  const ListTileWidget({
    Key? key,
    required this.title,
    required this.leadingIcon,
    this.subtitle,
    this.trailingIcon,
    this.onTapTrailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15.0),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
      child: ListTile(
        leading: Icon(leadingIcon, size: 32.0),
        title: Text(
          title,
          style: AppTextStyles.listTileTitle,
        ),
        subtitle: subtitle != null ? Text(subtitle!) : null,
        trailing: trailingIcon != null
            ? IconButton(onPressed: onTapTrailing, icon: Icon(trailingIcon))
            : null,
        onTap: onTap,
      ),
    );
  }
}
