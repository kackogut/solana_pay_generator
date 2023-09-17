import '../../util/constants.dart';
import '../solana_pay_request.dart';

abstract class TransferRequestRepository {
  String getLink(SolanaPayRequest solanaPayRequest);
}

class DefaultTransferRequestRepository extends TransferRequestRepository {
  @override
  String getLink(SolanaPayRequest solanaPayRequest) {
    Map<String, dynamic> queryParameters = _getQueryParameters(solanaPayRequest);

    return Uri(
      scheme: solanaProtocol,
      path: solanaPayRequest.address,
      queryParameters: queryParameters,
    )
        .toString();
  }

  Map<String, dynamic> _getQueryParameters(SolanaPayRequest solanaPayRequest) {
    Map<String, dynamic> queryParameters = {};

    if (solanaPayRequest.amount != null) {
      queryParameters["amount"] = solanaPayRequest.amount!;
    }
    if (solanaPayRequest.splToken != null) {
      queryParameters["splToken"] = solanaPayRequest.splToken!;
    }
    if (solanaPayRequest.reference != null) {
      queryParameters["reference"] = solanaPayRequest.reference;
    }
    if (solanaPayRequest.label != null) {
      queryParameters["label"] = solanaPayRequest.label;
    }
    if (solanaPayRequest.message != null) {
      queryParameters["message"] = solanaPayRequest.message;
    }
    if (solanaPayRequest.memo != null) {
      queryParameters["memo"] = solanaPayRequest.memo;
    }

    return queryParameters;
  }
}
