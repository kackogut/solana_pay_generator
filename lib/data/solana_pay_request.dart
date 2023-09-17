class SolanaPayRequest {
  SolanaPayRequest({
    required this.address,
    this.label,
    this.message,
    this.amount,
    this.reference,
    this.memo,
    this.splToken,
  });

  String address;
  String? label;
  String? splToken;
  String? message;
  String? amount;
  String? reference;
  String? memo;
}
