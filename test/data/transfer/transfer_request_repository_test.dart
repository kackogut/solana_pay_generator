import 'package:sol_pay_gen/data/solana_pay_request.dart';
import 'package:sol_pay_gen/data/transfer/transfer_request_repository.dart';
import 'package:test/test.dart';

void main() {
  group('TransferRequestRepository', () {
    test('Generated URL should contain address', () {
      final repository = DefaultTransferRequestRepository();

      final request = SolanaPayRequest(address: "address");

      expect(repository.getLink(request), "solana:address?");
    });
  });
}
