import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ritenuta_state.dart';

class RitenutaCubit extends Cubit<RitenutaState> {
  RitenutaCubit() : super(const RitenutaInitial(0));
}
