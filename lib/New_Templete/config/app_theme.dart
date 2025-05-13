import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Primary Palette (as per guidelines)
  static const Color darkNavyBlue = Color(0xFF24292F); // Primary
  static const Color teal = Color(0xFF26A69A); // Secondary
  static const Color brightOrange = Color(0xFFFF6B6B); // Accent

  // Light Theme Semantic Colors (derived from CSS vars)
  static const Color lightBackground = Color(0xFFFFFFFF); // White
  static const Color lightForeground = darkNavyBlue; // Dark Navy Blue
  static const Color lightCard =
      Color(0xFFF0F2F5); // Light Cool Grey (approximation)
  static const Color lightPrimary = darkNavyBlue;
  static const Color lightOnPrimary = Color(0xFFF9FAFB); // White/Light Grey
  static const Color lightSecondary = teal;
  static const Color lightOnSecondary = Color(0xFFF9FAFB); // White/Light Grey
  static const Color lightAccent = brightOrange;
  static const Color lightOnAccent = darkNavyBlue;
  static const Color lightMuted = Color(0xFFE5E7EB); // Light Grey
  static const Color lightMutedForeground = Color(0xFF6B7280); // Mid Grey
  static const Color lightBorder = Color(0xFFD1D5DB); // Light Grey Border

  // Dark Theme Semantic Colors (derived from CSS vars)
  static const Color darkBackground = darkNavyBlue;
  static const Color darkForeground = Color(0xFFF9FAFB); // White/Light Grey
  static const Color darkCard = Color(0xFF323840); // Slightly Lighter Dark Navy
  static const Color darkPrimary = brightOrange; // Bright Orange for CTAs
  static const Color darkOnPrimary = darkNavyBlue;
  static const Color darkSecondary = teal;
  static const Color darkOnSecondary = Color(0xFFF9FAFB);
  static const Color darkAccent =
      Color(0xFF34D399); // Slightly brighter Teal (approximation)
  static const Color darkOnAccent = Color(0xFFF9FAFB);
  static const Color darkMuted = Color(0xFF4A5567);
  static const Color darkMutedForeground = Color(0xFFA0AEC0);
  static const Color darkBorder = Color(0xFF3E444C);
}

