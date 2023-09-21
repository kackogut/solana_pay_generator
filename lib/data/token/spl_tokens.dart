class SplToken {
  SplToken({
    required this.imageUrl,
    required this.symbol,
    this.address,
  });

  final String symbol;
  final String? address;
  final String imageUrl;
}

final List<SplToken> supportedTokens = [
  SplToken(
      symbol: "SOL",
      address: null,
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/en/b/b9/Solana_logo.png"),
  SplToken(
      symbol: "USDC",
      address: "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v",
      imageUrl:
          "https://s2.coinmarketcap.com/static/img/coins/200x200/3408.png")
];
