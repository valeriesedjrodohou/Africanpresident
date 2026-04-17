import 'package:flutter/material.dart';
import 'presidents_data.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Découvrir les Présidents"),
        backgroundColor: const Color(0xFF2E7D32),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE8F5E9), Color(0xFFE3F2FD)],
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(8),
          children: listePresidents.map((president) {
            return _CartePresident(
              president: president,
              onTap: () => _montrerDetailsPresident(context, president),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _montrerDetailsPresident(BuildContext context, President president) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(president.nom),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF2E7D32), width: 3),
                ),
                child: ClipOval(
                  child: Image.asset(
                    president.image,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.person, size: 80),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _infoRow("Pays", president.pays),
              _infoRow("Période", president.mandat),
              const SizedBox(height: 8),
              const Text(
                "Fait intéressant :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                president.fait,
                textAlign: TextAlign.center,
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
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

  Widget _infoRow(String label, String valeur) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$label : ",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(valeur),
        ],
      ),
    );
  }
}

class _CartePresident extends StatelessWidget {
  final President president;
  final VoidCallback onTap;

  const _CartePresident({
    required this.president,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.all(4),
        child: Container(
          padding: const EdgeInsets.all(8),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image circulaire
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: const Color(0xFF2E7D32).withOpacity(0.5),
                        width: 2),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      president.image,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: Colors.grey.shade300,
                        child: Icon(Icons.person,
                            size: 40, color: Colors.grey.shade600),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Nom
              Text(
                president.nom,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              // Pays
              Text(
                president.pays,
                style: TextStyle(fontSize: 10, color: Colors.grey.shade700),
              ),
              const Divider(height: 8),
              // Période
              Text(
                president.mandat,
                style:
                    const TextStyle(fontSize: 9, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 2),
              // Fait
              Text(
                president.fait,
                style: const TextStyle(fontSize: 8),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
