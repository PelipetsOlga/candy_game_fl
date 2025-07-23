enum PieceType { A, B, C, D, E, F, G, H }

class PieceCalculation {
  final int count;
  final double multiplier;

  PieceCalculation({required this.count, required this.multiplier});
}

class Piece {
  final PieceType type;
  final String assetTitle;
  final List<PieceCalculation> calculations;

  Piece({
    required this.type,
    required this.assetTitle,
    required this.calculations,
  });
}

var defaultPieces = [
  Piece(
      type: PieceType.A,
      assetTitle: 'assets/images/pieces/piece_a.png',
      calculations: [
        PieceCalculation(count: 7, multiplier: 0.5),
        PieceCalculation(count: 8, multiplier: 1.2),
        PieceCalculation(count: 9, multiplier: 1.2),
        PieceCalculation(count: 10, multiplier: 1.2),
        PieceCalculation(count: 11, multiplier: 1.4),
      ]),
  Piece(
      type: PieceType.B,
      assetTitle: 'assets/images/pieces/piece_b.png',
      calculations: [
        PieceCalculation(count: 7, multiplier: 0.5),
        PieceCalculation(count: 8, multiplier: 1.2),
        PieceCalculation(count: 9, multiplier: 1.2),
        PieceCalculation(count: 10, multiplier: 1.2),
        PieceCalculation(count: 11, multiplier: 1.4),
      ]),
  Piece(
      type: PieceType.C,
      assetTitle: 'assets/images/pieces/piece_c.png',
      calculations: [
        PieceCalculation(count: 7, multiplier: 0.5),
        PieceCalculation(count: 8, multiplier: 1.2),
        PieceCalculation(count: 9, multiplier: 1.2),
        PieceCalculation(count: 10, multiplier: 1.2),
        PieceCalculation(count: 11, multiplier: 1.4),
      ]),
  Piece(
      type: PieceType.D,
      assetTitle: 'assets/images/pieces/piece_d.png',
      calculations: [
        PieceCalculation(count: 7, multiplier: 0.7),
        PieceCalculation(count: 8, multiplier: 1.3),
        PieceCalculation(count: 9, multiplier: 1.3),
        PieceCalculation(count: 10, multiplier: 1.3),
        PieceCalculation(count: 11, multiplier: 1.5),
      ]),
  Piece(
      type: PieceType.E,
      assetTitle: 'assets/images/pieces/piece_e.png',
      calculations: [
        PieceCalculation(count: 7, multiplier: 0.7),
        PieceCalculation(count: 8, multiplier: 1.3),
        PieceCalculation(count: 9, multiplier: 1.3),
        PieceCalculation(count: 10, multiplier: 1.3),
        PieceCalculation(count: 11, multiplier: 1.5),
      ]),
  Piece(
      type: PieceType.F,
      assetTitle: 'assets/images/pieces/piece_f.png',
      calculations: [
        PieceCalculation(count: 7, multiplier: 0.7),
        PieceCalculation(count: 8, multiplier: 1.3),
        PieceCalculation(count: 9, multiplier: 1.3),
        PieceCalculation(count: 10, multiplier: 1.3),
        PieceCalculation(count: 11, multiplier: 1.5),
      ]),
  Piece(
      type: PieceType.G,
      assetTitle: 'assets/images/pieces/piece_g.png',
      calculations: [
        PieceCalculation(count: 7, multiplier: 1),
        PieceCalculation(count: 8, multiplier: 1.4),
        PieceCalculation(count: 9, multiplier: 1.4),
        PieceCalculation(count: 10, multiplier: 1.4),
        PieceCalculation(count: 11, multiplier: 1.8),
      ]),
  Piece(
      type: PieceType.H,
      assetTitle: 'assets/images/pieces/piece_i.png',
      calculations: [
        PieceCalculation(count: 7, multiplier: 1.2),
        PieceCalculation(count: 8, multiplier: 1.6),
        PieceCalculation(count: 9, multiplier: 1.6),
        PieceCalculation(count: 10, multiplier: 1.6),
        PieceCalculation(count: 11, multiplier: 2.2),
      ]),
];
