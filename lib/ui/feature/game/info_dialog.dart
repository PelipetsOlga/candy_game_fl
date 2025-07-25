import 'package:candy_game/core/di/dependency_injection.dart';
import 'package:candy_game/domain/game_controller.dart';
import 'package:candy_game/domain/models/models.dart';
import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pieces = getIt.get<GameController>().pieces;
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'GAME RULES',
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
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
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ..._buildPieceRows(pieces, context),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Symbols pay anywhere on the screen. '
                            'The total number of the same symbol on the screen '
                            'at the end of a spin determines the value of the win.',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPieceRows(List<Piece> pieces, BuildContext context) {
    List<Widget> rows = [];
    for (int i = 0; i < pieces.length; i += 2) {
      if (i + 1 < pieces.length) {
        // Two items in the row
        rows.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
            child: Row(
              children: [
                Expanded(child: _buildRuleItem(pieces[i], context)),
                const SizedBox(width: 8),
                Expanded(child: _buildRuleItem(pieces[i + 1], context)),
              ],
            ),
          ),
        );
      } else {
        // Single item in the last row
        rows.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(child: _buildRuleItem(pieces[i], context)),
                const SizedBox(width: 16),
                const Expanded(child: SizedBox()), // Empty space
              ],
            ),
          ),
        );
      }
    }
    return rows;
  }

  Widget _buildRuleItem(Piece piece, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Image.asset(
              piece.assetTitle,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "${piece.calculations.firstOrNull?.count}: x ${piece.calculations.firstOrNull?.multiplier}",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "${(piece.calculations.firstOrNull?.count ?? 0) + 1}-${(piece.calculations.lastOrNull?.count ?? 0) - 1}: x ${piece.calculations[1]?.multiplier}",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "${piece.calculations.lastOrNull?.count}: x ${piece.calculations.lastOrNull?.multiplier}",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
