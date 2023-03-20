import 'package:flutter/material.dart';
import 'package:nutriscan/constants.dart';
import 'package:nutriscan/homepage.dart';

void main() {
  runApp(NutriScan());
}

class NutriScan extends StatelessWidget {
  const NutriScan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF06283D),
        appBarTheme: AppBarTheme(
          color: kMainColor,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Homepage(),
      },
    );
  }
}
