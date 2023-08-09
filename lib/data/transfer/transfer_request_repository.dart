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
      scheme: SOLANA_PROTOCOL,
      path: solanaPayRequest.address,
      queryParameters: queryParameters,
    )
        .toString();
  }

  Map<String, dynamic> _getQueryParameters(SolanaPayRequest solanaPayRequest) {
    Map<String, dynamic> queryParameters = {};

    if (solanaPayRequest.amount?.isNotEmpty == true) {
      queryParameters["amount"] = solanaPayRequest.amount!;
    }
    if (solanaPayRequest.splToken?.isNotEmpty == true) {
      queryParameters["spl-token"] = solanaPayRequest.splToken!;
    }
    if (solanaPayRequest.reference?.isNotEmpty == true) {
      queryParameters["reference"] = solanaPayRequest.reference;
    }
    if (solanaPayRequest.label?.isNotEmpty == true) {
      queryParameters["label"] = solanaPayRequest.label;
    }
    if (solanaPayRequest.message?.isNotEmpty == true) {
      queryParameters["message"] = solanaPayRequest.message;
    }
    if (solanaPayRequest.memo?.isNotEmpty == true) {
      queryParameters["memo"] = solanaPayRequest.memo;
    }

    return queryParameters;
  }
}
