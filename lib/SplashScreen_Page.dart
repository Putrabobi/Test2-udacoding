import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login/login_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    getAwal();
  }

  void getAwal() async {
    Timer(Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              "assets/images/ovo.png",
              scale: 5, // Sesuaikan dengan skala yang Anda inginkan
            ),
            Spacer(),
            Text(""),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
