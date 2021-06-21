import 'package:dc_characters/model/heromovies.dart';

class SuperHero {
  final charTitle;
  final charName;
  final description;
  final pathImage;
  final comics;
  final rawColor;

  SuperHero({
    this.charTitle,
    this.charName,
    this.description,
    this.pathImage,
    this.comics,
    this.rawColor,
  });

  static List<SuperHero> dcCharacters = [
    //! Superman
    SuperHero(
      charTitle: 'Man of Steel',
      charName: 'Superman',
      description:
          "Faster than a speeding bullet, more powerful than a locomotive… The Man of Steel fights a never-ending battle for truth, justice, and the American way. ",
      pathImage: 'assets/superman.png',
      comics: HeroMovies.supermanComic,
      rawColor: 0xffA41209,
    ),
    //! batman
    SuperHero(
      charTitle: 'The Dark Knight',
      charName: 'Batman',
      description:
          "In the name of his murdered parents, Bruce Wayne wages eternal war on the criminals of Gotham City. He is vengeance. He is the night. He is Batman.",
      pathImage: 'assets/batman.png',
      comics: HeroMovies.batmanComic,
      rawColor: 0xFF35383B,
    ),
    //! Wonder woman
    SuperHero(
      charTitle: 'The Warrior',
      charName: 'Wonder Woman',
      description:
          "Beautiful as Aphrodite, wise as Athena, swifter than Hermes, and stronger than Hercules, Princess Diana of Themyscira fights for peace in Man's World.",
      pathImage: 'assets/wonderWoman.png',
      comics: HeroMovies.wonderWomanComic,
      rawColor: 0xFF80471F,
    ),
    //! Aquaman
    SuperHero(
      charTitle: 'King of the Seas',
      charName: 'Aquaman',
      description:
          " The son of a lighthouse keeper and an Atlantean queen, Arthur Curry is the bridge between the surface world and his tumultuous realm of the sea.",
      pathImage: 'assets/aquaman.png',
      comics: HeroMovies.aquamanComic,
      rawColor: 0xFF3D84B8,
    ),
    //! Flash
    SuperHero(
      charTitle: 'The light speed',
      charName: 'Flash',
      description:
          " Ever since the days of World War II, there has been a man clad in red who can run at impossible speeds, using his power to save lives and defend those who cannot defend themselves. All between the ticks of a second.",
      pathImage: 'assets/flash.png',
      comics: HeroMovies.flashComic,
      rawColor: 0xFFFF8303,
    ),
    //! Joker
    SuperHero(
      charTitle: 'The Clown ',
      charName: 'Joker',
      description:
          " A homicidal artist and an agent of chaos, the Clown Prince of Crime is the embodiment of everything Batman fights against…and everything he fears.",
      pathImage: 'assets/joker.png',
      comics: HeroMovies.jokerComic,
      rawColor: 0xFF6F42AD,
    ),
  ];
}
