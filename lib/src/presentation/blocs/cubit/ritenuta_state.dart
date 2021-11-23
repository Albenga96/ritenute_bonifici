part of 'ritenuta_cubit.dart';

@immutable
abstract class RitenutaState {
  final double amount;
  final double creditedAmount;
  final bool isNet;

  const RitenutaState(this.amount, this.creditedAmount, this.isNet);
}

class RitenutaInitial extends RitenutaState {
  const RitenutaInitial(double amount) : super(0, 0, true);
}
