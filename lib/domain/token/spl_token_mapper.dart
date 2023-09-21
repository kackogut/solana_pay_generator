import 'package:sol_pay_gen/data/token/spl_token.dart';
import 'package:sol_pay_gen/domain/token/spl_token_data.dart';

extension SplTokenMapper on SplTokenResponse {
  SplTokenData toDomainModel() {
    return SplTokenData(
      id: id,
      imageUrl: imageUrl,
      symbol: symbol,
      address: address,
    );
  }
}
