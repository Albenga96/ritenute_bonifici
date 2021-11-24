part of 'ritenuta_cubit.dart';

@immutable
class RitenutaState {
  final double amount;
  final double creditedAmount;
  final double withholding;
  final double taxRate;
  final double withholdingRate;
  final bool isNet;

  const RitenutaState({
    this.amount = 0,
    this.creditedAmount = 0,
    this.withholding = 0,
    this.taxRate = 22,
    this.withholdingRate = 8,
    this.isNet = true,
  });

  RitenutaState copyWith({
    double? amount,
    double? creditedAmount,
    double? withholding,
    double? taxRate,
    double? withholdingRate,
    bool? isNet,
  }) {
    return RitenutaState(
      amount: amount ?? this.amount,
      creditedAmount: creditedAmount ?? this.creditedAmount,
      withholding: withholding ?? this.withholding,
      taxRate: taxRate ?? this.taxRate,
      withholdingRate: withholdingRate ?? this.withholdingRate,
      isNet: isNet ?? this.isNet,
    );
  }
}
