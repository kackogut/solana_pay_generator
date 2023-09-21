import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pay_gen/data/token/tokens_repository.dart';
import 'package:sol_pay_gen/data/transfer/transfer_request_repository.dart';
import 'package:sol_pay_gen/domain/token/get_spl_tokens_use_case.dart';
import 'package:sol_pay_gen/validator/keys_validator.dart';
import 'package:sol_pay_gen/validator/number_validator.dart';

MultiRepositoryProvider getRepositoryProviders({
  required MultiBlocProvider blocProviders,
}) {
  return MultiRepositoryProvider(
    providers: [
      RepositoryProvider<TransferRequestRepository>(
        create: (_) => DefaultTransferRequestRepository(),
      ),
      RepositoryProvider<NumberValidator>(
        create: (_) => DefaultNumberValidator(),
      ),
      RepositoryProvider<KeysValidator>(
        create: (_) => DefaultKeysValidator(),
      ),
      RepositoryProvider<TokensRepository>(
          create: (_) => LocalTokensRepository()),
      RepositoryProvider<GetTokensUseCase>(
        create: (BuildContext context) => GetTokensUseCase(
          context.read<TokensRepository>(),
        ),
      ),
    ],
    child: blocProviders,
  );
}
