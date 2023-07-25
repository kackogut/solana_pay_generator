import 'package:sol_pay_gen/data/solana_pay_request.dart';

import '../data/transfer/transfer_request_repository.dart';

class GenerateTransferRequestQrUseCase {
  GenerateTransferRequestQrUseCase(this._transferRequestRepository);

  final TransferRequestRepository _transferRequestRepository;

  String execute(SolanaPayRequest solanaPayRequest) {
    return _transferRequestRepository.getLink(solanaPayRequest);
  }
}
