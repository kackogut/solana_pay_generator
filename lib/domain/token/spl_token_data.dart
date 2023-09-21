class SplTokenData {
  SplTokenData({
    required this.id,
    required this.imageUrl,
    required this.symbol,
    this.address,
  });

  final String id;
  final String symbol;
  final String? address;
  final String imageUrl;
}
