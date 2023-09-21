import 'package:equatable/equatable.dart';
import 'package:sol_pay_gen/data/base/text_value.dart';
import 'package:sol_pay_gen/domain/token/spl_token_data.dart';

class ParametersInputState extends Equatable {
  final TextValue address;
  final TextValue amount;
  final TextValue reference;
  final String? label;
  final String? message;
  final String? memo;
  final SplTokenData? selectedToken;

  const ParametersInputState({
    required this.address,
    required this.amount,
    required this.reference,
    required this.label,
    required this.message,
    required this.memo,
    required this.selectedToken,
  });

  @override
  List<Object?> get props => [
        address,
        amount,
        reference,
        label,
        message,
        memo,
        selectedToken,
      ];

  ParametersInputState copyWith({
    TextValue? address,
    TextValue? amount,
    String? label,
    String? message,
    TextValue? reference,
    String? memo,
    SplTokenData? tokenSymbol,
  }) =>
      ParametersInputState(
        address: address ?? this.address,
        amount: amount ?? this.amount,
        label: label ?? this.label,
        message: message ?? this.message,
        reference: reference ?? this.reference,
        memo: memo ?? this.memo,
        selectedToken: tokenSymbol ?? this.selectedToken,
      );

  bool isValid() =>
      amount.isValid() && address.isValid() && reference.isValid();
}
