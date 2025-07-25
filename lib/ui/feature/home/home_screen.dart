import 'package:candy_game/core/di/dependency_injection.dart';
import 'package:candy_game/domain/game_controller.dart';
import 'package:candy_game/domain/repository.dart';
import 'package:candy_game/ui/feature/settings/settings.dart';
import 'package:candy_game/ui/feature/game/game_widget.dart';
import 'package:candy_game/ui/feature/shop/shop.dart';
import 'package:candy_game/ui/main/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _background = defaultBackgrounds.first.assetTitle;

  @override
  void initState() {
    super.initState();
    _loadBackground();
  }

  Future<void> _loadBackground() async {
    final repository = getIt.get<GameRepository>();
    final background = await repository.getCurrentBackground();
    setState(() {
      _background = background;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_background),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SWEET BILLIONS',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        shadows: [
                          const Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 4,
                            color: Colors.white,
                          ),
                          const Shadow(
                            offset: Offset(-2, -2),
                            blurRadius: 4,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () => _navigateToGame(context),
                      child: const Text(
                        'PLAY',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => _showShopDialog(context),
                      child: const Text(
                        'SHOP',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 24,
              bottom: 72,
              child: IconButton(
                onPressed: () => _showSettingsDialog(context),
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 48,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  minimumSize: const Size(48, 48),
                  maximumSize: const Size(48, 48),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
            child: SettingsScreen(),
        );
      },
    );
  }

  void _showShopDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: ShopDialog(),
        );
      },
    );
    // Refresh background when returning from shop
    _loadBackground();
  }

  void _navigateToGame(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CandyGameWidget(),
      ),
    );
  }
}

