import 'package:flutter/material.dart';
import 'package:todo_app/ui/theme/app_style.dart';

class Error404Page extends StatelessWidget {
  const Error404Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Страница не найдена'),
      ),
      body: Center(
        child: Text(
          'Ошибка 404',
          style: AppStyle.fontStyle.copyWith(fontSize: 26),
        ),
      ),
    );
  }
}
