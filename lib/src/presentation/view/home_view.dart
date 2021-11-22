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
      floatingActionButton: FloatingActionButton(
        backgroundColor: RitenuteColors.ritenuteSecondaryColor,
        onPressed: () {},
        child: Icon(
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          Spacer(),
          Column(
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
                      onPressed: () {},
                      child: Text(
                        'Netto',
                        style: ritenuteTheme().textTheme.headline5,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Lordo',
                        style: ritenuteTheme().textTheme.headline5,
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
                  onPressed: () {},
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: RitenuteMargins.ritenuteMarginBig),
                        child: Text(
                          "Calcola",
                          style: ritenuteTheme().textTheme.headline3,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
        ],
      ),
    );
  }
}
