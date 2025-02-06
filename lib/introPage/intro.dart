import 'package:flutter/material.dart';
import 'package:fangate/introPage/delai_animation.dart';
import 'package:fangate/pages/inscription.dart'; // Assure-toi d'importer la page d'inscription

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignUpScreen()), // Redirection après 2s
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imageIntro/fond.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  children: [
                    DelaiAnimation(
                      delay: 1500,
                      child: SizedBox(
                        height: 250,
                        child: Image.asset('assets/imageIntro/img3.png'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    DelaiAnimation(
                      delay: 2500,
                      child: SizedBox(
                        height: 500,
                        width: 1500,
                        child: Image.asset('assets/imageIntro/img4.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/imageIntro/img2.png',
                fit: BoxFit.cover,
                height: 800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
