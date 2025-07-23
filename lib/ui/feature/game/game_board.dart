import 'package:candy_game/core/di/dependency_injection.dart';
import 'package:candy_game/domain/game_controller.dart';
import 'package:flutter/material.dart';

class GameBoardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var rows = getIt.get<GameController>().getRows();
    var columns = getIt.get<GameController>().getColumns();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final gridWidth = constraints.maxWidth;
          final itemSize = gridWidth / columns;
          final padding = 3.0;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(rows, (rowIndex) {
              return Row(
                children: List.generate(columns, (colIndex) {
                  return Padding(
                    padding: EdgeInsets.all(padding),
                    child: Container(
                      width: itemSize - 2 * padding,
                      height: itemSize - 2 * padding,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.4),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                }),
              );
            }),
          );
        },
      ),
    );
  }
}
