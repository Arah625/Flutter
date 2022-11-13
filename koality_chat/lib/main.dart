import 'package:flutter/material.dart';
import 'package:koality_chat/screens/screens.dart';
import 'package:koality_chat/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      title: 'Koality Chat',
      home: HomeScreen(),
    );
  }
}
