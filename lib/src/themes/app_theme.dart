import 'package:flutter/material.dart';
import 'package:ritenute_bonifici/src/themes/ritenute_colors.dart';
import 'package:ritenute_bonifici/src/themes/ritenute_text_sizes.dart';

ThemeData ritenuteTheme() => ThemeData(
      primaryColor: RitenuteColors.ritenutePrimaryColor,
      scaffoldBackgroundColor: RitenuteColors.ritenuteBackgroundColor,
      textTheme: TextTheme(
        headline1: const TextStyle(
          fontSize: RitenuteTextSizes.textBig,
          color: RitenuteColors.ritenuteTextColor,
        ),
        headline2: TextStyle(
          fontSize: RitenuteTextSizes.textMedium,
          color: RitenuteColors.ritenuteTextColor.withOpacity(0.4),
        ),
        headline3: const TextStyle(
          color: RitenuteColors.ritenuteWhiteColor,
          fontSize: RitenuteTextSizes.textMedium,
        ),
        headline4: const TextStyle(
          color: RitenuteColors.ritenutePrimaryColor,
          fontSize: RitenuteTextSizes.textSmall,
        ),
        headline5: TextStyle(
          color: RitenuteColors.ritenuteTextColor.withOpacity(0.4),
          fontSize: RitenuteTextSizes.textSmall,
        ),
      ),
    );
