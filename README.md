# 🌍 AfricanPresident — Version personnelle

> **Projet universitaire de groupe — Version simplifiée par DOHOU Valérie**

---

## 📌 Contexte

Ce dépôt est **ma version personnelle** d'un projet réalisé dans le cadre d'un **travail de groupe universitaire** en développement mobile Flutter.

L'application est un **jeu éducatif** : le joueur doit identifier un président africain parmi une grille de photos. Simple, direct et fonctionnel.

👉 **Dépôt officiel du groupe :** _[https://github.com/JTECH07/afrik_presidents_game.git
]_ Ce lien renvoit le dépot officiel du groupe sur le profile du responsable du projet: Joseph ALAYE .

---

## 👥 Équipe du projet original

| Membre | Rôle |
|---|---|
| ALAYE Joseph   _(Respo)_ | Développement Flutter (logique de jeu) |
| **DOHOU Valérie** _(moi)_ | Données, tests |
| SAPHOU Latifath | Design, documentation |

---

## ✏️ Ma version : une approche simplifiée

Le projet de groupe complet comporte plusieurs niveaux, un timer, un système de vies et un mode apprentissage. Dans **ma version**, j'ai volontairement simplifié l'ensemble pour aller à l'essentiel. Cette simplification m'a permis de me concentrer sur la **logique de base du jeu** et la **qualité des données**.

---

## 🎮 Fonctionnement du jeu

1. L'écran d'accueil affiche un bouton **JOUER**
2. Une grille **3x3** de photos de présidents africains s'affiche
3. Le joueur doit trouver le président dont le nom est indiqué
4. **+10 points** pour une bonne réponse, **-5 points** pour une erreur
5. Un nouveau tour démarre automatiquement après chaque réponse

---

## 🗂️ Structure du projet

```
lib/
├── main.dart              # Point d'entrée de l'application
├── home_screen.dart       # Écran d'accueil
├── game_screen.dart       # Logique et affichage du jeu
└── presidents_data.dart   # Base de données des 12 présidents
```

---

## 🚀 Lancer le projet

```bash
flutter pub get
flutter run
```

> Flutter SDK requis. Les images des présidents doivent être placées dans `assets/presidents/`.

---

## 🎓 Informations académiques

- **Type :** Projet universitaire de groupe — version personnelle
- **Matière :** Développement mobile (Flutter)
- **Membres du groupe :** ALAYE Joseph · DOHOU Valérie · SAPHOU Latifath

---

*Ce dépôt est une version personnelle à des fins d'apprentissage. Le projet complet du groupe est disponible via le lien ci-dessus.*
https://github.com/JTECH07/afrik_presidents_game.git
