import 'package:candy_game/ui/feature/settings/settings.dart';
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SWEET BILLIONS',
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('PLAY'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('FORTUNE WHEEL'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('SHOP'),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 24,
              bottom: 36,
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
}
