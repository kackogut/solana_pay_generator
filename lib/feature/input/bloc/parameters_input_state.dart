import 'package:equatable/equatable.dart';

class ParametersInputState extends Equatable {
  final String address;
  final String? amount;
  final String? reference;
  final String? label;
  final String? message;
  final String? memo;
  final String? splTokenAddress;

  const ParametersInputState({
    required this.address,
    required this.amount,
    required this.reference,
    required this.label,
    required this.message,
    required this.memo,
    required this.splTokenAddress
  });

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
    String? address,
    String? amount,
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
}
