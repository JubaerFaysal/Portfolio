import 'package:flutter/material.dart';
import 'package:flutter_web/New_Templete/config/app_theme.dart';
import 'package:flutter_web/New_Templete/screens/home.dart';


void main() {
  runApp(const DevFolioApp());
}


class DevFolioApp extends StatelessWidget {
  const DevFolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevFolio - Jubaer Faysal',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme, // Optional: Implement dark theme later
      themeMode: ThemeMode.light, // Or ThemeMode.system
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
