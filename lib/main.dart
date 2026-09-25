
import 'package:flutter/material.dart';
import 'package:primer_parcial/screens/splash_screen.dart';

void main() {  
  runApp(const LionFlowers()); 
}

class LionFlowers extends StatelessWidget{  
  const LionFlowers({super.key}); 

  @override 
  Widget build(BuildContext context) { 
    return MaterialApp(
      title: 'Lion Flowers',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const SplashScreen(),
    );
  }
}
