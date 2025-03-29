import 'package:flutter/material.dart';
import 'package:frontend/providers/token_provider.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/screens/signup_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TokenProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Test Task",
        routes: {
          "/home": (context) => const HomeScreen(),
          "/login": (context) => LoginScreen(),
          "/": (context) => Signup(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
