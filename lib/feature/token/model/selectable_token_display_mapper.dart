import 'package:sol_pay_gen/feature/token/model/selectable_token_display.dart';

import '../../../domain/token/token_data.dart';

extension SelectableDisplayTokenMapper on TokenData {
  SelectableTokenDisplay toSelectableTokenModel(bool selected) {
    return SelectableTokenDisplay(
      id: id,
      imageUrl: imageUrl,
      symbol: symbol,
      selected: selected,
    );
  }
}
