import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

Future<void> qrCodeDialogBuilder(BuildContext context, String qrCodeData) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Qr code"),
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
      padding: const EdgeInsets.all(24),
      child: PrettyQr(
        // image: AssetImage('images/twitter.png'),
        typeNumber: 3,
        size: 200,
        data: _data,
        errorCorrectLevel: QrErrorCorrectLevel.M,
        roundEdges: true,
      ),
    );
  }
}
