import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/domain/provider/notes_provider.dart';
import 'package:todo_app/ui/app_navigator/app_navigator.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesProvider(),
      child: const MaterialAppWidget(),
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return MaterialApp(
      theme: !model.isTheme
          ? ThemeData.light(useMaterial3: true)
          : ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: AppNavigator.initRoute,
      routes: AppNavigator.routes,
      onGenerateRoute: AppNavigator.generate,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
// flutter pub run easy_localization:generate -S "assets/translations"

// flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -S "assets/translations"