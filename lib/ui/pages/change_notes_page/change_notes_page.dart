import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/domain/provider/notes_provider.dart';
import 'package:todo_app/generated/locale_keys.g.dart';
import 'package:todo_app/ui/theme/app_colors.dart';
import 'package:todo_app/ui/theme/app_style.dart';
import 'package:todo_app/ui/widgets/textform_widget.dart';

class ChangeNotesPages extends StatelessWidget {
  const ChangeNotesPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGrounColor,
        title: Text(
          LocaleKeys.changeNote.tr(),
          style: AppStyle.fontStyle,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.blackColor,
          ),
        ),
      ),
      body: const ChangeNotesBody(),
    );
  }
}

class ChangeNotesBody extends StatelessWidget {
  const ChangeNotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments;
    final int index = arg is int ? arg : 0;
    final model = Provider.of<NotesProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextFormWidget(
            labelText: LocaleKeys.title.tr(),
            hintText: LocaleKeys.title.tr(),
            formController: model.titleController,
          ),
          const SizedBox(height: 16),
          TextFormWidget(
            labelText: LocaleKeys.notes.tr(),
            hintText: LocaleKeys.notes.tr(),
            formController: model.textController,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FloatingActionButton.extended(
              backgroundColor: AppColors.backGrounColor,
              elevation: 2,
              heroTag: 'notes-change-btn',
              onPressed: () {
                model.onChangeNote(context, index);
              },
              label: Text(
                LocaleKeys.change.tr(),
                style: AppStyle.fontStyle.copyWith(
                  color: AppColors.purpleColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
