import 'package:flutter/material.dart';
import 'package:todo_app/ui/app_navigator/app_routes.dart';
import 'package:todo_app/ui/pages/add_notes_page/add_notes_page.dart';
import 'package:todo_app/ui/pages/change_notes_page/change_notes_page.dart';
import 'package:todo_app/ui/pages/error_404_page/error_404_page.dart';
import 'package:todo_app/ui/pages/home_page/home_page.dart';
import 'package:todo_app/ui/pages/search_notes_page/search_notes_page.dart';

class AppNavigator {
  static String initRoute = AppRoutes.home;

  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.home: (_) => const HomePage(),
      AppRoutes.addNotes: (_) => const AddNotesPage(),
      AppRoutes.changeNotes: (_) => const ChangeNotesPages(),
      AppRoutes.searchNotes: (_) => const SearchNotesPages(),
    };
  }

  static Route generate(RouteSettings settings) {
    final _settings = RouteSettings(
      name: '/404',
      arguments: settings.arguments,
    );
    return MaterialPageRoute(
      settings: _settings,
      builder: (_) => const Error404Page(),
    );
  }
}
