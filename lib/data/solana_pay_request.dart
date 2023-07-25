class SolanaPayRequest {
  SolanaPayRequest({required this.address});

  String address;
  String? label;
  String? splToken;
  String? message;
  String? amount;
  String? reference;
  String? memo;
}
