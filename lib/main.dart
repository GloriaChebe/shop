import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppy/pages/dashboard.dart';
import 'package:shoppy/pages/cart_provider.dart'; // Import the CartProvider class

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(), // Provide an instance of CartProvider
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopeasy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F5DC),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}




