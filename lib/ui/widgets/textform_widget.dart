import 'package:flutter/material.dart';
import 'package:todo_app/ui/theme/app_colors.dart';
import 'package:todo_app/ui/theme/app_style.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.formController,
  });

  final String labelText;
  final String hintText;

  final TextEditingController formController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: formController,
      cursorColor: AppColors.greyColor,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppStyle.fontStyle.copyWith(
          fontSize: 12,
          color: AppColors.greyColor,
        ),
        hintText: hintText,
        hintStyle: AppStyle.fontStyle.copyWith(
          fontSize: 16,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.borderColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
