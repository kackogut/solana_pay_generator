import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_generator_state.freezed.dart';

@freezed
sealed class QrGeneratorState with _$QrGeneratorState {
  factory QrGeneratorState.empty() = Empty;

  factory QrGeneratorState.qrCode(String data) = QrCode;
}
