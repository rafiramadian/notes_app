import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/utils/app_colors.dart';

class AppTheme {
  static ThemeData getTheme(double textScaleFactor) {
    return ThemeData(
      primaryColor: AppColors.primaryColor, // Industrial accent color
      scaffoldBackgroundColor:
          AppColors.backgroundColor, // Industrial background color
      appBarTheme: AppBarTheme(
        color: AppColors.secondaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarTextStyle: TextTheme(
          titleLarge: GoogleFonts.poppins(
            color: AppColors.onPrimaryColor,
            fontSize: 20 / textScaleFactor,
            fontWeight: FontWeight.w600,
          ),
        ).bodyMedium,
        titleTextStyle: TextTheme(
          titleLarge: GoogleFonts.poppins(
            color: AppColors.onPrimaryColor,
            fontSize: 20 / textScaleFactor,
            fontWeight: FontWeight.w600,
          ),
        ).titleLarge,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
          fontSize: 96 / textScaleFactor,
          fontWeight: FontWeight.bold,
          letterSpacing: -1.5,
          color: const Color(0xFF212121),
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 60 / textScaleFactor,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
          color: const Color(0xFF212121),
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 48 / textScaleFactor,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF212121),
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 34 / textScaleFactor,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.25,
          color: const Color(0xFF212121),
        ),
        headlineSmall: GoogleFonts.poppins(
          fontSize: 24 / textScaleFactor,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF212121),
        ),
        titleLarge: GoogleFonts.poppins(
          fontSize: 20 / textScaleFactor,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.15,
          color: const Color(0xFF212121),
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 16 / textScaleFactor,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
          color: const Color(0xFF757575),
        ),
        titleSmall: GoogleFonts.poppins(
          fontSize: 14 / textScaleFactor,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
          color: const Color(0xFF757575),
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: 16 / textScaleFactor,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.5,
          color: const Color(0xFF212121),
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14 / textScaleFactor,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.25,
          color: const Color(0xFF212121),
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 12 / textScaleFactor,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.4,
          color: const Color(0xFF757575),
        ),
        labelLarge: GoogleFonts.poppins(
          fontSize: 14 / textScaleFactor,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.25,
          color: Colors.white,
        ),
        labelSmall: GoogleFonts.poppins(
          fontSize: 10 / textScaleFactor,
          fontWeight: FontWeight.normal,
          letterSpacing: 1.5,
          color: const Color(0xFF757575),
        ),
      ),
      colorScheme: const ColorScheme(
        primary: AppColors.primaryColor,
        secondary: AppColors.secondaryColor,
        surface: AppColors.surfaceColor,
        background: AppColors.backgroundColor,
        error: AppColors.errorColor,
        onPrimary: AppColors.onPrimaryColor,
        onSecondary: AppColors.onSecondaryColor,
        onSurface: AppColors.onSurfaceColor,
        onBackground: AppColors.onBackgroundColor,
        onError: AppColors.onErrorColor,
        brightness: Brightness.light,
      ),
    ).copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.onPrimaryColor,
          backgroundColor: AppColors.primaryColor,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.secondaryColor,
          side: const BorderSide(color: AppColors.secondaryColor),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.secondaryColor,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.primaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
