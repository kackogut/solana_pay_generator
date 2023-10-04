import 'package:sol_pay_gen/data/transfer/transfer_request_repository.dart';
import 'package:sol_pay_gen/domain/transfer/transfer_request_data.dart';
import 'package:sol_pay_gen/domain/transfer/transfer_request_mapper.dart';
import 'package:test/test.dart';

void main() {
  group('TransferRequestRepository getLink tests', () {
    test(
        'GIVEN that non-empty address is provided WHEN URL is generated THEN should return URL with address',
        () {
      final repository = DefaultTransferRequestRepository();

      final request = TransferRequestData(address: "address");

      expect(repository.getLink(request.toRequestModel()), "solana:address?");
    });

    test(
        'GIVEN that all optional values are empty WHEN URL is generated THEN should return URL without empty values',
        () {
      final repository = DefaultTransferRequestRepository();

      final request = TransferRequestData(
        address: "address",
        label: "",
        message: "",
        amount: "",
        reference: "",
        memo: "",
        token: "",
      );

      expect(repository.getLink(request.toRequestModel()), "solana:address?");
    });

    test(
        'GIVEN that request contains non-empty label WHEN URL is generated THEN should return URL with label',
        () {
      final repository = DefaultTransferRequestRepository();

      final request = TransferRequestData(
        address: "address",
        label: "testValue",
      );

      expect(repository.getLink(request.toRequestModel()),
          "solana:address?label=testValue");
    });

    test(
        'GIVEN that request contains non-empty message WHEN URL is generated THEN should return URL with message',
        () {
      final repository = DefaultTransferRequestRepository();

      final request = TransferRequestData(
        address: "address",
        message: "testValue",
      );

      expect(repository.getLink(request.toRequestModel()),
          "solana:address?message=testValue");
    });

    test(
        'GIVEN that request contains non-empty token WHEN URL is generated THEN should return URL with token',
        () {
      final repository = DefaultTransferRequestRepository();

      final request = TransferRequestData(
        address: "address",
        token: "testValue",
      );

      expect(repository.getLink(request.toRequestModel()),
          "solana:address?spl-token=testValue");
    });

    test(
        'GIVEN that request contains non-empty amount WHEN URL is generated THEN should return URL with amount',
        () {
      final repository = DefaultTransferRequestRepository();

      final request = TransferRequestData(
        address: "address",
        amount: "testValue",
      );

      expect(repository.getLink(request.toRequestModel()),
          "solana:address?amount=testValue");
    });

    test(
        'GIVEN that request contains non-empty reference WHEN URL is generated THEN should return URL with reference',
        () {
      final repository = DefaultTransferRequestRepository();

      final request = TransferRequestData(
        address: "address",
        reference: "testValue",
      );

      expect(repository.getLink(request.toRequestModel()),
          "solana:address?reference=testValue");
    });

    test(
        'GIVEN that request contains non-empty memo WHEN URL is generated THEN should return URL with memo',
        () {
      final repository = DefaultTransferRequestRepository();

      final request = TransferRequestData(
        address: "address",
        reference: "testValue",
      );

      expect(repository.getLink(request.toRequestModel()),
          "solana:address?reference=testValue");
    });

    test(
        'GIVEN that request contains all non-empty optional values WHEN URL is generated THEN should return URL with correct formatting',
        () {
      final repository = DefaultTransferRequestRepository();

      final request = TransferRequestData(
        address: "address",
        label: "label",
        message: "message",
        amount: "amount",
        reference: "reference",
        memo: "memo",
        token: "token",
      );

      expect(repository.getLink(request.toRequestModel()),
          "solana:address?amount=amount&spl-token=token&reference=reference&label=label&message=message&memo=memo");
    });
  });
}
