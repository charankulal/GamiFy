import 'package:flutter/material.dart';
import './pages/home_page.dart';
import './app_scroll_behaviour.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gamify App',
      scrollBehavior: AppScrollBehavior(),
      theme: ThemeData(
        
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
