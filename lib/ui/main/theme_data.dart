import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // For custom fonts

ThemeData candiesThemeData() {
  return ThemeData(
    // Primary color scheme
    primaryColor: const Color(0xFFFF8A65), // Warm orange for main UI elements
    primaryColorLight: const Color(0xFFFFB3A7), // Light coral for highlights
    primaryColorDark: const Color(0xFFD75A4A), // Darker orange for depth
    scaffoldBackgroundColor: const Color(0xFFFFF3E0), // Creamy off-white background
    // highlightColor:  const Color(0xFF80DEEA),

    // Accent color (secondary)
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.orange,
      accentColor: const Color(0xFF80DEEA), // Mint green for buttons and accents
      backgroundColor: const Color(0xFFFFF3E0),
      cardColor: const Color(0xFFFCE4EC), // Soft pink for cards/tiles
      errorColor: const Color(0xFFE53935), // Red for errors
      brightness: Brightness.light,
    ),

    // Typography
    textTheme: TextTheme(
      displayLarge: GoogleFonts.bubblegumSans(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: const Color(0xFFD75A4A), // Dark orange for headings
      ),
      displayMedium: GoogleFonts.bubblegumSans(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: const Color(0xFFD75A4A),
      ),
      bodyLarge: GoogleFonts.bubblegumSans(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: const Color(0xFF4A4A4A), // Dark gray for body text
      ),
      bodyMedium: GoogleFonts.bubblegumSans(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: const Color(0xFF4A4A4A),
      ),
      labelLarge: GoogleFonts.bubblegumSans(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: const Color(0xFFFFFFFF), // White for button text
      ),
    ),

    // Button styling
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color(0xFFFFFFFF), // White text/icon on buttons
        backgroundColor: const Color(0xFF80DEEA), // Mint green button background
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded, candy-like buttons
        ),
        elevation: 5, // Slight shadow for depth
        textStyle: GoogleFonts.bubblegumSans(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    // AppBar styling
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFF8A65), // Orange app bar
      foregroundColor: Color(0xFFFFFFFF), // White icons/text
      elevation: 2,
      titleTextStyle: TextStyle(
        fontFamily: 'BubblegumSans',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),

    // Card styling (e.g., for level selection tiles)
    cardTheme: CardTheme(
      color: const Color(0xFFFCE4EC), // Soft pink for cards
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(8),
    ),

    // Icon styling
    iconTheme: const IconThemeData(
      color: Color(0xFFD75A4A), // Dark orange for icons
      size: 24,
    ),

    // Divider styling (e.g., for separating UI sections)
    dividerTheme: const DividerThemeData(
      color: Color(0xFF80DEEA), // Mint green dividers
      thickness: 2,
      space: 10,
    ),

    // Progress indicator (e.g., for loading or progress bars)
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xFFFFB3A7), // Light coral for progress bars
      linearTrackColor: Color(0xFFE0E0E0), // Light gray track
    ),

    // Visual density (for touch-friendly spacing)
    visualDensity: VisualDensity.adaptivePlatformDensity,

    // Font family (applied globally)
    fontFamily: 'BubblegumSans',
  );
}