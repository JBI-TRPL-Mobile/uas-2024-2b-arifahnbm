import 'package:flutter/material.dart';
import 'package:template_project/screens/welcome_screen.dart';
import 'package:template_project/screens/signin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UAS Arifah Nur',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        // '/home': (context) => HomeScreen(),
        // '/signup': (context) => SignUpScreen(),
        '/signin': (context) => SignInScreen(),
      },
    );
  }
}




