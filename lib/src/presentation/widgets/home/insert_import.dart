import 'package:flutter/material.dart';
import 'package:ritenute_bonifici/src/themes/app_theme.dart';
import 'package:ritenute_bonifici/src/themes/ritenute_margins.dart';

class InsertImport extends StatefulWidget {
  const InsertImport({
    Key? key,
  }) : super(key: key);

  @override
  State<InsertImport> createState() => _InsertImportState();
}

class _InsertImportState extends State<InsertImport> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: RitenuteMargins.ritenuteMarginVeryBig,
        vertical: RitenuteMargins.ritenuteMarginMedium,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            RitenuteMargins.ritenuteMarginSmall,
          ),
          child: TextFormField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: IconButton(
                onPressed: () {
                  _controller.clear();
                },
                icon: const Icon(Icons.clear),
              ),
              hintText: "Inserisci importo",
              hintStyle: ritenuteTheme().textTheme.headline2,
            ),
          ),
        ),
      ),
    );
  }
}
