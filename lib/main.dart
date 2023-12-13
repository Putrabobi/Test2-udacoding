import 'package:flutter/material.dart';
import 'package:login/SplashScreen_Page.dart';
import 'package:login/login_page.dart';
import 'package:login/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: SplashScreenPage(),
     initialRoute: '/',
routes: {
  '/': (context) => SplashScreenPage(),
  '/login': (context) => LoginPage(),
  '/register': (context) => RegisterPage(),
},
    );
  }
}
