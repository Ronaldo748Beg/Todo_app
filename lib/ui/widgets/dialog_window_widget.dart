import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/domain/provider/notes_provider.dart';
import 'package:todo_app/generated/locale_keys.g.dart';
import 'package:todo_app/ui/app_navigator/app_routes.dart';
import 'package:todo_app/ui/theme/app_colors.dart';
import 'package:todo_app/ui/theme/app_style.dart';

class DialogWindowWidget extends StatelessWidget {
  const DialogWindowWidget({
    super.key,
    required this.index,
    required this.title,
    required this.text,
  });

  final int index;
  final String title, text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              title,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            text,
            style: AppStyle.fontStyle.copyWith(
              fontSize: 14,
              color: AppColors.greyColor,
            ),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.popAndPushNamed(context, AppRoutes.changeNotes,
                  arguments: index);
            },
            icon: const Icon(
              Icons.edit,
              color: AppColors.greyColor,
            ),
            label: Text(
              LocaleKeys.edit.tr(),
              style: AppStyle.fontStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          DeleteNoteWidget(
            index: index,
          ),
        ],
      ),
    );
  }
}

class DeleteNoteWidget extends StatelessWidget {
  const DeleteNoteWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return TextButton.icon(
      onPressed: () {
        model.onDeleteNote(context, index);
      },
      icon: const Icon(
        Icons.backspace,
        color: AppColors.greyColor,
      ),
      label: Text(
        LocaleKeys.delete.tr(),
        style: AppStyle.fontStyle.copyWith(
          fontSize: 16,
        ),
      ),
    );
  }
}
