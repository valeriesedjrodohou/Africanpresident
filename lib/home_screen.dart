import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'game_screen.dart';
import 'learn_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Présidents d'Afrique"),
        backgroundColor: const Color(0xFF1B5E20),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE8F5E9), Color(0xFFF9FBE7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Image et message de bienvenue
            Expanded(
              flex: 3,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF2E7D32),
                          width: 4,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/talon.jpg",
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: const Color(0xFFC8E6C9),
                              child: const Icon(
                                Icons.public,
                                size: 100,
                                color: Color(0xFF2E7D32),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Bienvenue sur Présidents d'Afrique !",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "Testez vos connaissances sur les chefs d'État africains",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Ligne 1 : Jouer + Apprendre
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  _boutonAccueil(
                    context,
                    "Jouer",
                    Icons.play_arrow,
                    const Color(0xFF2E7D32),
                    () => _choisirNiveauEtJouer(context),
                  ),
                  _boutonAccueil(
                    context,
                    "Apprendre",
                    Icons.school,
                    const Color(0xFF388E3C),
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LearnScreen()),
                    ),
                  ),
                ],
              ),
            ),

            // Ligne 2 : À propos + Quitter
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  _boutonAccueil(
                    context,
                    "À propos",
                    Icons.info,
                    Colors.blue.shade700,
                    () => _montrerAPropos(context),
                  ),
                  _boutonAccueil(
                    context,
                    "Quitter",
                    Icons.exit_to_app,
                    Colors.red.shade700,
                    () => _montrerConfirmationQuitter(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _boutonAccueil(
    BuildContext context,
    String texte,
    IconData icone,
    Color couleur,
    VoidCallback onTap,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: couleur.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: couleur, width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icone, size: 40, color: couleur),
              const SizedBox(height: 8),
              Text(
                texte,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: couleur,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _montrerAPropos(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("À propos"),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Présidents d'Afrique v2.0"),
            SizedBox(height: 8),
            Text("Un jeu éducatif pour découvrir les présidents africains."),
            SizedBox(height: 8),
            Text("Développé avec Flutter et Dart."),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Fermer"),
          ),
        ],
      ),
    );
  }

  void _choisirNiveauEtJouer(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Choisir un niveau"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _optionNiveau(
              dialogContext,
              context,
              'facile',
              'Facile',
              'Mode classique, 5 vies et 15 secondes par tour.',
              const Color(0xFF2E7D32),
            ),
            const SizedBox(height: 8),
            _optionNiveau(
              dialogContext,
              context,
              'moyen',
              'Moyen',
              '3 vies, 10 secondes par tour, grille visuelle rapide.',
              const Color(0xFFF9A825),
            ),
            const SizedBox(height: 8),
            _optionNiveau(
              dialogContext,
              context,
              'difficile',
              'Difficile',
              '2 vies, 5 secondes, trouvez le nom via les indices.',
              Colors.red.shade700,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text("Annuler"),
          ),
        ],
      ),
    );
  }

  Widget _optionNiveau(
    BuildContext dialogContext,
    BuildContext context,
    String niveau,
    String label,
    String description,
    Color couleur,
  ) {
    return InkWell(
      onTap: () {
        Navigator.pop(dialogContext);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => GameScreen(niveau: niveau)),
        );
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: couleur.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: couleur.withOpacity(0.35)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: couleur,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              description,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }

  void _montrerConfirmationQuitter(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Quitter"),
        content: const Text("Voulez-vous vraiment quitter l'application ?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Non"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              SystemNavigator.pop();
            },
            child: const Text("Oui"),
          ),
        ],
      ),
    );
  }
}