class AppTheme {
  static ThemeData get lightTheme {
    final textTheme = GoogleFonts.manropeTextTheme(ThemeData.light().textTheme);
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.lightPrimary,
      scaffoldBackgroundColor: AppColors.lightBackground,
      colorScheme: const ColorScheme.light(
        primary: AppColors.lightPrimary,
        onPrimary: AppColors.lightOnPrimary,
        secondary: AppColors.lightSecondary,
        onSecondary: AppColors.lightOnSecondary,
        background: AppColors.lightBackground,
        onBackground: AppColors.lightForeground,
        surface: AppColors.lightCard, // Used for Card background
        onSurface: AppColors.lightForeground, // Text on Card
        error: Colors.redAccent,
        onError: Colors.white,
        brightness: Brightness.light,
        // Use tertiary for accent color as per Material 3 guidelines
        tertiary: AppColors.lightAccent,
        onTertiary: AppColors.lightOnAccent,
      ),
      textTheme: textTheme.copyWith(
        displayLarge:
            textTheme.displayLarge?.copyWith(color: AppColors.lightForeground),
        displayMedium:
            textTheme.displayMedium?.copyWith(color: AppColors.lightForeground),
        displaySmall:
            textTheme.displaySmall?.copyWith(color: AppColors.lightForeground),
        headlineLarge:
            textTheme.headlineLarge?.copyWith(color: AppColors.lightForeground),
        headlineMedium: textTheme.headlineMedium
            ?.copyWith(color: AppColors.lightForeground),
        headlineSmall:
            textTheme.headlineSmall?.copyWith(color: AppColors.lightForeground),
        titleLarge: textTheme.titleLarge?.copyWith(
            color: AppColors.lightForeground, fontWeight: FontWeight.bold),
        titleMedium:
            textTheme.titleMedium?.copyWith(color: AppColors.lightForeground),
        titleSmall:
            textTheme.titleSmall?.copyWith(color: AppColors.lightForeground),
        bodyLarge:
            textTheme.bodyLarge?.copyWith(color: AppColors.lightForeground),
        bodyMedium: textTheme.bodyMedium?.copyWith(
            color: AppColors.lightMutedForeground), // For secondary text
        bodySmall: textTheme.bodySmall
            ?.copyWith(color: AppColors.lightMutedForeground),
        labelLarge: textTheme.labelLarge
            ?.copyWith(color: AppColors.lightOnPrimary), // For button text
        labelMedium:
            textTheme.labelMedium?.copyWith(color: AppColors.lightForeground),
        labelSmall:
            textTheme.labelSmall?.copyWith(color: AppColors.lightForeground),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightBackground,
        foregroundColor: AppColors.lightForeground,
        elevation: 0,
        titleTextStyle: textTheme.titleLarge,
        iconTheme: const IconThemeData(color: AppColors.lightPrimary),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        buttonColor: AppColors.lightAccent, // CTA buttons
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightAccent,
          foregroundColor: AppColors.lightOnAccent,
          textStyle: textTheme.labelLarge,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.lightPrimary,
          side: const BorderSide(color: AppColors.lightBorder),
          textStyle: textTheme.labelLarge,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.lightBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide:
              const BorderSide(color: AppColors.lightAccent, width: 2.0),
        ),
        labelStyle: textTheme.bodyMedium
            ?.copyWith(color: AppColors.lightMutedForeground),
        hintStyle: textTheme.bodyMedium
            ?.copyWith(color: AppColors.lightMutedForeground),
      ),
      cardTheme: CardTheme(
        elevation: 2.0,
        margin: const EdgeInsets.all(8.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        color: AppColors.lightCard,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.lightBorder,
        thickness: 1,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.lightPrimary,
        linearTrackColor: AppColors.lightMuted,
      ),
    );
  }

  static ThemeData get darkTheme {
    final textTheme = GoogleFonts.manropeTextTheme(ThemeData.dark().textTheme);
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.darkPrimary,
      scaffoldBackgroundColor: AppColors.darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkPrimary,
        onPrimary: AppColors.darkOnPrimary,
        secondary: AppColors.darkSecondary,
        onSecondary: AppColors.darkOnSecondary,
        background: AppColors.darkBackground,
        onBackground: AppColors.darkForeground,
        surface: AppColors.darkCard,
        onSurface: AppColors.darkForeground,
        error: Colors.red,
        onError: Colors.black,
        brightness: Brightness.dark,
        tertiary: AppColors.darkAccent,
        onTertiary: AppColors.darkOnAccent,
      ),
      textTheme: textTheme.copyWith(
        displayLarge:
            textTheme.displayLarge?.copyWith(color: AppColors.darkForeground),
        displayMedium:
            textTheme.displayMedium?.copyWith(color: AppColors.darkForeground),
        displaySmall:
            textTheme.displaySmall?.copyWith(color: AppColors.darkForeground),
        headlineLarge:
            textTheme.headlineLarge?.copyWith(color: AppColors.darkForeground),
        headlineMedium:
            textTheme.headlineMedium?.copyWith(color: AppColors.darkForeground),
        headlineSmall:
            textTheme.headlineSmall?.copyWith(color: AppColors.darkForeground),
        titleLarge: textTheme.titleLarge?.copyWith(
            color: AppColors.darkForeground, fontWeight: FontWeight.bold),
        titleMedium:
            textTheme.titleMedium?.copyWith(color: AppColors.darkForeground),
        titleSmall:
            textTheme.titleSmall?.copyWith(color: AppColors.darkForeground),
        bodyLarge:
            textTheme.bodyLarge?.copyWith(color: AppColors.darkForeground),
        bodyMedium: textTheme.bodyMedium
            ?.copyWith(color: AppColors.darkMutedForeground),
        bodySmall:
            textTheme.bodySmall?.copyWith(color: AppColors.darkMutedForeground),
        labelLarge:
            textTheme.labelLarge?.copyWith(color: AppColors.darkOnPrimary),
        labelMedium:
            textTheme.labelMedium?.copyWith(color: AppColors.darkForeground),
        labelSmall:
            textTheme.labelSmall?.copyWith(color: AppColors.darkForeground),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.darkForeground,
        elevation: 0,
        titleTextStyle: textTheme.titleLarge,
        iconTheme: const IconThemeData(color: AppColors.darkPrimary),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        buttonColor: AppColors.darkAccent,
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkAccent,
          foregroundColor: AppColors.darkOnAccent,
          textStyle: textTheme.labelLarge,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.darkPrimary,
          side: const BorderSide(color: AppColors.darkBorder),
          textStyle: textTheme.labelLarge,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.darkBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.darkAccent, width: 2.0),
        ),
        labelStyle: textTheme.bodyMedium
            ?.copyWith(color: AppColors.darkMutedForeground),
        hintStyle: textTheme.bodyMedium
            ?.copyWith(color: AppColors.darkMutedForeground),
      ),
      cardTheme: CardTheme(
        elevation: 2.0,
        margin: const EdgeInsets.all(8.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        color: AppColors.darkCard,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.darkBorder,
        thickness: 1,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.darkPrimary,
        linearTrackColor: AppColors.darkMuted,
      ),
    );
  }
}
