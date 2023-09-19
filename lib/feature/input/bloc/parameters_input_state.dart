import 'package:equatable/equatable.dart';
import 'package:sol_pay_gen/data/base/text_value.dart';
import 'package:sol_pay_gen/data/error/input_error.dart';

class ParametersInputState extends Equatable {
  final TextValue address;
  final TextValue amount;
  final String? reference;
  final String? label;
  final String? message;
  final String? memo;
  final String? splTokenAddress;

  const ParametersInputState(
      {required this.address,
      required this.amount,
      required this.reference,
      required this.label,
      required this.message,
      required this.memo,
      required this.splTokenAddress});

  @override
  List<Object?> get props => [
        address,
        amount,
        reference,
        label,
        message,
        memo,
        splTokenAddress,
      ];

  ParametersInputState copyWith({
    TextValue? address,
    TextValue? amount,
    String? label,
    String? message,
    String? reference,
    String? memo,
    String? splTokenAddress,
  }) =>
      ParametersInputState(
        address: address ?? this.address,
        amount: amount ?? this.amount,
        label: label ?? this.label,
        message: message ?? this.message,
        reference: reference ?? this.reference,
        memo: memo ?? this.memo,
        splTokenAddress: splTokenAddress ?? this.splTokenAddress,
      );

  ParametersInputState validate() {
    return copyWith(
      address: address.copyWith(
        error: address.text.isEmpty ? RequiredAmount() : null,
      ),
    );
  }

  bool isValid() => amount.isValid() && address.isValid();
}
