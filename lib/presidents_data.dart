class President {
  final String nom;
  final String pays;
  final String image;
  final String mandat;
  final String fait;

  President({
    required this.nom,
    required this.pays,
    required this.image,
    required this.mandat,
    required this.fait,
  });
}

List<President> listePresidents = [
  President(
    nom: "Alassane Ouattara",
    pays: "Côte d'Ivoire",
    image: "assets/images/ouattara.jpg",
    mandat: "2011 - aujourd'hui",
    fait: "Ancien directeur adjoint du FMI avant de devenir président.",
  ),
  President(
    nom: "Patrice Talon",
    pays: "Bénin",
    image: "assets/images/talon.jpg",
    mandat: "2016 - aujourd'hui",
    fait: "Homme d'affaires devenu président, surnommé 'le roi du coton'.",
  ),
  President(
    nom: "Paul Biya",
    pays: "Cameroun",
    image: "assets/images/paul_biya.jpeg",
    mandat: "1982 - aujourd'hui",
    fait: "L'un des chefs d'État les plus anciens au pouvoir en Afrique.",
  ),
  President(
    nom: "Ibrahim Traoré",
    pays: "Burkina Faso",
    image: "assets/images/traore.jpg",
    mandat: "2022 - aujourd'hui",
    fait:
        "Capitaine de l'armée devenu président à 34 ans, le plus jeune chef d'État africain.",
  ),
  President(
    nom: "Félix Tshisekedi",
    pays: "RDC",
    image: "assets/images/tshisekedi.jpg",
    mandat: "2019 - aujourd'hui",
    fait:
        "Fils de l'opposant historique Étienne Tshisekedi, premier président élu pacifiquement en RDC.",
  ),
  President(
    nom: "Nana Akufo-Addo",
    pays: "Ghana",
    image: "assets/images/akufo.jpg",
    mandat: "2017 - aujourd'hui",
    fait: "Avocat des droits de l'homme avant de devenir président du Ghana.",
  ),
  President(
    nom: "Cyril Ramaphosa",
    pays: "Afrique du Sud",
    image: "assets/images/ramaphosa.jpg",
    mandat: "2018 - aujourd'hui",
    fait:
        "Ancien syndicaliste et homme d'affaires, l'une des plus grandes fortunes d'Afrique.",
  ),
  President(
    nom: "Faure Gnassingbé",
    pays: "Togo",
    image: "assets/images/gnassingbe.jpg",
    mandat: "2005 - aujourd'hui",
    fait:
        "A succédé à son père Gnassingbé Eyadéma après le décès de ce dernier.",
  ),
  President(
    nom: 'João Lourenço',
    pays: 'Angola',
    image: 'assets/presidents/joao.jpg',
    mandat: '2017 - présent',
    fait:
        'Ancien ministre de la Défense, il a succédé à José Eduardo dos Santos.',
  ),
  President(
    nom: 'Macky Sall',
    pays: 'Sénégal',
    image: 'assets/presidents/macky_sall.jpg',
    mandat: '2012 - 2024',
    fait: 'Premier président sénégalais né après l\'indépendance du pays.',
  ),
  President(
    nom: 'Umaro Sissoco Embaló',
    pays: 'Guinée-Bissau',
    image: 'assets/presidents/embalo.jpg',
    mandat: '2020 - présent',
    fait: 'Ancien Premier ministre et général de brigade.',
  ),
  President(
    nom: 'Mohamed Ould Ghazouani',
    pays: 'Mauritanie',
    image: 'assets/presidents/ghazouani.jpg',
    mandat: '2019 - présent',
    fait: 'Ancien chef d\'état-major de l\'armée.',
  ),
  President(
    nom: 'Samia Suluhu Hassan',
    pays: 'Tanzanie',
    image: 'assets/presidents/samia.jpg',
    mandat: '2021 - présent',
    fait: 'Première femme présidente de Tanzanie et de l\'Afrique de l\'Est.',
  ),
  President(
    nom: 'Abdel Fattah el-Sissi',
    pays: 'Égypte',
    image: 'assets/presidents/elsissi.jpg',
    mandat: '2014 - présent',
    fait: 'Ancien chef d\'état-major de l\'armée égyptienne.',
  ),
  President(
    nom: 'Abiy Ahmed',
    pays: 'Éthiopie',
    image: 'assets/presidents/abiy.jpg',
    mandat: '2018 - présent',
    fait:
        'Lauréat du prix Nobel de la paix en 2019 pour ses efforts de paix avec l\'Érythrée.',
  ),
  President(
    nom: "Emmerson Mnangagwa",
    pays: "Zimbabwe",
    image: 'assets/presidents/mnangagwa.jpg',
    mandat: "2017 - présent",
    fait: "Surnommé 'Le Crocodile' pour sa ruse politique.",
  ),
  President(
    nom: "Yoweri Museveni",
    pays: "Ouganda",
    image: 'assets/presidents/museveni.jpg',
    mandat: "1986 - présent",
    fait: "Un des chefs d'État en exercice les plus anciens d'Afrique.",
  ),
  President(
    nom: "Isaias Afwerki",
    pays: "Érythrée",
    image: 'assets/presidents/afwerki.jpg',
    mandat: "1993 - présent",
    fait: "Dirige le pays d'une main de fer depuis son indépendance.",
  ),
  President(
    nom: "Alpha Condé",
    pays: "Guinée",
    image: 'assets/presidents/conde.jpg',
    mandat: "2010 - 2021",
    fait: "Premier président démocratiquement élu de Guinée.",
  ),
  President(
    nom: "Hage Geingob",
    pays: "Namibie",
    image: 'assets/presidents/geingob.jpg',
    mandat: "2015 - présent",
    fait: "Ancien Premier ministre et ministre des Affaires étrangères.",
  ),
  President(
    nom: "Salva Kiir Mayardit",
    pays: "Soudan du Sud",
    image: 'assets/presidents/kiir.jpg',
    mandat: "2011 - présent",
    fait: "Premier président du Soudan du Sud après l'indépendance du pays.",
  ),
  President(
    nom: "Mohamed Abdullahi Mohamed",
    pays: "Somalie",
    image: 'assets/presidents/mohamed.jpg',
    mandat: "2017 - présent",
    fait: "Ancien Premier ministre de la Somalie.",
  ),
  President(
    nom: "Evariste Ndayishimiye",
    pays: "Burundi",
    image: 'assets/presidents/ndayishimiye.jpg',
    mandat: "2020 - présent",
    fait: "Ancien général de l'armée burundaise.",
  ),
  President(
    nom: "Roch Marc Christian Kaboré",
    pays: "Burkina Faso",
    image: 'assets/presidents/kabore.jpg',
    mandat: "2015 - 2022",
    fait: "Ancien Premier ministre du Burkina Faso.",
  ),
  President(
    nom: "Ellen Johnson Sirleaf",
    pays: "Libéria",
    image: 'assets/presidents/sirleaf.jpg',
    mandat: "2006 - 2018",
    fait:
        "Première femme présidente d'Afrique et lauréate du prix Nobel de la paix en 2011.",
  ),
  President(
    nom: "John Magufuli",
    pays: "Tanzanie",
    image: 'assets/presidents/magufuli.jpg',
    mandat: "2015 - 2021",
    fait:
        "Surnommé 'le Bulldozer' pour sa politique de lutte contre la corruption et le gaspillage.",
  ),
  President(
    nom: "Blaise Compaoré",
    pays: "Burkina Faso",
    image: 'assets/presidents/compaore.jpg',
    mandat: "1987 - 2014",
    fait:
        "A pris le pouvoir après un coup d'État contre son beau-frère Thomas Sankara.",
  ),
  President(
    nom: "Mahamadou Issoufou",
    pays: "Niger",
    image: 'assets/presidents/issoufou.jpg',
    mandat: "2011 - 2021",
    fait: "Ancien ingénieur en mines avant de devenir président.",
  ),
  President(
    nom: "Hery Rajaonarimampianina",
    pays: "Madagascar",
    image: 'assets/presidents/rajaonarimampianina.jpg',
    mandat: "2014 - 2018",
    fait: "Ancien ministre des Finances de Madagascar.",
  ),
  President(
    nom: "Jean Ping",
    pays: "Gabon",
    image: 'assets/presidents/ping.jpg',
    mandat: "2009 - 2016",
    fait: "Ancien président de la Commission de l'Union africaine.",
  ),
];
