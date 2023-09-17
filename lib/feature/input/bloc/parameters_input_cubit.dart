import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pay_gen/data/token/spl_tokens.dart';
import 'package:sol_pay_gen/feature/input/bloc/parameters_input_state.dart';

class ParametersInputCubit extends Cubit<ParametersInputState> {
  ParametersInputCubit()
      : super(
    const ParametersInputState(
      address: "",
      amount: null,
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
    emit(state.copyWith(amount: amount));
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
