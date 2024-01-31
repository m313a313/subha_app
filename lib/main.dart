import 'package:flutter/material.dart';
import 'package:sub7happ/Views/home_page.dart';

void main() {
  runApp(Sub7aApp());
}

class Sub7aApp extends StatelessWidget {
  const Sub7aApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const HomePage());
  }
}
