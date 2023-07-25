import 'package:solana_pay/solana_pay.dart';
import 'package:solana_pay/src/model/transaction_request.dart';
import 'package:solana_pay/src/model/transfer_request.dart';
import '../../util/constants.dart';
import '../solana_pay_request.dart';

abstract class TransferRequestRepository {
  String getLink(SolanaPayRequest solanaPayRequest);
}

class DefaultTransferRequestRepository extends TransferRequestRepository {
  @override
  String getLink(SolanaPayRequest solanaPayRequest) {
    Map<String, dynamic> queryParameters = _getQueryParameters(solanaPayRequest);

    encodeTransferRequestURL()
    String url = Uri(
      scheme: SOLANA_PROTOCOL,
      path: solanaPayRequest.address,
      queryParameters: queryParameters,
    )
        .toString();

    return url;
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
