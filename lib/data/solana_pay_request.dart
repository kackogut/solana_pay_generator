class SolanaPayRequest {
  SolanaPayRequest({
    required this.address,
    this.label,
    this.message,
    this.amount,
    this.reference,
    this.memo,
  });

  String address;
  String? label;
  String? splToken;
  String? message;
  String? amount;
  String? reference;
  String? memo;
}
