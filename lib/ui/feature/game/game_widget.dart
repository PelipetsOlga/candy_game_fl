import 'package:candy_game/ui/feature/game/game.dart';
import 'package:candy_game/ui/feature/game/game_board.dart';
import 'package:candy_game/ui/feature/game/bets_dialog.dart';
import 'package:candy_game/di/di.dart';
import 'package:candy_game/domain/repository.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class CandyGameWidget extends StatefulWidget {
  const CandyGameWidget({super.key});

  @override
  _CandyGameWidgetState createState() => _CandyGameWidgetState();
}

class _CandyGameWidgetState extends State<CandyGameWidget> {
  double _credit = 1000;
  int _bet = 100;

  @override
  void initState() {
    super.initState();
    _loadGameData();
  }

  Future<void> _loadGameData() async {
    final repository = getIt.get<GameRepository>();
    final credit = await repository.getCount();
    final bet = await repository.getBet();
    setState(() {
      _credit = credit;
      _bet = bet;
    });
  }

  void _showBetsDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: BetsDialog(),
        );
      },
    );
    // Reload data after dialog closes to get updated bet value
    _loadGameData();
  }

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
                          ElevatedButton(
                              onPressed: () => _showBetsDialog(context), 
                              child: Text('Bets')),
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
                          Text('Credit: ${_credit.toStringAsFixed(0)}, Bet $_bet'),
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
