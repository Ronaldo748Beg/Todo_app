import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/domain/hive/hive_box.dart';
import 'package:todo_app/domain/hive/notes_data.dart';
import 'package:todo_app/domain/provider/notes_provider.dart';
import 'package:todo_app/ui/theme/app_colors.dart';
import 'package:todo_app/ui/widgets/card_widget.dart';
import 'package:todo_app/ui/widgets/dialog_window_widget.dart';

class NotesBody extends StatelessWidget {
  const NotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NotesProvider>(context);
    return ValueListenableBuilder(
      valueListenable: HiveBoxes.notes.listenable(),
      builder: (context, Box<NotesData> notes, _) {
        final allNotes = notes.values.toList();
        return LayoutBuilder(
            // позволяет перестроить виджеты в зависимости от размера экрана
            builder: (context, BoxConstraints constraints) {
          if (constraints.maxWidth > 768) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    model.setControllers(index);
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        maxHeight: 180,
                        maxWidth: 380,
                      ),
                      backgroundColor: AppColors.whiteColor,
                      context: context,
                      builder: (context) {
                        return DialogWindowWidget(
                          text: allNotes[index].text,
                          title: allNotes[index].title,
                          index: index,
                        );
                      },
                    );
                  },
                  child: CardWidget(
                    index: index,
                    title: allNotes[index].title,
                    text: allNotes[index].text,
                    date: allNotes[index].date,
                  ),
                );
              },
              itemCount: allNotes.length,
            );
          } else {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    model.setControllers(index);
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        maxHeight: 180,
                        maxWidth: 380,
                      ),
                      backgroundColor: AppColors.whiteColor,
                      context: context,
                      builder: (context) {
                        return DialogWindowWidget(
                          text: allNotes[index].text,
                          title: allNotes[index].title,
                          index: index,
                        );
                      },
                    );
                  },
                  child: CardWidget(
                    index: index,
                    title: allNotes[index].title,
                    text: allNotes[index].text,
                    date: allNotes[index].date,
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: allNotes.length,
            );
          }
        });
      },
    );
  }
}
