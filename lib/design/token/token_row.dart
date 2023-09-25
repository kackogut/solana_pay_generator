import 'package:flutter/cupertino.dart';

import '../sizes.dart';
import '../spacings.dart';

class TokenPickerListItem extends StatelessWidget {
  final String _imageUrl;
  final String _symbol;

  const TokenPickerListItem({super.key, required imageUrl, required symbol})
      : _imageUrl = imageUrl,
        _symbol = symbol;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          _imageUrl,
          width: Sizes.iconLarge,
          height: Sizes.iconLarge,
        ),
        const SizedBox(height: Spacing.small_100),
        Text(_symbol),
      ],
    );
  }
}
