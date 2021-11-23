part of 'ritenuta_cubit.dart';

@immutable
class RitenutaState {
  final double amount;
  final double creditedAmount;
  final bool isNet;

  const RitenutaState({
    this.amount = 0,
    this.creditedAmount = 0,
    this.isNet = true,
  });

  RitenutaState copyWith({
    double? amount,
    double? creditedAmount,
    bool? isNet,
  }) {
    return RitenutaState(
      amount: amount ?? this.amount,
      creditedAmount: creditedAmount ?? this.creditedAmount,
      isNet: isNet ?? this.isNet,
    );
  }
}
