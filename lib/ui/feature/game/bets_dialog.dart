import 'package:candy_game/di/di.dart';
import 'package:candy_game/domain/repository.dart';
import 'package:flutter/material.dart';

class BetsDialog extends StatefulWidget {
  @override
  _BetsDialogState createState() => _BetsDialogState();
}

class _BetsDialogState extends State<BetsDialog> {
  int _currentBet = 10;
  final List<int> _betValues = [1, 5, 10, 25, 50, 100];

  @override
  void initState() {
    super.initState();
    _loadBet();
  }

  Future<void> _loadBet() async {
    final repository = getIt.get<GameRepository>();
    final bet = await repository.getBet();
    setState(() {
      _currentBet = bet;
    });
  }

  void _decreaseBet() {
    final currentIndex = _betValues.indexOf(_currentBet);
    if (currentIndex > 0) {
      setState(() {
        _currentBet = _betValues[currentIndex - 1];
      });
      _saveBet();
    } else{
      setState(() {
        _currentBet = _betValues[2];
      });
      _saveBet();
    }
  }

  void _increaseBet() {
    final currentIndex = _betValues.indexOf(_currentBet);
    if (currentIndex < _betValues.length - 1) {
      setState(() {
        _currentBet = _betValues[currentIndex + 1];
      });
      _saveBet();
    }
  }

  Future<void> _saveBet() async {
    await getIt.get<GameRepository>().setBet(_currentBet);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header with title and close button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'BET SETTINGS',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(
                        color: const Color(0xFF80DEEA), // Light blue color
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Color(0xFF80DEEA), // Light blue color
                  size: 32,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 32),
          
          // TOTAL BET section
          Text(
            'TOTAL BET',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 24),
          
          // Bet adjustment controls
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Minus button
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: _currentBet > 1 
                      ? const Color(0xFFFF8A65) // Orange color
                      : Colors.grey, // Disabled color
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: _currentBet > 1 ? _decreaseBet : null,
                    padding: EdgeInsets.zero,
                  ),
                ),
                const SizedBox(width: 16),
                
                // Bet value display
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      '$_currentBet',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                
                // Plus button
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: _currentBet < 100 
                      ? const Color(0xFFFF8A65) // Orange color
                      : Colors.grey, // Disabled color
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: _currentBet < 100 ? _increaseBet : null,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 