import 'package:equatable/equatable.dart';

class ParametersInputState extends Equatable {
  final String address;

  const ParametersInputState({required this.address});

  @override
  List<Object?> get props => [address];

  ParametersInputState copyWith({String? address}) =>
      ParametersInputState(address: address ?? this.address);
}
