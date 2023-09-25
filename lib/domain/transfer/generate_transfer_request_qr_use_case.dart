import 'package:sol_pay_gen/domain/transfer/transfer_request_data.dart';
import 'package:sol_pay_gen/domain/transfer/transfer_request_mapper.dart';

import '../../data/transfer/transfer_request_repository.dart';

class GenerateTransferRequestQrUseCase {
  GenerateTransferRequestQrUseCase(this._transferRequestRepository);

  final TransferRequestRepository _transferRequestRepository;

  String execute(TransferRequestData solanaPayRequest) {
    return _transferRequestRepository
        .getLink(solanaPayRequest.toRequestModel());
  }
}
