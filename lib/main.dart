import 'package:anime_database/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        // '/login': (context) => const LoginScreen(),
        // '/topics': (context) => const TopicsScreen(),
        // '/profile': (context) => const ProfileScreen(),
        // '/about': (context) => const AboutScreen(),
      },
    );
  }
}

