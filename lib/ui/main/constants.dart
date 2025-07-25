import '../../domain/models/backgrounds.dart';

final initialScore = 1400.0;
final initialBet = 10;
var initialBackground = defaultBackgrounds.first.assetTitle;

var defaultBackgrounds = [
  Background(
      assetTitle: "assets/images/backgrounds/candy_back_1.png",
      price: 800,
      title: "Sweet Hills Adventure"),
  Background(
      assetTitle: "assets/images/backgrounds/candy_back_2.png",
      price: 1000,
      title: "Frosted Dreamland”"),
  Background(
      assetTitle: "assets/images/backgrounds/candy_back_3.png",
      price: 1250,
      title: "Sunny Candy Meadows"),
  Background(
      assetTitle: "assets/images/backgrounds/candy_back_4.png",
      price: 1500,
      title: "Magical Treat Kingdom"),
  Background(
      assetTitle: "assets/images/backgrounds/candy_back_5.png",
      price: 2000,
      title: "Candy Bug Valley"),
  Background(
      assetTitle: "assets/images/backgrounds/background_castle.jpg",
      price: 5000,
      title: "Candy Forever"),
];
