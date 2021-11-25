import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

part 'ritenuta_state.dart';

class RitenutaCubit extends Cubit<RitenutaState> {
  RitenutaCubit() : super(const RitenutaState());

  void updateGrossNet() {
    bool isNet = state.isNet;
    emit(
      const RitenutaState().copyWith(
        isNet: !isNet,
        amount: state.creditedAmount,
        creditedAmount: state.amount,
      ),
    );
  }

  void updateImport(double amount) {
    emit(
      const RitenutaState().copyWith(
        amount: !state.isNet ? amount : state.amount,
        isNet: state.isNet,
        creditedAmount: state.isNet ? amount : state.creditedAmount,
      ),
    );
  }

  void calculate() {
    double prop = (1 + (state.taxRate / 100) - (state.withholdingRate / 100)) /
        (1 + (state.taxRate / 100));
    emit(
      const RitenutaState().copyWith(
          creditedAmount:
              state.isNet ? state.creditedAmount : state.amount * prop,
          amount: !state.isNet ? state.amount : state.creditedAmount / prop,
          isNet: state.isNet,
          withholding: state.isNet
              ? state.creditedAmount * (1 / prop - 1)
              : state.amount * (1 / prop - 1)),
    );
  }

  void clear() {
    emit(
      const RitenutaState(),
    );
  }

  void setTax(bool up, bool isTax) async {
    isTax
        ? up
            ? emit(
                const RitenutaState().copyWith(
                  withholdingRate: state.withholdingRate,
                  taxRate:
                      double.parse((state.taxRate + 0.1).toStringAsFixed(2)),
                ),
              )
            : emit(
                const RitenutaState().copyWith(
                  withholdingRate: state.withholdingRate,
                  taxRate: double.parse((state.taxRate > 0.1
                          ? state.taxRate - 0.1
                          : state.taxRate)
                      .toStringAsFixed(2)),
                ),
              )
        : up
            ? emit(
                const RitenutaState().copyWith(
                  taxRate: state.taxRate,
                  withholdingRate: double.parse(
                      (state.withholdingRate + 0.1).toStringAsFixed(2)),
                ),
              )
            : emit(
                const RitenutaState().copyWith(
                  taxRate: state.taxRate,
                  withholdingRate: double.parse((state.withholdingRate > 0.1
                          ? state.withholdingRate - 0.1
                          : state.withholdingRate)
                      .toStringAsFixed(2)),
                ),
              );
    await insertTaxes();
  }

  Future<Database> get _database async {
    return openDatabase(
      join(
        await getDatabasesPath(),
        "taxes_database",
      ),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE taxes(taxRate TEXT, withholdingRate TEXT)',
        );
      },
      version: 1,
    );
  }

  @override
  Future<void> insertTaxes() async {
    final db = await _database;
    await db.insert(
      "taxes",
      {'taxRate': state.taxRate, 'withholdingRate': state.withholdingRate},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  void retrieveTaxes() async {
    final db = await _database;
    final List<Map<String, dynamic>> maps = await db.query("taxes");
    maps.forEach((element) {
      emit(const RitenutaState().copyWith(
          taxRate: double.parse(element['taxRate']),
          withholdingRate: double.parse(element['withholdingRate'])));
    });
  }
}
