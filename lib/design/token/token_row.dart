import 'package:flutter/cupertino.dart';

class TokenPickerListItem extends StatelessWidget {
  final String _imageUrl;
  final String _symbol;

  const TokenPickerListItem({super.key, required imageUrl, required symbol})
      : _imageUrl = imageUrl,
        _symbol = symbol;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Image.network(
            _imageUrl,
            width: 32,
            height: 32,
          ),
          const Padding(padding: EdgeInsets.all(8)),
          Text(_symbol),
        ],
      ),
    );
  }
}
