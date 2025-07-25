import 'package:candy_game/di/di.dart';
import 'package:candy_game/domain/repository.dart';
import 'package:candy_game/ui/feature/bets/bets_dialog.dart';
import 'package:candy_game/ui/feature/game/game_board.dart';
import 'package:candy_game/ui/feature/info/info_dialog.dart';
import 'package:candy_game/ui/feature/settings/settings.dart';
import 'package:candy_game/ui/main/constants.dart';
import 'package:flutter/material.dart';

class CandyGameWidget extends StatefulWidget {
  const CandyGameWidget({super.key});

  @override
  _CandyGameWidgetState createState() => _CandyGameWidgetState();
}

class _CandyGameWidgetState extends State<CandyGameWidget>
    with TickerProviderStateMixin {
  double _credit = 1000;
  int _bet = 100;
  String _background = defaultBackgrounds.first.assetTitle;
  late AnimationController _refreshAnimationController;
  bool _isRefreshing = false;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _loadGameData();
    _refreshAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _refreshAnimationController.dispose();
    super.dispose();
  }

  Future<void> _loadGameData() async {
    final repository = getIt.get<GameRepository>();
    final credit = await repository.getScore();
    final bet = await repository.getBet();
    final background = await repository.getCurrentBackground();
    setState(() {
      _credit = credit;
      _bet = bet;
      _background = background;
    });
  }

  void _handleRefreshTap() async {
    setState(() {
      _isPressed = false;
    });

    if (_isRefreshing) return;

    setState(() {
      _isRefreshing = true;
    });

    // Start spinning animation
    _refreshAnimationController.repeat();

    // Simulate refresh operation
    await Future.delayed(const Duration(milliseconds: 500));

    // Stop animation
    _refreshAnimationController.stop();
    _refreshAnimationController.reset();

    setState(() {
      _isRefreshing = false;
    });

    // Reload game data
    await _loadGameData();
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

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: InfoDialog(),
        );
      },
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

  Widget _refreshButton(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) => _handleRefreshTap(),
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        width: 80,
        height: 80,
        transform: Matrix4.identity()..scale(_isPressed ? 0.9 : 1.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isPressed ? 0.6 : 0.4),
              blurRadius: _isPressed ? 8 : 4,
              offset: Offset(0, _isPressed ? 2 : 1),
            ),
          ],
        ),
        child: Center(
          child: RotationTransition(
            turns: _refreshAnimationController,
            child: const Icon(
              Icons.refresh,
              color: Colors.white,
              size: 64,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    print('CandyGameWidget - Screen size: $screenSize');

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_background),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Place your bets',
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      SizedBox(height: 16),
                      _refreshButton(context),
                      SizedBox(height: 16),
                      Text(
                        'Credit: ${_credit.toStringAsFixed(0)}',
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
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
                          ElevatedButton(
                              onPressed: () => _showBetsDialog(context),
                              child: Text('Bet $_bet')),
                          IconButton(
                            onPressed: () => _showInfoDialog(context),
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
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
