import 'package:candy_game/ui/feature/settings/settings.dart';
import 'package:candy_game/ui/feature/game/game_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgrounds/background_castle.jpg'),
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
                      onPressed: () {},
                      child: const Text(
                        'FORTUNE WHEEL',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
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

  void _navigateToGame(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CandyGameWidget(),
      ),
    );
  }
}

