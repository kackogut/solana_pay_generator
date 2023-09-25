import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pay_gen/domain/token/token_data.dart';
import 'package:sol_pay_gen/feature/input/bloc/parameters_input_cubit.dart';

import '../../../design/spacings.dart';
import '../../../design/token/token_row.dart';
import '../../../util/strings.dart';
import '../../token/model/selectable_token_display.dart';
import '../../token/token_picker.dart';

class SelectedTokenRow extends StatelessWidget {
  const SelectedTokenRow({
    super.key,
    required this.tokenData,
    required this.selectableTokens,
  });

  final TokenData tokenData;
  final List<SelectableTokenDisplay> selectableTokens;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
          Text(
            S.selectedTokenLabel.tr(),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: Spacing.small_100),
          GestureDetector(
            onTap: () => showTokenPickerDialog(
              context: context,
              tokens: selectableTokens,
              onTokenSelected: (token) => context
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
