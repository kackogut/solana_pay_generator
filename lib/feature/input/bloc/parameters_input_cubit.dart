import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pay_gen/feature/input/bloc/parameters_input_state.dart';

class ParametersInputCubit extends Cubit<ParametersInputState> {

  ParametersInputCubit() : super(const ParametersInputState(address: ""));

  void onAddressChange(String address) {
    emit(state.copyWith(address: address));
  }
}
