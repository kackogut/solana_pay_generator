class SolanaPayRequest {
  SolanaPayRequest({
    required this.address,
    this.label,
    this.message,
    this.amount,
    this.reference,
    this.memo,
    this.token,
  });

  final String address;
  final String? label;
  final String? token;
  final String? message;
  final String? amount;
  final String? reference;
  final String? memo;
}
