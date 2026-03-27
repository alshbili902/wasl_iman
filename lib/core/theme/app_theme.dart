import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasl_iman/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.emerald,
        brightness: Brightness.light,
        primary: AppColors.emerald,
        secondary: AppColors.gold,
        surface: Colors.white,
      ),
    );

    final textTheme = GoogleFonts.cairoTextTheme(base.textTheme).copyWith(
      displaySmall: GoogleFonts.cairo(fontSize: 32, fontWeight: FontWeight.w700, color: AppColors.slate),
      headlineSmall: GoogleFonts.cairo(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.slate),
      titleMedium: GoogleFonts.cairo(fontSize: 17, fontWeight: FontWeight.w600),
      bodyMedium: GoogleFonts.cairo(fontSize: 15, height: 1.5),
      labelLarge: GoogleFonts.cairo(fontSize: 14, fontWeight: FontWeight.w700),
    );

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.ivory,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.slate,
        elevation: 0,
        titleTextStyle: textTheme.titleMedium,
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 6,
        shadowColor: AppColors.emerald.withValues(alpha: 0.12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.emerald,
        brightness: Brightness.dark,
        primary: AppColors.mint,
        secondary: AppColors.gold,
        surface: AppColors.cardDark,
      ),
    );
    return base.copyWith(
      textTheme: GoogleFonts.cairoTextTheme(base.textTheme),
      scaffoldBackgroundColor: const Color(0xFF081518),
      cardTheme: CardThemeData(
        color: AppColors.cardDark,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
