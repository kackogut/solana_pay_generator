import 'package:sol_pay_gen/data/token/token.dart';
import 'package:sol_pay_gen/domain/token/token_data.dart';

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
