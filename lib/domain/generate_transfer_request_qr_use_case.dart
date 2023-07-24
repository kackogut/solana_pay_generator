import '../data/transfer/transfer_request_repository.dart';

class GenerateTransferRequestQrUseCase {
  GenerateTransferRequestQrUseCase(this._transferRequestRepository);

  final TransferRequestRepository _transferRequestRepository;

  String execute(String address) {
    return _transferRequestRepository.getLink(address);
  }
}
