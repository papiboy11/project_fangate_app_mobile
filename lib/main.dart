import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:intl/date_symbol_data_local.dart';

import 'introPage//intro.dart';
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

      localizationsDelegates: [ // ✅ Ajoute ces lignes pour la localisation
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fr', 'FR'), // ✅ Définit le français comme langue principale
      ],

      home: IntroPage(),
      //home: SignUpScreen(),
      //home: LoginScreen(),
      //home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
