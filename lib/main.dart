import 'package:avengers/screens/avengers_display_screen.dart';

import 'package:flutter/material.dart';
import 'package:glowy_borders/glowy_borders.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
          padding:
              const EdgeInsets.only(bottom: 40, top: 40, right: 7, left: 7),
          child: AnimatedGradientBorder(
              borderSize: 2,
              glowSize: 2,
              gradientColors: [
                Colors.transparent,
                Colors.transparent,
                Colors.transparent,
                Colors.purple.shade50
              ],
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.grey,
                          Colors.red,
                          Colors.grey,
                          Colors.grey,
                          Colors.blue,
                          Colors.white,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Avenge()))),
    );
  }
}
