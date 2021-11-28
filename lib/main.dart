import 'package:bmicalculator/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          fontFamily: "IBMPlexSans-Thin",
          colorScheme: ThemeData.dark().colorScheme.copyWith(
                primary: const Color(0xFF0A0E21),
                secondary: Colors.purple,
              )),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Center(
            child: Text(
              "BMI Calculator",
              style: TextStyle(fontSize: 30.0),
            ),
          ),
        ),
        body: InputPage(),
      ),
    ),
  );
}
