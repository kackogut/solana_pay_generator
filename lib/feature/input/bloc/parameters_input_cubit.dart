import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pay_gen/feature/input/bloc/parameters_input_state.dart';

class ParametersInputCubit extends Cubit<ParametersInputState> {
  ParametersInputCubit()
      : super(
          const ParametersInputState(
            address: "",
            amount: null,
            reference: null,
            memo: null,
          ),
        );

  void onAddressChange(String address) {
    emit(state.copyWith(address: address));
  }

  void onAmountChange(String amount) {
    emit(state.copyWith(amount: amount));
  }

  void onReferenceChange(String reference) {
    emit(state.copyWith(reference: reference));
  }
}
