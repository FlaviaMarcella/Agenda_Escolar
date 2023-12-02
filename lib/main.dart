import 'package:flutter/material.dart';
import 'package:agenda_escola/pages/home_page.dart';
import 'package:agenda_escola/assets/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agenda Escolar',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
