import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'presidents_data.dart';

class GameScreen extends StatefulWidget {
  final String niveau;
  const GameScreen({super.key, required this.niveau});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // --- État du jeu ---
  int score = 0;
  int bonnesReponses = 0;
  int mauvaisesReponses = 0;
  late int vies;
  late int tempsMax;
  int tempsRestant = 0;
  late President presidentCible;
  List<President> optionsActuelles = [];
  Timer? _timer;

  // --- Message feedback (style afrik_game : bandeau inline) ---
  String _message = "";
  Color _couleurMessage = Colors.transparent;

  // --- Config niveau ---
  int get _viesInitiales {
    switch (widget.niveau) {
      case 'facile': return 5;
      case 'moyen': return 3;
      case 'difficile': return 2;
      default: return 5;
    }
  }

  int get _tempsParTour {
    switch (widget.niveau) {
      case 'facile': return 15;
      case 'moyen': return 10;
      case 'difficile': return 5;
      default: return 15;
    }
  }

  bool get _modeAvance => widget.niveau == 'difficile';

  String get _niveauLabel {
    switch (widget.niveau) {
      case 'facile': return 'Facile';
      case 'moyen': return 'Moyen';
      case 'difficile': return 'Difficile';
      default: return '';
    }
  }

  String get _niveauDescription {
    switch (widget.niveau) {
      case 'facile': return 'Mode classique, 5 vies et 15 secondes par tour.';
      case 'moyen': return '3 vies, 10 secondes par tour.';
      case 'difficile': return '2 vies, 5 secondes, trouvez le nom via les indices.';
      default: return '';
    }
  }

  Color get _couleurNiveau {
    switch (widget.niveau) {
      case 'facile': return const Color(0xFF2E7D32);
      case 'moyen': return const Color(0xFFF9A825);
      case 'difficile': return Colors.red.shade700;
      default: return const Color(0xFF2E7D32);
    }
  }

  @override
  void initState() {
    super.initState();
    vies = _viesInitiales;
    tempsMax = _tempsParTour;
    _preparerNouveauTour();
    _demarrerTimer();
  }

  void _preparerNouveauTour() {
    final melange = List<President>.from(listePresidents)..shuffle();
    optionsActuelles = melange.take(9).toList();
    presidentCible = optionsActuelles[Random().nextInt(9)];
  }

  void _demarrerTimer() {
    _timer?.cancel();
    tempsRestant = tempsMax;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        if (tempsRestant > 0) {
          tempsRestant--;
        } else {
          // Temps écoulé : perte d'une vie
          vies--;
          _afficherMessage("Temps écoulé !", Colors.red);
          if (vies <= 0) {
            timer.cancel();
            _montrerFinDePartie();
          } else {
            _preparerNouveauTour();
            tempsRestant = tempsMax;
          }
        }
      });
    });
  }

  void _afficherMessage(String message, Color couleur) {
    setState(() {
      _message = message;
      _couleurMessage = couleur;
    });
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          _message = "";
          _couleurMessage = Colors.transparent;
        });
      }
    });
  }

  void _gererClic(President presidentChoisi) {
    if (vies <= 0) return;

    bool correct = presidentChoisi == presidentCible;

    setState(() {
      if (correct) {
        score += 10;
        bonnesReponses++;
        _afficherMessage("Bravo ! +10 points", Colors.green);
      } else {
        score = max(0, score - 5);
        vies--;
        mauvaisesReponses++;
        _afficherMessage("Dommage ! -5 points", Colors.red);
      }

      if (vies <= 0) {
        _timer?.cancel();
        Future.delayed(const Duration(milliseconds: 300), _montrerFinDePartie);
      } else {
        _preparerNouveauTour();
        tempsRestant = tempsMax;
      }
    });
  }

  int get _pourcentageReussite {
    int total = bonnesReponses + mauvaisesReponses;
    if (total == 0) return 0;
    return (bonnesReponses * 100 / total).round();
  }

  void _montrerFinDePartie() {
    if (!mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Partie terminée !"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Score final : $score"),
            Text("Bonnes réponses : $bonnesReponses"),
            Text("Précision : $_pourcentageReussite%"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                score = 0;
                bonnesReponses = 0;
                mauvaisesReponses = 0;
                vies = _viesInitiales;
                _preparerNouveauTour();
                _demarrerTimer();
              });
            },
            child: const Text("Rejouer"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("Accueil"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jeu - $_niveauLabel"),
        backgroundColor: const Color(0xFF1B5E20),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF2E7D32).withOpacity(0.15),
              const Color(0xFFF9FBE7),
            ],
          ),
        ),
        child: Column(
          children: [
            // En-tête : score, vies, temps
            Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xFF2E7D32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _enTeteItem(Icons.star, "Score", "$score"),
                  _enTeteItem(Icons.favorite, "Vies", "$vies"),
                  _enTeteItem(Icons.timer, "Temps", "${tempsRestant}s"),
                ],
              ),
            ),
            // Bandeau niveau
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              color: const Color(0xFF2E7D32).withOpacity(0.12),
              child: Text(
                "Niveau $_niveauLabel - $_niveauDescription",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: _couleurNiveau,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // Message feedback inline
            if (_message.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                color: _couleurMessage.withOpacity(0.2),
                child: Text(
                  _message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _couleurMessage == Colors.green
                        ? Colors.green.shade900
                        : Colors.red.shade900,
                  ),
                ),
              ),

            // Zone question
            _questionWidget(),

            // Grille ou liste selon niveau
            Expanded(
              child: _modeAvance
                  ? _listeChoixNoms()
                  : _grilleImagesPresidents(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _questionWidget() {
    if (!_modeAvance) {
      // Modes facile/moyen : afficher le nom à trouver
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Trouvez :",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
            Text(
              presidentCible.nom,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1B5E20),
              ),
            ),
            Text(
              presidentCible.pays,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
          ],
        ),
      );
    }

    // Mode difficile : photo + indices
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Column(
        children: [
          Text(
            "Qui est ce président ?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1B5E20),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Container(
            height: 95,
            width: 95,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF2E7D32), width: 3),
            ),
            child: ClipOval(
              child: Image.asset(
                presidentCible.image,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey.shade300,
                  child: Icon(Icons.person, size: 50, color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Période : ${presidentCible.mandat}",
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            presidentCible.fait,
            style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _grilleImagesPresidents() {
    return GridView.count(
      crossAxisCount: 3,
      padding: const EdgeInsets.all(8),
      children: optionsActuelles.map((president) {
        return GestureDetector(
          onTap: () => _gererClic(president),
          child: Card(
            elevation: 3,
            margin: const EdgeInsets.all(4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF2E7D32).withOpacity(0.08),
                    const Color(0xFFF9FBE7),
                  ],
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  president.image,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.grey.shade200,
                    child: Icon(Icons.person, size: 40, color: Colors.grey.shade500),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _listeChoixNoms() {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(12),
      childAspectRatio: 2.3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: optionsActuelles.map((president) {
        return ElevatedButton(
          onPressed: () => _gererClic(president),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF1B5E20),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: const Color(0xFF2E7D32).withOpacity(0.4)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          ),
          child: Text(
            president.nom,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        );
      }).toList(),
    );
  }

  Widget _enTeteItem(IconData icone, String label, String valeur) {
    return Column(
      children: [
        Icon(icone, color: Colors.white),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        Text(
          valeur,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
