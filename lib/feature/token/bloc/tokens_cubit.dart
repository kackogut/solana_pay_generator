import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pay_gen/domain/token/get_spl_tokens_use_case.dart';
import 'package:sol_pay_gen/feature/token/bloc/tokens_state.dart';

class TokensCubit extends Cubit<TokensState> {
  TokensCubit({
    required getSplTokensUseCase,
  })  : _getSplTokensUseCase = getSplTokensUseCase,
        super(
          TokensState(tokens: getSplTokensUseCase.execute()),
        );

  final GetSplTokensUseCase _getSplTokensUseCase;
}
