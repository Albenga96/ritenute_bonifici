import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          Column(
            children: const [
              TextCard(
                text: 'Importo Bonifico',
              ),
              TextCard(
                text: 'Importo Accreditato',
              ),
              TextCard(
                text: 'Ritenuta',
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              InsertImport(),
            ],
          )
        ],
      ),
    );
  }
}
