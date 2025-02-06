import 'package:flutter/material.dart';

import 'pages/inscription.dart';
import 'pages/connexion.dart';
import 'pages/home_page.dart'; // Import de la page d'accueil

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fangate',
      theme: ThemeData(
        colorSchemeSeed: Colors.lightGreen, // Couleur principale
        scaffoldBackgroundColor: Colors.white,
      ),
      //home: SignUpScreen(),
      //home: LoginScreen(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
