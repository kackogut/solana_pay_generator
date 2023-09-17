import 'package:equatable/equatable.dart';

sealed class QrGeneratorState extends Equatable {}

final class Empty extends QrGeneratorState {

  @override
  List<Object?> get props => [];
}

final class QrCode extends QrGeneratorState {
  QrCode(this.data);

  final String data;

  @override
  List<Object?> get props => [data];
}
