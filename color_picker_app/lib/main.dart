// ignore_for_file: deprecated_member_use

import 'package:app2/pages/color_picker_page.dart';
import 'package:app2/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      home: ColorPickerPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

