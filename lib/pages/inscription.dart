import 'package:flutter/material.dart';

import 'package:intl/intl.dart'; // Import pour la localisation
import 'package:intl/date_symbol_data_local.dart';

import 'connexion.dart'; // Assure-toi d'avoir cette page pour la redirection



class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  // PERMET DE TRANSFORMER LE CANLENDRIER EN FRANCAIS
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr', null); // Initialisation pour le français
  }


  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthPlaceController = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100), // Hauteur de l'AppBar
        child: ClipPath(
          clipper: WaveClipper(), // Utilisation du ClipPath pour la courbe
          child: AppBar(
            backgroundColor: Colors.green, // Couleur de fond de l'AppBar
            elevation: 0, // Pour éviter l'ombre sous l'AppBar
            //title: Text('Inscription'),
            centerTitle: true,
          ),
        ),
      ),

      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Permet le défilement du formulaire
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0), // Réduis l'espacement en haut
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Alignement des éléments à gauche
              children: [
                // Titre "Inscription"
                SizedBox(height: 10), // Ajuste l'espace entre l'AppBar et le contenu
                Text(
                  "Inscription",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Créez un compte si vous n'en avez pas",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),

                buildInputField("Nom Complet", _nameController, false, Icons.person),
                buildInputField("E-mail", _emailController, false, Icons.email, keyboardType: TextInputType.emailAddress),
                buildInputField("Mot de Passe", _passwordController, true, Icons.lock),
                buildInputField("Téléphone", _phoneController, false, Icons.phone, keyboardType: TextInputType.phone),

                // Sélection de la date de naissance
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.calendar_today, color: Colors.green, size: 24),
                        SizedBox(width: 10),
                        Text(
                          _selectedDate == null
                              ? "Date de naissance"
                              //: "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
                              : DateFormat('dd MMMM yyyy', 'fr').format(_selectedDate!),
                          style: const TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),

                buildInputField("Lieu de Naissance", _birthPlaceController, false, Icons.location_on),

                const SizedBox(height: 20),

                // Bouton S'inscrire avec redirection après succès
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Affichage du message d'inscription réussie
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Inscription réussie !"),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 2),
                          ),
                        );

                        // Attendre 2 secondes avant de rediriger
                        Future.delayed(Duration(seconds: 2), () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()), // Redirection
                          );
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "S'inscrire",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 50),// Elevation du bouton inscription
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Fonction pour construire un champ de saisie avec une icône
  Widget buildInputField(String hintText, TextEditingController controller, bool isPassword, IconData icon, {TextInputType keyboardType = TextInputType.text}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.green, size: 24),
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 18),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Veuillez entrer votre $hintText";
          }
          return null;
        },
      ),
    );
  }

  // Fonction pour sélectionner une date
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: const Locale('fr', 'FR'), // ✅ Définit le calendrier en français
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.green,
            colorScheme: ColorScheme.light(primary: Colors.green),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

}

// Classe pour la courbe Bézier de l'AppBar
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, size.height - 30);

    // Courbe Bézier
    path.quadraticBezierTo(
      size.width / 4, size.height, // Point de contrôle
      size.width / 2, size.height - 50, // Point final de la courbe
    );

    path.quadraticBezierTo(
      3 * size.width / 4, size.height - 100, // Deuxième courbe
      size.width, size.height - 30,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


