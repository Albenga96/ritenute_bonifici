import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ritenute_bonifici/src/themes/ritenute_colors.dart';
import 'package:ritenute_bonifici/src/themes/ritenute_text_sizes.dart';

ThemeData ritenuteTheme() => ThemeData(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      primaryColor: RitenuteColors.ritenutePrimaryColor,
      scaffoldBackgroundColor: RitenuteColors.ritenuteBackgroundColor,
      textTheme: TextTheme(
        headline1: const TextStyle(
          fontSize: RitenuteTextSizes.textBig,
          color: RitenuteColors.ritenuteTextColor,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: RitenuteTextSizes.textMedium,
          color: RitenuteColors.ritenuteTextColor.withOpacity(0.4),
        ),
        headline3: const TextStyle(
          fontWeight: FontWeight.bold,
          color: RitenuteColors.ritenuteWhiteColor,
          fontSize: RitenuteTextSizes.textMedium,
        ),
        headline4: const TextStyle(
          fontWeight: FontWeight.bold,
          color: RitenuteColors.ritenutePrimaryColor,
          fontSize: RitenuteTextSizes.textSmall,
        ),
        headline5: TextStyle(
          fontWeight: FontWeight.bold,
          color: RitenuteColors.ritenuteTextColor.withOpacity(0.4),
          fontSize: RitenuteTextSizes.textSmall,
        ),
      ),
    );
