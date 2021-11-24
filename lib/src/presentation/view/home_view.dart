import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ritenute_bonifici/src/presentation/blocs/cubit/ritenuta_cubit.dart';
import 'package:ritenute_bonifici/src/presentation/widgets/home/insert_import.dart';
import 'package:ritenute_bonifici/src/presentation/widgets/home/text_card.dart';
import 'package:ritenute_bonifici/src/themes/app_theme.dart';
import 'package:ritenute_bonifici/src/themes/ritenute_colors.dart';
import 'package:ritenute_bonifici/src/themes/ritenute_margins.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: RitenuteColors.ritenuteSecondaryColor,
        onPressed: () {},
        child: const Icon(
          Icons.list,
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: RitenuteColors.ritenuteSecondaryColor,
            ),
          )
        ],
        backgroundColor: RitenuteColors.ritenuteBackgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Ritenute Bonifici',
          style: ritenuteTheme().textTheme.headline1,
        ),
      ),
      body: BlocBuilder<RitenutaCubit, RitenutaState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextCard(
                    text: state.amount == 0
                        ? 'Importo Bonifico'
                        : state.amount.toStringAsFixed(2),
                  ),
                  TextCard(
                    text: state.creditedAmount == 0
                        ? 'Bonifico Accreditato'
                        : state.creditedAmount.toStringAsFixed(2),
                  ),
                  TextCard(
                    text: state.withholding == 0
                        ? 'Ritenuta'
                        : state.withholding.toStringAsFixed(2),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const InsertImport(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: RitenuteMargins.ritenuteMarginVeryBig,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            context.read<RitenutaCubit>().updateGrossNet();
                          },
                          child: Text(
                            'Netto',
                            style: state.isNet
                                ? ritenuteTheme().textTheme.headline4
                                : ritenuteTheme().textTheme.headline5,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<RitenutaCubit>().updateGrossNet();
                          },
                          child: Text(
                            'Lordo',
                            style: state.isNet
                                ? ritenuteTheme().textTheme.headline5
                                : ritenuteTheme().textTheme.headline4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: RitenuteMargins.ritenuteMarginVeryBig,
                      vertical: RitenuteMargins.ritenuteMarginMedium,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        primary: RitenuteColors.ritenutePrimaryColor,
                      ),
                      onPressed: () {
                        context.read<RitenutaCubit>().calculate();
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: RitenuteMargins.ritenuteMarginBig),
                            child: Text(
                              state.isNet
                                  ? "Calcola da Netto"
                                  : "Calcola da Lordo",
                              style: ritenuteTheme().textTheme.headline3,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
