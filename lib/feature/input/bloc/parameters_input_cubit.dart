import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pay_gen/data/base/text_value.dart';
import 'package:sol_pay_gen/feature/input/bloc/parameters_input_state.dart';

import '../../../validator/number_validator.dart';

class ParametersInputCubit extends Cubit<ParametersInputState> {
  final NumberValidator _numberValidator;

  ParametersInputCubit(
    this._numberValidator,
  ) : super(
          ParametersInputState(
            address: "",
            amount: TextValue(text: ""),
            reference: null,
            memo: null,
            message: null,
            label: null,
            splTokenAddress: null,
          ),
        );

  void onAddressChange(String address) {
    emit(state.copyWith(address: address));
  }

  void onAmountChange(String amount) {
    emit(state.copyWith(
      amount: TextValue(
        text: amount,
        error: amount.isEmpty ? null : _numberValidator.validateAmount(amount),
      ),
    ));
  }

  void onLabelChange(String label) {
    emit(state.copyWith(label: label));
  }

  void onMessageChange(String message) {
    emit(state.copyWith(message: message));
  }

  void onReferenceChange(String reference) {
    emit(state.copyWith(reference: reference));
  }

  void onSplTokenChange(String token) {
    emit(state.copyWith(splTokenAddress: token));
  }

  void onMemoChange(String memo) {
    emit(state.copyWith(memo: memo));
  }
}
