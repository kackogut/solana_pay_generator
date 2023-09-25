import 'package:sol_pay_gen/data/transfer/transfer_request_repository.dart';
import 'package:sol_pay_gen/domain/transfer/transfer_request_data.dart';
import 'package:sol_pay_gen/domain/transfer/transfer_request_mapper.dart';
import 'package:test/test.dart';

void main() {
  group('TransferRequestRepository', () {
    test('Generated URL should contain address', () {
      final repository = DefaultTransferRequestRepository();

      final request = TransferRequestData(address: "address");

      expect(repository.getLink(request.toRequestModel()), "solana:address?");
    });
  });
}
