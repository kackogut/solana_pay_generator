import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pay_gen/domain/token/get_spl_tokens_use_case.dart';
import 'package:sol_pay_gen/domain/transfer/generate_transfer_request_qr_use_case.dart';
import 'package:sol_pay_gen/feature/qr/bloc/qr_generator_cubit.dart';
import 'package:sol_pay_gen/feature/token/bloc/tokens_cubit.dart';
import 'package:sol_pay_gen/validator/keys_validator.dart';
import 'package:sol_pay_gen/validator/number_validator.dart';

import '../data/transfer/transfer_request_repository.dart';
import '../feature/input/bloc/parameters_input_cubit.dart';

MultiBlocProvider getBlocProviders({required StatelessWidget child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<TokensCubit>(
        create: (BuildContext context) =>
            TokensCubit(getTokensUseCase: context.read<GetTokensUseCase>()),
      ),
      BlocProvider<ParametersInputCubit>(
        create: (BuildContext context) => ParametersInputCubit(
          context.read<NumberValidator>(),
          context.read<KeysValidator>(),
          context.read<TokensCubit>(),
        ),
      ),
      BlocProvider<QrGeneratorCubit>(
        create: (BuildContext context) => QrGeneratorCubit(
          generateTransferRequestQrUseCase: GenerateTransferRequestQrUseCase(
            context.read<TransferRequestRepository>(),
          ),
          parametersInputCubit: context.read<ParametersInputCubit>(),
        ),
      ),
    ],
    child: child,
  );
}
