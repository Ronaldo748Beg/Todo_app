import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/domain/hive/hive_box.dart';
import 'package:todo_app/domain/hive/notes_data.dart';
import 'package:todo_app/generated/locale_keys.g.dart';
import 'package:todo_app/ui/app_navigator/app_routes.dart';

class NotesProvider extends ChangeNotifier {
  NotesProvider() {
    getTheme();
  }

  //controllers

  final titleController = TextEditingController();
  final textController = TextEditingController();

  //add notes
  Future<void> onAddNote() async {
    await HiveBoxes.notes
        .add(
          NotesData(
            title: titleController.text.isNotEmpty
                ? titleController.text
                : LocaleKeys.title.tr(),
            text: textController.text.isNotEmpty
                ? textController.text
                : LocaleKeys.notes.tr(),
          ),
        )
        .then((value) => controllerClear());
  }

  //clear controllers
  controllerClear() async {
    titleController.clear();
    textController.clear();
  }

  //delete notes
  Future<void> onDeleteNote(BuildContext context, int index) async {
    await HiveBoxes.notes
        .deleteAt(index)
        .then((value) => Navigator.pop(context));
  }

  //change notes

  Future<void> onChangeNote(BuildContext context, int index) async {
    await HiveBoxes.notes
        .putAt(
          index,
          NotesData(title: titleController.text, text: textController.text),
        )
        .then((value) => controllerClear())
        .then(
          (value) => Navigator.pop(
            context,
            AppRoutes.home,
          ),
        );
  }

  void setControllers(int index) async {
    titleController.text = HiveBoxes.notes.getAt(index)?.title ?? 'Title';
    textController.text = HiveBoxes.notes.getAt(index)?.text ?? 'Description';
  }

  //смена темы
  bool isTheme = false;
  changeTheme(bool value) async {
    isTheme = value;
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('theme', isTheme);
    notifyListeners();
  }

  getTheme() async {
    final pref = await SharedPreferences.getInstance();
    isTheme = pref.getBool('theme') ?? isTheme;
    notifyListeners();
  }

  changeLang(BuildContext context) {
    if (context.locale == const Locale('ru')) {
      context.setLocale(const Locale('en'));
    } else {
      context.setLocale(const Locale('ru'));
    }
    notifyListeners();
  }
}
