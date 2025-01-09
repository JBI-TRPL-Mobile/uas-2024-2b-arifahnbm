import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template_project/screens/welcome_screen.dart';
import 'package:template_project/screens/home_screen.dart';
import 'package:template_project/screens/sign_in_screen.dart';
import 'package:template_project/screens/sign_up_screen.dart';
import 'package:template_project/providers/data_provider.dart';
import 'package:template_project/providers/user_provider.dart';
import 'package:template_project/Widget/BottomNavigation.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => DataProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/signin': (context) => SignInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
        '/navigation': (context) => Bottomnavigation(),
      },
    );
  }
}