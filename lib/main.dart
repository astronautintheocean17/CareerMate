// ============================================================================
//  CareerMate — Entry point
//  SIH26044 · Team Tech Vectors
// ============================================================================

import 'package:flutter/material.dart';
import 'package:careermate/common/screens/poc_switcher.dart';

void main() {
  runApp(const CareerMateApp());
}

class CareerMateApp extends StatelessWidget {
  const CareerMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CareerMate · SIH26044',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A4FD6),
          primary: const Color(0xFF1A4FD6),
          secondary: const Color(0xFF12A46A),
          surface: const Color(0xFFFFFFFF),
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
      ),
      home: const PocSwitcher(),
    );
  }
}