import 'package:flutter/cupertino.dart';
import 'package:sol_pay_gen/domain/token/spl_token_data.dart';

import '../../../design/token/token_row.dart';
import '../../token/spl_token_picker.dart';

class SelectedTokenRow extends StatelessWidget {
  const SelectedTokenRow({
    super.key,
    required this.splTokenData,
  });

  final SplTokenData splTokenData;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const Text("Selected Solana Token"),
          const Padding(padding: EdgeInsets.only(top: 8.0)),
          GestureDetector(
            onTap: () => showSplTokenBottomSheet(context),
            child: SplTokenPickerListItem(
              imageUrl: splTokenData.imageUrl,
              symbol: splTokenData.symbol,
            ),
          )
        ],
      );
}
