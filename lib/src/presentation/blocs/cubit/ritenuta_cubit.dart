import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ritenuta_state.dart';

class RitenutaCubit extends Cubit<RitenutaState> {
  RitenutaCubit() : super(const RitenutaState());

  void updateGrossNet() {
    bool isNet = state.isNet;
    emit(const RitenutaState().copyWith(isNet: !isNet));
  }
}
