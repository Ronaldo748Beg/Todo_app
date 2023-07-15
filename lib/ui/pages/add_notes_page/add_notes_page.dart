import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/domain/provider/notes_provider.dart';
import 'package:todo_app/generated/locale_keys.g.dart';
import 'package:todo_app/ui/theme/app_colors.dart';
import 'package:todo_app/ui/theme/app_style.dart';
import 'package:todo_app/ui/widgets/textform_widget.dart';

class AddNotesPage extends StatelessWidget {
  const AddNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGrounColor,
        title: Text(
          LocaleKeys.addNotes.tr(),
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
      body: const AddNotesBody(),
    );
  }
}

class AddNotesBody extends StatelessWidget {
  const AddNotesBody({super.key});

  @override
  Widget build(BuildContext context) {
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
              heroTag: 'notes-add-btn',
              onPressed: () {
                model.onAddNote();
                Navigator.pop(context);
              },
              label: Text(
                LocaleKeys.add.tr(),
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
