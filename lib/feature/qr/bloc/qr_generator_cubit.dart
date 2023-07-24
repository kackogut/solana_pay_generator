import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pay_gen/feature/input/bloc/parameters_input_state.dart';
import 'package:sol_pay_gen/feature/qr/bloc/qr_generator_state.dart';

class ParametersInputCubit extends Cubit<QrGeneratorState> {

  ParametersInputCubit() : super(Empty());

  void onGenerate() {

  }
}
