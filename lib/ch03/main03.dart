import 'screens/main_screen.dart';
import 'theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(CarrotMarketUI());

class CarrotMarketUI extends StatelessWidget {
  const CarrotMarketUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Carrot",
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      theme: theme(),
    );
  }
}
