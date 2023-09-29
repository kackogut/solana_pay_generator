import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sol_pay_gen/data/base/text_value.dart';
import 'package:sol_pay_gen/domain/token/token_data.dart';

import '../../token/model/selectable_token_display.dart';

part 'parameters_input_state.freezed.dart';

@freezed
class ParametersInputState with _$ParametersInputState {
  const ParametersInputState._();

  const factory ParametersInputState({
    required TextValue address,
    required TextValue amount,
    required TextValue reference,
    required String? label,
    required String? message,
    required String? memo,
    required TokenData? selectedToken,
    required List<SelectableTokenDisplay> selectableTokens,
  }) = _ParametersInputState;

  bool isValid() =>
      amount.isValid() && address.isValid() && reference.isValid();
}
