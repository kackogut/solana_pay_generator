import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pay_gen/domain/generate_transfer_request_qr_use_case.dart';
import 'package:sol_pay_gen/feature/qr/bloc/qr_generator_cubit.dart';

import '../data/transfer/transfer_request_repository.dart';
import '../feature/input/bloc/parameters_input_cubit.dart';

MultiBlocProvider getBlocProviders({required StatelessWidget child}) {
  ParametersInputCubit parametersInputCubit = ParametersInputCubit();

  return MultiBlocProvider(
    providers: [
      BlocProvider<ParametersInputCubit>(
        create: (_) => parametersInputCubit,
      ),
      BlocProvider<QrGeneratorCubit>(
        create: (BuildContext context) => QrGeneratorCubit(
          generateTransferRequestQrUseCase: GenerateTransferRequestQrUseCase(
            context.read<TransferRequestRepository>(),
          ),
          parametersInputCubit: parametersInputCubit,
        ),
      )
    ],
    child: child,
  );
}
