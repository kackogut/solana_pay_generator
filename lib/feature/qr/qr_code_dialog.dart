import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../design/spacings.dart';
import '../../util/strings.dart';

Future<void> qrCodeDialogBuilder(BuildContext context, String qrCodeData) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(S.qrCodeDialogTitle.tr()),
        content: _QrCode(qrCodeData),
      );
    },
  );
}

class _QrCode extends StatelessWidget {
  final String _data;

  const _QrCode(this._data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.medium_150),
      child: PrettyQr(
        // image: AssetImage('images/twitter.png'),
        size: 200,
        data: _data,
        errorCorrectLevel: QrErrorCorrectLevel.M,
        roundEdges: true,
      ),
    );
  }
}
