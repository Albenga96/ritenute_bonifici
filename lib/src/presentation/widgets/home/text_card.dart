import 'package:flutter/material.dart';
import 'package:ritenute_bonifici/src/themes/app_theme.dart';
import 'package:ritenute_bonifici/src/themes/ritenute_colors.dart';
import 'package:ritenute_bonifici/src/themes/ritenute_margins.dart';

class TextCard extends StatelessWidget {
  const TextCard({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: RitenuteMargins.ritenuteMarginVeryBig,
        vertical: RitenuteMargins.ritenuteMarginMedium,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          color: RitenuteColors.ritenuteSecondaryColor,
          elevation: RitenuteMargins.ritenuteMarginSmall,
          child: Padding(
            padding: const EdgeInsets.all(
              RitenuteMargins.ritenuteMarginBig,
            ),
            child: Text(
              text,
              style: ritenuteTheme().textTheme.headline2,
            ),
          ),
        ),
      ),
    );
  }
}
