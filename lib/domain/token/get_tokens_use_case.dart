import 'package:sol_pay_gen/data/token/tokens_repository.dart';
import 'package:sol_pay_gen/domain/token/token_data.dart';
import 'package:sol_pay_gen/domain/token/token_mapper.dart';

class GetTokensUseCase {
  GetTokensUseCase(this._tokensRepository);

  final TokensRepository _tokensRepository;

  List<TokenData> execute() {
    return _tokensRepository
        .getTokens()
        .map((tokenResponse) => tokenResponse.toDomainModel())
        .toList();
  }
}
