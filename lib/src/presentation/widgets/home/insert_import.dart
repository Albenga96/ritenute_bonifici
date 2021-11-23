import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ritenute_bonifici/src/presentation/blocs/cubit/ritenuta_cubit.dart';
import 'package:ritenute_bonifici/src/ritenute_app.dart';
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
    return BlocBuilder<RitenutaCubit, RitenutaState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: RitenuteMargins.ritenuteMarginVeryBig,
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
                onChanged: (value) {
                  context
                      .read<RitenutaCubit>()
                      .updateImport(double.parse(value));
                },
                controller: _controller,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
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
      },
    );
  }
}
