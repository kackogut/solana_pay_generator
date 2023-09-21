import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pay_gen/domain/token/spl_token_data.dart';
import 'package:sol_pay_gen/feature/input/bloc/parameters_input_cubit.dart';

import '../../../design/token/token_row.dart';
import '../../token/spl_token_picker.dart';

class SelectedTokenRow extends StatelessWidget {
  const SelectedTokenRow({
    super.key,
    required this.tokenData,
  });

  final TokenData tokenData;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Selected Solana Token",
            textAlign: TextAlign.start,
          ),
          const Padding(padding: EdgeInsets.only(top: 8.0)),
          GestureDetector(
            onTap: () => showTokenPickerDialog(
              context,
              (token) => context
                  .read<ParametersInputCubit>()
                  .onSelectedTokenChange(token),
            ),
            child: TokenPickerListItem(
              imageUrl: tokenData.imageUrl,
              symbol: tokenData.symbol,
            ),
          )
        ],
      );
}
