import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ritenute_bonifici/src/presentation/blocs/cubit/ritenuta_cubit.dart';
import 'package:ritenute_bonifici/src/presentation/widgets/settings/circle_icon_button.dart';
import 'package:ritenute_bonifici/src/themes/app_theme.dart';
import 'package:ritenute_bonifici/src/themes/ritenute_colors.dart';
import 'package:ritenute_bonifici/src/themes/ritenute_margins.dart';

class TaxEditView extends StatefulWidget {
  const TaxEditView({Key? key}) : super(key: key);

  @override
  State<TaxEditView> createState() => _TaxEditViewState();
}

class _TaxEditViewState extends State<TaxEditView> {
  @override
  void initState() {
    context.read<RitenutaCubit>().retrieveTaxes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: RitenuteColors.ritenuteTextColor,
        ),
        backgroundColor: RitenuteColors.ritenuteBackgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Impostazioni',
          style: ritenuteTheme().textTheme.headline1,
        ),
      ),
      body: BlocBuilder<RitenutaCubit, RitenutaState>(
        builder: (context, state) {
          return Column(
            children: [
              Text(
                'Aliquota IVA',
                style: ritenuteTheme().textTheme.headline5,
              ),
              const SizedBox(
                height: RitenuteMargins.ritenuteMarginBig,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleIconButton(
                    icon: Icons.remove,
                    onPressed: () {
                      context.read<RitenutaCubit>().setTax(false, true);
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: RitenuteColors.ritenuteSecondaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: RitenuteMargins.ritenuteMarginVeryBig,
                        vertical: RitenuteMargins.ritenuteMarginBig,
                      ),
                      child: Text(
                        "${state.taxRate}",
                        style: ritenuteTheme().textTheme.headline2,
                      ),
                    ),
                  ),
                  CircleIconButton(
                    icon: Icons.add,
                    onPressed: () {
                      context.read<RitenutaCubit>().setTax(true, true);
                    },
                  )
                ],
              ),
              const SizedBox(
                height: RitenuteMargins.ritenuteMarginVeryBig,
              ),
              Text(
                'Aliquota Ritenuta',
                style: ritenuteTheme().textTheme.headline5,
              ),
              const SizedBox(
                height: RitenuteMargins.ritenuteMarginBig,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleIconButton(
                    icon: Icons.remove,
                    onPressed: () {
                      context.read<RitenutaCubit>().setTax(false, false);
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: RitenuteColors.ritenuteSecondaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: RitenuteMargins.ritenuteMarginVeryBig,
                        vertical: RitenuteMargins.ritenuteMarginBig,
                      ),
                      child: Text(
                        "${state.withholdingRate}",
                        style: ritenuteTheme().textTheme.headline2,
                      ),
                    ),
                  ),
                  CircleIconButton(
                    icon: Icons.add,
                    onPressed: () {
                      context.read<RitenutaCubit>().setTax(true, false);
                    },
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
