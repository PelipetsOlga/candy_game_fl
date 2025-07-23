# Candies Game Rules

**Overview**:  
"Candies" is a puzzle game where players bet points and fill a grid with random pieces labeled A, B, C, D, E, F, G, H. Matching identical pieces across the board triggers payouts based on piece-specific multipliers, while insufficient matches deduct the bet. The goal is to grow the player’s bank through strategic betting and lucky matches until the bank is depleted.

**Rules**:

1. **Game Board**:  
   - The board is a grid with flexible dimensions (rows and columns set per level, e.g., 6 columns x 5 rows = 30 cells).  
   - Each cell holds one piece, randomly selected from 8 types: A, B, C, D, E, F, G, H (replaceable with themed images, e.g., candies).  

2. **Game Setup**:  
   - Players start with a bank of 200 points.  
   - The bet is set to 10 points by default at the game’s first launch.  
   - Players can change the bet (1, 5, 10, 25, 50, or 100 points), and the selected bet persists across rounds and game sessions.  
   - The bet is deducted from the bank at the start of each round.

3. **Gameplay**:  
   - The player taps the “Refresh” button to fill all cells with random pieces, provided their bank has enough points to cover the bet.  
   - After filling, the game checks for matches (identical pieces across the entire board).  
   - **Matching**: A match occurs if the number of identical pieces meets or exceeds the piece-specific minimum (see Multipliers below).  
   - **Collapsing**: Matching pieces are removed (“collapse”), and the player’s bank is increased by `bet * multiplier` for each matching set.  
   - **Automatic Refill**: New random pieces automatically fill the empty cells, and the game checks for new matches in the same round. This repeats until no further matches occur.  
   - **No Matches**: If no piece type meets its minimum match threshold, no payout is awarded, and the bet (already deducted) is lost.

4. **Multipliers**:  
   Each piece type has a specific minimum number of pieces required for a match and corresponding multipliers based on the count:  
   - **Piece A**: Minimum 7; 7 = 1.0x, 8–10 = 1.4x, 11+ = 1.8x  
   - **Piece B**: Minimum 6; 6 = 0.8x, 7–9 = 1.2x, 10+ = 1.6x  
   - **Piece C**: Minimum 7; 7 = 1.1x, 8–10 = 1.5x, 11+ = 2.0x  
   - **Piece D**: Minimum 8; 8 = 0.9x, 9–11 = 1.3x, 12+ = 1.7x  
   - **Piece E**: Minimum 6; 6 = 1.2x, 7–9 = 1.6x, 10+ = 2.2x  
   - **Piece F**: Minimum 7; 7 = 0.7x, 8–10 = 1.1x, 11+ = 1.5x  
   - **Piece G**: Minimum 6; 6 = 1.0x, 7–9 = 1.4x, 10+ = 1.9x  
   - **Piece H**: Minimum 8; 8 = 0.9x, 9–11 = 1.3x, 12+ = 1.8x  

5. **Game Flow**:  
   - A round begins when the player sets a bet and taps “Refresh” (bet is deducted).  
   - Matches are resolved, pieces collapse, and new pieces fill automatically until no further matches occur.  
   - The round ends when no matches are possible. The player can start a new round if their bank has enough points.  
   - **Game Over**: If the bank is less than the selected bet, the game ends.  
   - **Win Condition**: Players continue playing (winning) as long as their bank is not empty, aiming to maximize their bank.

6. **Objective**:  
   - Grow the bank by earning payouts from matches while managing bets to sustain gameplay as long as possible.

**Example Round (6x5 grid)**:  
- Player sets a bet of 10 points (bank: 200 → 190).  
- Taps “Refresh,” filling the board with 30 pieces (e.g., 8 A’s, 7 B’s, 6 C’s, 9 others).  
- Matches: 
  - 8 A’s (1.4x → 10 * 1.4 = 14 points; bank: 190 + 14 = 204).  
  - 7 B’s (1.2x → 10 * 1.2 = 12 points; bank: 204 + 12 = 216).  
  - 6 C’s (no match, as minimum is 7).  
- A’s and B’s collapse, 15 new pieces fill automatically, and no new matches occur.  
- Round ends; player can adjust bet or tap “Refresh” again.