import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodak - Food Delivery',
      home: const BottomNavbar(),
      theme: ThemeData(
        fontFamily: 'Skranji',
        useMaterial3: false,
        primarySwatch: Colors.deepOrange,
        dividerTheme: DividerThemeData(
          indent: 20,
          endIndent: 20,
          thickness: 3,
          color: Colors.black45,
        ),
        listTileTheme: ListTileThemeData(
          iconColor: Colors.deepOrange,
          textColor: Colors.black87,
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }
}
