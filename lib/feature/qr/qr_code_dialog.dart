import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../design/sizes.dart';
import '../../design/spacings.dart';
import '../../design/theme/app_colors.dart';
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
        size: Sizes.qrCodeSize,
        data: _data,
        errorCorrectLevel: QrErrorCorrectLevel.M,
        roundEdges: true,
        elementColor: Theme.of(context).brightness == Brightness.light
            ? AppColors.black
            : AppColors.white,
      ),
    );
  }
}
