import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pay_gen/data/solana_pay_request.dart';
import 'package:sol_pay_gen/domain/transfer/generate_transfer_request_qr_use_case.dart';
import 'package:sol_pay_gen/feature/input/bloc/parameters_input_state.dart';
import 'package:sol_pay_gen/feature/qr/bloc/qr_generator_state.dart';

import '../../input/bloc/parameters_input_cubit.dart';

class QrGeneratorCubit extends Cubit<QrGeneratorState> {
  QrGeneratorCubit({
    required generateTransferRequestQrUseCase,
    required parametersInputCubit,
  })  : _parametersInputCubit = parametersInputCubit,
        _generateTransferRequestQrUseCase = generateTransferRequestQrUseCase,
        super(Empty());

  final ParametersInputCubit _parametersInputCubit;
  final GenerateTransferRequestQrUseCase _generateTransferRequestQrUseCase;

  void onGenerate() async {
    ParametersInputState inputState = _parametersInputCubit.state;

    if (inputState.isValid()) {
      SolanaPayRequest request = SolanaPayRequest(
        address: inputState.address.text,
        label: inputState.label,
        message: inputState.message,
        amount: inputState.amount.text,
        reference: inputState.reference.text,
        memo: inputState.memo,
        token: inputState.selectedToken?.address,
      );

      String qrCode = _generateTransferRequestQrUseCase.execute(request);

      emit(QrCode(qrCode));
    }
  }
}
