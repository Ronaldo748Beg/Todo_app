import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/domain/hive/hive_box.dart';
import 'package:todo_app/domain/hive/notes_data.dart';
import 'package:todo_app/generated/locale_keys.g.dart';
import 'package:todo_app/ui/theme/app_colors.dart';
import 'package:todo_app/ui/theme/app_style.dart';
import 'package:todo_app/ui/widgets/card_widget.dart';

class SearchNotesPages extends StatefulWidget {
  const SearchNotesPages({super.key});

  @override
  State<SearchNotesPages> createState() => _SearchNotesPagesState();
}

class _SearchNotesPagesState extends State<SearchNotesPages> {
  final searchController = TextEditingController();
  final _notes = HiveBoxes.notes.values.toList();
  var filteredNoted = <NotesData>[];

  void _searchNotes() {
    final query = searchController.text;
    if (query.isNotEmpty) {
      filteredNoted = _notes.where(
        (NotesData notesList) {
          return notesList.title.toLowerCase().contains(query.toLowerCase()) ||
              notesList.text.toLowerCase().contains(query.toLowerCase());
        },
      ).toList();
    } else {
      filteredNoted = _notes;
    }
    setState(() {});
  }

  @override
  void initState() {
    filteredNoted = _notes;
    searchController.addListener(_searchNotes);
    super.initState();
  }

  deleteText() async {
    searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGrounColor,
        title: TextField(
          controller: searchController,
          cursorColor: AppColors.blackColor,
          style: AppStyle.fontStyle,
          decoration: InputDecoration(
            hintText: LocaleKeys.search.tr(),
            hintStyle: AppStyle.fontStyle,
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            suffixIcon: IconButton(
              onPressed: deleteText,
              icon: const Icon(
                Icons.delete,
                color: AppColors.greyColor,
              ),
            ),
          ),
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
      body: ValueListenableBuilder(
        valueListenable: HiveBoxes.notes.listenable(),
        builder: (context, Box<NotesData> box, child) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final note = filteredNoted[index];
              return CardWidget(
                index: index,
                title: note.title,
                date: note.date,
                text: note.text,
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemCount: filteredNoted.length,
          );
        },
      ),
    );
  }
}
