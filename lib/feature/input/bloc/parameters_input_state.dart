import 'package:equatable/equatable.dart';
import 'package:sol_pay_gen/data/base/text_value.dart';
import 'package:sol_pay_gen/domain/token/spl_token_data.dart';

import '../../token/model/selectable_token_display.dart';

class ParametersInputState extends Equatable {
  final TextValue address;
  final TextValue amount;
  final TextValue reference;
  final String? label;
  final String? message;
  final String? memo;
  final TokenData? selectedToken;
  final List<SelectableTokenDisplay> selectableTokens;

  const ParametersInputState({
    required this.address,
    required this.amount,
    required this.reference,
    required this.label,
    required this.message,
    required this.memo,
    required this.selectedToken,
    required this.selectableTokens,
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
    TokenData? selectedToken,
    List<SelectableTokenDisplay>? selectableTokens,
  }) =>
      ParametersInputState(
          address: address ?? this.address,
          amount: amount ?? this.amount,
          label: label ?? this.label,
          message: message ?? this.message,
          reference: reference ?? this.reference,
          memo: memo ?? this.memo,
          selectedToken: selectedToken ?? this.selectedToken,
          selectableTokens: selectableTokens ?? this.selectableTokens);

  bool isValid() =>
      amount.isValid() && address.isValid() && reference.isValid();
}
