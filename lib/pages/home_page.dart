import 'package:flutter/material.dart';
import 'covoiturage.dart';
import 'check_ticket.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final String userName = "Cheikhoul"; // Nom de l'utilisateur (à récupérer de Firebase plus tard)

  final List<Widget> _pages = [
    HomeScreen(),
    TicketReservationScreen(),
    CarpoolingScreen(),
  ];

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.green, // Couleur de l'AppBar
      elevation: 0, // Pas d'ombre
      toolbarHeight: 100.0, // Augmente la hauteur
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espace entre les éléments
        children: [
          // Colonne contenant l'icône utilisateur et le texte en dessous
          Column(
            children: [
              CircleAvatar(
                radius: 22, // Taille du cercle
                backgroundColor: Colors.white, // Cercle blanc
                child: Icon(Icons.person, color: Colors.black45, size: 40), // Icône utilisateur bien centrée
              ),
            ],
          ),

          // Icône pièces + texte avec contour
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5), // Espacement interne
            decoration: BoxDecoration(
              color: Colors.white24, // Fond noir
              borderRadius: BorderRadius.circular(30), // Coins arrondis
              border: Border.all(color: Colors.black, width: 3), // Bordure dorée
            ),
            child: Row(
              children: [
                Icon(FontAwesomeIcons.coins, color: Colors.amber, size: 40), // Icône pièces
                SizedBox(width: 5),
                Text(
                  "120", // Exemple de nombre de pièces
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Affichage de la page sélectionnée
      appBar: _selectedIndex == 0 ? _buildAppBar() : null, // AppBar uniquement sur la page d'accueil
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.green[800], // Fond vert foncé
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Ombre légère sur la navbar
              blurRadius: 5,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.green[700], // Fond vert personnalisé
          selectedItemColor: Colors.white, // Couleur de l'icône sélectionnée
          unselectedItemColor: Colors.white60, // Couleur des icônes non sélectionnées
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            _buildNavItem(Icons.home, "Accueil", 0),
            _buildNavItem(Icons.confirmation_number, "Réservations", 1),
            _buildNavItem(Icons.directions_car, "Covoiturage", 2),
          ],
        ),
      ),
    );
  }

  // Fonction pour construire les éléments de la navbar avec l'ombre sur l'élément sélectionné
  BottomNavigationBarItem _buildNavItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.center,
        children: [
          if (_selectedIndex == index) // Ajoute l'ombre sous l'icône sélectionnée
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4), // Ombre gris foncé
                shape: BoxShape.circle,
              ),
            ),
          Icon(icon, size: 30), // Icône normale
        ],
      ),
      label: label,
    );
  }
}



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String userName = "Cheikhoul"; // Nom de l'utilisateur (Firebase plus tard)
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;

  final List<Map<String, String>> imageList = [
    {'image': 'assets/images/football.jpg', 'title': 'FOOTBALL'},
    {'image': 'assets/images/basketball.jpg', 'title': 'BASKETBALL'},
    {'image': 'assets/images/lutte.jpg', 'title': 'LUTTE'},
  ];



  // WIDGET NUMERO 1 POUR LE MATCH FOOT a la une
  Widget buildMatchCardFoot() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/images/logoCAF.png', width: 40, height: 40),
              SizedBox(width: 10),
              Text(
                "ÉLIMINATOIRE CAN",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logoEquipeFoot/logoSN.png', width: 30, height: 30),
              SizedBox(width: 10),
              Text("Sénégal VS Algérie", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(width: 10),
              Image.asset('assets/logoEquipeFoot/logoAG.jpg', width: 30, height: 30),
            ],
          ),
          SizedBox(height: 10),
          Text("Stade Maître Abdoulaye Wade", style: TextStyle(fontSize: 16, color: Colors.black54)),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("GO", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(width: 5),
                  Icon(Icons.confirmation_num, color: Colors.black),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }




  // WIDGET NUMERO 2 POUR LE MATCH BASKET a la une
  Widget buildMatchCardBasket() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/images/logoBasketSN.png', width: 40, height: 40),
              SizedBox(width: 10),
              Text(
                "BASKET SÉNÉGAL",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logoEquipeBasket/logoUSGoree.jpg', width: 30, height: 30),
              SizedBox(width: 10),
              Text("US Gorée VS Algérie", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(width: 10),
              Image.asset('assets/logoEquipeBasket/logoASDouane.png', width: 30, height: 30),
            ],
          ),
          SizedBox(height: 10),
          Text("Dakar ARENA", style: TextStyle(fontSize: 16, color: Colors.black54)),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("GO", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(width: 5),
                  Icon(Icons.confirmation_num, color: Colors.black),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }




  // WIDGET NUMERO 3 POUR LE MATCH LUTTE a la une
  Widget buildMatchCardLutte() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/images/logoLutteSN.jpg', width: 40, height: 40),
              SizedBox(width: 10),
              Text(
                "LUTTE SÉNÉGALAISE",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logoEquipeLutte/ballagaye.jpg', width: 30, height: 30),
              SizedBox(width: 10),
              Text("Balla Gaye 2 VS Modou Lo", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(width: 10),
              Image.asset('assets/logoEquipeLutte/Modoulo.jpg', width: 30, height: 30),
            ],
          ),
          SizedBox(height: 10),
          Text("Arène National", style: TextStyle(fontSize: 16, color: Colors.black54)),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("GO", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(width: 5),
                  Icon(Icons.confirmation_num, color: Colors.black),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: Colors.green,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bonjour, $userName 👋",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 5),
            Text(
              "Bienvenue sur votre billetterie",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "NOS SPORTS",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.transparent,
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: imageList.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  imageList[index]['image']!,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height: 220,
                                ),
                              ),
                              Positioned(
                                bottom: 50,
                                left: 10,
                                child: Text(
                                  imageList[index]['title']!,
                                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        imageList.length,
                            (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: _currentPage == index ? 12 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index ? Colors.blue : Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "A LA UNE",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            buildMatchCardFoot(),
            buildMatchCardBasket(),
            buildMatchCardLutte(),
          ],
        ),
      ),
    );
  }
}
