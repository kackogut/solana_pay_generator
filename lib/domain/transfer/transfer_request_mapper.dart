import 'package:sol_pay_gen/data/transfer/transfer_request.dart';
import 'package:sol_pay_gen/domain/transfer/transfer_request_data.dart';

extension TransferRequestMapper on TransferRequestData {
  TransferRequest toRequestModel() {
    return TransferRequest(
      address: address,
      label: label,
      token: token,
      message: message,
      amount: amount,
      reference: reference,
      memo: memo,
    );
  }
}
