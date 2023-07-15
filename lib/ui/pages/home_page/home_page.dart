import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/domain/provider/notes_provider.dart';
import 'package:todo_app/generated/locale_keys.g.dart';
import 'package:todo_app/ui/app_navigator/app_routes.dart';
import 'package:todo_app/ui/theme/app_colors.dart';
import 'package:todo_app/ui/theme/app_style.dart';
import 'package:todo_app/ui/widgets/notes_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return Scaffold(
      drawer: Drawer(
        width: 100,
        child: SafeArea(
          child: Column(
            children: [
              Switch(
                value: model.isTheme,
                onChanged: (value) {
                  model.changeTheme(value);
                },
              ),
              const SizedBox(height: 30),
              IconButton(
                onPressed: () {
                  model.changeLang(context);
                },
                icon: const Icon(
                  Icons.language,
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: const IconButtonWidget(),
        backgroundColor: AppColors.backGrounColor,
        title: Text(
          LocaleKeys.notes.tr(),
          style: AppStyle.fontStyle,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.searchNotes);
            },
            icon: const Icon(
              Icons.search,
              color: AppColors.greyColor,
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 56,
        width: 56,
        child: FloatingActionButton.extended(
          backgroundColor: AppColors.backGrounColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.addNotes);
          },
          label: const Icon(
            Icons.create_outlined,
            color: AppColors.purpleColor,
          ),
        ),
      ),
      body: const NotesBody(),
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Scaffold.of(context).openDrawer(),
      icon: const Icon(
        Icons.menu,
        color: AppColors.blackColor,
      ),
    );
  }
}
