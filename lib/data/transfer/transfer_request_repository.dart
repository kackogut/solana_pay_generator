abstract class TransferRequestRepository {
    String getLink(String address);
}

class DefaultTransferRequestRepository extends TransferRequestRepository {
  @override
  String getLink(String address) {
    return "solana:$address";
  }
}
