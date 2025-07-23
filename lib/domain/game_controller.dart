import 'dart:math';

import 'package:candy_game/domain/models/models.dart';
import 'package:flutter/material.dart';

class GameController extends ChangeNotifier {
  late List<List<PieceType?>> board;
  int rows = 5;
  int columns = 6;
  int bank = 200;
  int bet = 10;
  bool isGameOver = false;
  final List<Piece> pieces = defaultPieces;
  final Random _random = Random();

  int getRows() => rows;

  int getColumns() => columns;

  int getCapacity() => rows * columns;

  void refreshBoard() {
    if (bank < bet) {
      isGameOver = true;
      notifyListeners();
      return;
    }

    bank -= bet;
    // Fill board with random pieces
    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < columns; col++) {
        board[row][col] = pieces[_random.nextInt(pieces.length)].type;
      }
    }
    checkMatches();
    notifyListeners();
  }

// Count pieces and process matches
  void checkMatches() {
    bool hasMatches;
    do {
      hasMatches = false;
      Map<PieceType, int> counts = {};
      // Count all pieces on the board
      for (int row = 0; row < rows; row++) {
        for (int col = 0; col < columns; col++) {
          if (board[row][col] != null) {
            counts[board[row][col]!] = (counts[board[row][col]!] ?? 0) + 1;
          }
        }
      }

      // Check for matches and calculate payouts
      counts.forEach((pieceType, count) {
        Piece? piece = pieces.firstWhere((p) => p.type == pieceType);
        PieceCalculation? calculation = piece.calculations.firstWhere(
          (calc) => count >= calc.count,
          orElse: () => PieceCalculation(count: count + 1, multiplier: 0.0),
        );
        if (calculation.multiplier > 0.0) {
          bank += (bet * calculation.multiplier).round();
          hasMatches = true;
          removePieces(pieceType);
        }
      });

      if (hasMatches) {
        movePiecesDown();
        refillBoard();
      }
    } while (hasMatches && bank >= bet);

    if (bank < bet) {
      isGameOver = true;
    }
    notifyListeners();
  }

// Remove matching pieces
  void removePieces(PieceType pieceType) {
    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < columns; col++) {
        if (board[row][col] == pieceType) {
          board[row][col] = null;
        }
      }
    }
  }

// Move remaining pieces down in each column
  void movePiecesDown() {
    for (int col = 0; col < columns; col++) {
      // Collect non-null pieces in the column
      List<PieceType> nonNullPieces = [];
      for (int row = rows - 1; row >= 0; row--) {
        if (board[row][col] != null) {
          nonNullPieces.add(board[row][col]!);
        }
      }

      // Fill column from bottom up with non-null pieces
      for (int row = rows - 1, i = nonNullPieces.length - 1; row >= 0; row--) {
        if (i >= 0) {
          board[row][col] = nonNullPieces[i];
          i--;
        } else {
          board[row][col] = null; // Empty slots at the top
        }
      }
    }
  }

// Refill empty cells at the top with new random pieces
  void refillBoard() {
    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < columns; col++) {
        if (board[row][col] == null) {
          board[row][col] = pieces[_random.nextInt(pieces.length)].type;
        }
      }
    }
  }

// Reset game for a new session
  void resetGame({int? newRows, int? newColumns}) {
    bank = 200;
    isGameOver = false;
    rows = newRows ?? rows;
    columns = newColumns ?? columns;
    board = List.generate(rows, (_) => List.filled(columns, null));
    refreshBoard();
  }

// Get asset title for a piece type (for UI rendering)
  String getAssetTitle(PieceType pieceType) {
    return pieces.firstWhere((p) => p.type == pieceType).assetTitle;
  }
}
