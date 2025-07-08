import 'package:bmi_cal/screens/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMIApp());
}

class BMIApp extends StatelessWidget {
  const BMIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          color: Color.fromARGB(255, 9, 12, 34),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 9, 12, 34),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.amber),
        ),
      ),
      home: InputPage(),
    );
  }
}
