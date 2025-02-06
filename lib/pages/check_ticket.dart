import 'package:flutter/material.dart';

// 🎟️ Page de réservation de tickets
class TicketReservationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green,
        child: Center(
          child: Text(
            "Réserve tes tickets ici !",
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