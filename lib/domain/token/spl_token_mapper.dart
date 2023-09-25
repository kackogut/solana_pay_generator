import 'package:sol_pay_gen/data/token/spl_token.dart';
import 'package:sol_pay_gen/domain/token/spl_token_data.dart';

extension TokenMapper on TokenResponse {
  TokenData toDomainModel() {
    return TokenData(
      id: id,
      imageUrl: imageUrl,
      symbol: symbol,
      address: address,
    );
  }
}
