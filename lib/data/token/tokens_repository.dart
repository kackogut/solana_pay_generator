import 'spl_token.dart';

abstract class TokensRepository {
  List<SplTokenResponse> getSplTokens();
}

class LocalTokensRepository extends TokensRepository {
  @override
  List<SplTokenResponse> getSplTokens() => [
        SplTokenResponse(
          id: "1",
          symbol: "SOL",
          address: null,
          imageUrl:
              "https://upload.wikimedia.org/wikipedia/en/b/b9/Solana_logo.png",
        ),
        SplTokenResponse(
          id: "2",
          symbol: "USDC",
          address: "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v",
          imageUrl:
              "https://s2.coinmarketcap.com/static/img/coins/200x200/3408.png",
        )
      ];
}
