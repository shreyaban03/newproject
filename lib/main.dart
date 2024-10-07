import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("KRS Day 1"),
          backgroundColor: Colors.red,
        ),
        body: const Center(
          child: Text(
            "Hello, App developers!",
            style: TextStyle(
              fontSize: 50.0, 
              
              // Increase the font size
            ),
          ),
          child:Text(
            "Hello, App developers!"),
        ),
      ),
    );
  }
}
