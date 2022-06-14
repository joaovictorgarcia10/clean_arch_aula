import 'package:clean_arch_aula/modules/auth/domain/entities/user.dart';
import 'package:clean_arch_aula/shared/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch_aula/shared/utils/constants/app_text_styles.dart';

class MenuLateralWidget extends StatefulWidget {
  final Widget options;
  final User? user;

  const MenuLateralWidget({
    Key? key,
    required this.options,
    required this.user,
  }) : super(key: key);

  @override
  State<MenuLateralWidget> createState() => _MenuLateralWidgetState();
}

class _MenuLateralWidgetState extends State<MenuLateralWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColors.white,
                        ),
                        borderRadius: BorderRadius.circular(52.0),
                      ),
                      child: Center(
                          child: Text(
                        widget.user?.email?.substring(0, 1).toUpperCase() ?? "",
                        style: AppTextStyles.title,
                      )),
                    ),
                    const SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.user?.nome ?? ""),
                        const SizedBox(height: 5.0),
                        Text(widget.user?.email ?? ""),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              widget.options,
            ],
          ),
        ),
      ),
    );
  }
}
