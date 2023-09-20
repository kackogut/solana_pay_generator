import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pay_gen/data/base/text_value.dart';
import 'package:sol_pay_gen/feature/input/bloc/parameters_input_state.dart';

import '../../../data/error/input_error.dart';
import '../../../validator/keys_validator.dart';
import '../../../validator/number_validator.dart';

class ParametersInputCubit extends Cubit<ParametersInputState> {
  final NumberValidator _numberValidator;
  final KeysValidator _keysValidator;

  ParametersInputCubit(
    this._numberValidator,
    this._keysValidator,
  ) : super(
          ParametersInputState(
            address: TextValue(),
            amount: TextValue(),
            reference: TextValue(),
            memo: null,
            message: null,
            label: null,
            splTokenAddress: null,
          ),
        );

  void onAddressChange(String address) {
    emit(state.copyWith(
      address: TextValue(
        text: address,
        error: _validateAddress(address),
      ),
    ));
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
    emit(state.copyWith(
      reference: TextValue(
        text: reference,
        error: reference.isEmpty ? null : _keysValidator.validateKey(reference),
      ),
    ));
  }

  void onSplTokenChange(String token) {
    emit(state.copyWith(splTokenAddress: token));
  }

  void onMemoChange(String memo) {
    emit(state.copyWith(memo: memo));
  }

  void onValidate() {
    emit(state.copyWith(
      address: state.address.copyWith(
        error: _validateAddress(state.address.text),
      ),
    ));
  }

  InputError? _validateAddress(String address) {
    return address.isEmpty
        ? FieldRequired()
        : _keysValidator.validateKey(address);
  }
}
