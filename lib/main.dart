import 'package:bmi/home.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const Bmi());
}

class Bmi extends StatelessWidget {
  const Bmi({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const Home(),
    
      theme: ThemeData.dark().copyWith(
        appBarTheme:const AppBarTheme(color: Colors.teal),
        textTheme:const TextTheme(
          displayMedium: TextStyle(
            fontSize: 30,
            color: Colors.black,
fontWeight: FontWeight.bold
          ),
          displayLarge: TextStyle(
fontSize: 36,
fontWeight: FontWeight.bold
        ))

    ),
    );
  }
}