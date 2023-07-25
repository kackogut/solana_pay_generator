import 'package:equatable/equatable.dart';

class ParametersInputState extends Equatable {
  final String address;
  final String? amount;
  final String? reference;
  final String? memo;

  const ParametersInputState({
    required this.address,
    required this.amount,
    required this.reference,
    required this.memo,
  });

  @override
  List<Object?> get props => [address, amount];

  ParametersInputState copyWith({
    String? address,
    String? amount,
    String? reference,
    String? memo,
  }) =>
      ParametersInputState(
        address: address ?? this.address,
        amount: amount ?? this.amount,
        reference: reference ?? this.reference,
        memo: memo ?? this.memo,
      );
}
