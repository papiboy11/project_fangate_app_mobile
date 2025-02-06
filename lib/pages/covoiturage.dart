import 'package:flutter/material.dart';

// 🚗 Page de covoiturage
class CarpoolingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green,
        child: Center(
          child: Text(
            "Trouvez un covoiturage ici !",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Texte en blanc pour contraste
            ),
          ),
        ),
      ),
    );
  }
}