import 'package:candy_game/ui/feature/game/game.dart';
import 'package:candy_game/ui/feature/game/game_board.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class CandyGameWidget extends StatelessWidget {
  const CandyGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    print('CandyGameWidget - Screen size: $screenSize');

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/images/backgrounds/background_castle.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(children: [
                  GameBoardWidget(),
                ]),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Place your bets', textAlign: TextAlign.center),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {}, child: Text('Refresh')),
                          ElevatedButton(onPressed: () {}, child: Text('Bets')),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
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
                          Text('Credit: 1000, Bet 100'),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.info_outline,
                              color: Colors.white,
                              size: 48,
                            ),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              minimumSize: const Size(48, 48),
                              maximumSize: const Size(48, 48),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
