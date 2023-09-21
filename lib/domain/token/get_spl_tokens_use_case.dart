import 'package:sol_pay_gen/data/token/tokens_repository.dart';
import 'package:sol_pay_gen/domain/token/spl_token_data.dart';
import 'package:sol_pay_gen/domain/token/spl_token_mapper.dart';

class GetSplTokensUseCase {
  GetSplTokensUseCase(this._tokensRepository);

  final TokensRepository _tokensRepository;

  List<SplTokenData> execute() {
    return _tokensRepository
        .getSplTokens()
        .map((tokenResponse) => tokenResponse.toDomainModel())
        .toList();
  }
}
