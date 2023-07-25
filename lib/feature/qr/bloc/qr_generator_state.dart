import 'package:equatable/equatable.dart';

sealed class QrGeneratorState {}

final class Empty extends QrGeneratorState {}

final class QrCode extends QrGeneratorState {
  QrCode(this.data);

  final String data;
}
