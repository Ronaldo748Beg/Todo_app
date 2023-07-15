import 'package:flutter/material.dart';
import 'package:todo_app/ui/theme/app_colors.dart';
import 'package:todo_app/ui/theme/app_style.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    this.title = '',
    this.text = '',
    this.date = '',
    required this.index,
  });

  final String title, text, date;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.backGrounColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      shadowColor: const Color.fromRGBO(0, 0, 0, 0.3),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              date,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 14,
                color: AppColors.lightGreyColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 14,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
