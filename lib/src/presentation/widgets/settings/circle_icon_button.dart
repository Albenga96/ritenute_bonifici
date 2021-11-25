import 'package:flutter/material.dart';
import 'package:ritenute_bonifici/src/themes/ritenute_colors.dart';
import 'package:ritenute_bonifici/src/themes/ritenute_margins.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        primary: RitenuteColors.ritenuteSecondaryColor,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(RitenuteMargins.ritenuteMarginMedium),
        child: Icon(
          icon,
          color: RitenuteColors.ritenuteTextColor,
        ),
      ),
    );
  }
}
