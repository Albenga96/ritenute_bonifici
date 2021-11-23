import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ritenuta_state.dart';

class RitenutaCubit extends Cubit<RitenutaState> {
  RitenutaCubit() : super(const RitenutaState());

  void updateGrossNet() {
    bool isNet = state.isNet;
    emit(const RitenutaState().copyWith(isNet: !isNet));
  }

  void updateImport(double amount) {
    emit(const RitenutaState().copyWith(amount: amount));
  }

  void calculate() {
    emit(const RitenutaState()
        .copyWith(creditedAmount: state.amount + 10, amount: state.amount));
  }
}
