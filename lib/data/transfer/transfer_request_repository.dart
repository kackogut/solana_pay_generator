import 'package:sol_pay_gen/data/transfer/transfer_request.dart';

import '../../util/constants.dart';

abstract class TransferRequestRepository {
  String getLink(TransferRequest transferRequest);
}

class DefaultTransferRequestRepository extends TransferRequestRepository {
  static const _amountQueryParameter = "amount";
  static const _tokenAddressQueryParameter = "spl-token";
  static const _referenceQueryParameter = "reference";
  static const _labelQueryParameter = "label";
  static const _messageQueryParameter = "message";
  static const _memoQueryParameter = "memo";

  @override
  String getLink(TransferRequest transferRequest) {
    Map<String, dynamic> queryParameters = _getQueryParameters(transferRequest);

    return Uri(
      scheme: solanaProtocol,
      path: transferRequest.address,
      queryParameters: queryParameters,
    ).toString();
  }

  Map<String, dynamic> _getQueryParameters(TransferRequest solanaPayRequest) {
    Map<String, dynamic> queryParameters = {};

    if (solanaPayRequest.amount?.isNotEmpty == true) {
      queryParameters[_amountQueryParameter] = solanaPayRequest.amount!;
    }
    if (solanaPayRequest.token?.isNotEmpty == true) {
      queryParameters[_tokenAddressQueryParameter] = solanaPayRequest.token!;
    }
    if (solanaPayRequest.reference?.isNotEmpty == true) {
      queryParameters[_referenceQueryParameter] = solanaPayRequest.reference;
    }
    if (solanaPayRequest.label?.isNotEmpty == true) {
      queryParameters[_labelQueryParameter] = solanaPayRequest.label;
    }
    if (solanaPayRequest.message?.isNotEmpty == true) {
      queryParameters[_messageQueryParameter] = solanaPayRequest.message;
    }
    if (solanaPayRequest.memo?.isNotEmpty == true) {
      queryParameters[_memoQueryParameter] = solanaPayRequest.memo;
    }

    return queryParameters;
  }
}
