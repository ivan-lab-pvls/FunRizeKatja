import 'package:hive_flutter/hive_flutter.dart';

part 'game.g.dart';

@HiveType(typeId: 0)
class Game {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String assetName;

  Game({required this.name, required this.assetName});

  static final List<Game> games = [
    Game(
      name: 'Poker',
      assetName: 'assets/images/games/poker.jpeg',
    ),
    Game(
      name: 'Baccarat',
      assetName: 'assets/images/games/baccarat.jpeg',
    ),
    Game(
      name: 'Badugi',
      assetName: 'assets/images/games/badugi.jpeg',
    ),
    Game(
      name: 'Roulette',
      assetName: 'assets/images/games/roulette.jpeg',
    ),
    Game(
      name: 'Texas hold\'em',
      assetName: 'assets/images/games/texas_holdem.jpeg',
    ),
    Game(
      name: 'Pai Gow Poker',
      assetName: 'assets/images/games/pai_gow_poker.jpeg',
    ),
  ];
}
