import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pay_gen/domain/generate_transfer_request_qr_use_case.dart';
import 'package:sol_pay_gen/feature/qr/bloc/qr_generator_cubit.dart';
import 'package:sol_pay_gen/validator/number_validator.dart';

import '../data/transfer/transfer_request_repository.dart';
import '../feature/input/bloc/parameters_input_cubit.dart';

MultiBlocProvider getBlocProviders({required StatelessWidget child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<ParametersInputCubit>(
        create: (BuildContext context) =>
            ParametersInputCubit(context.read<NumberValidator>()),
      ),
      BlocProvider<QrGeneratorCubit>(
        create: (BuildContext context) => QrGeneratorCubit(
          generateTransferRequestQrUseCase: GenerateTransferRequestQrUseCase(
            context.read<TransferRequestRepository>(),
          ),
          parametersInputCubit: context.read<ParametersInputCubit>(),
        ),
      )
    ],
    child: child,
  );
}
