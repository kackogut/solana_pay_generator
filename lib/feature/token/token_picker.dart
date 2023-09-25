import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../design/token/token_row.dart';
import '../../util/strings.dart';
import 'model/selectable_token_display.dart';

typedef OnTokenSelected = void Function(String);

void showTokenPickerDialog({
  required BuildContext context,
  required List<SelectableTokenDisplay> tokens,
  required OnTokenSelected onTokenSelected,
}) {
  showDialog(
      context: context,
      builder: (_) => Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(32.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white,
              ),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 2,
              child: SafeArea(
                top: false,
                child: _TokenPicker(
                  tokens: tokens,
                  onTokenSelected: onTokenSelected,
                ),
              ),
            ),
          ));
}

class _TokenPicker extends StatelessWidget {
  const _TokenPicker({
    required this.tokens,
    required this.onTokenSelected,
  });

  final OnTokenSelected onTokenSelected;
  final List<SelectableTokenDisplay> tokens;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(S.tokenPickerTitle.tr()),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.separated(
            itemCount: tokens.length,
            itemBuilder: (_, index) {
              return _TokenPickerListItem(
                token: tokens[index],
                onTokenSelected: onTokenSelected,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 8);
            },
          ),
        ),
      ],
    );
  }
}

class _TokenPickerListItem extends StatelessWidget {
  final SelectableTokenDisplay token;
  final OnTokenSelected onTokenSelected;

  const _TokenPickerListItem({
    required this.token,
    required this.onTokenSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTokenSelected(token.id);
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: token.selected ? Colors.blue : null,
            border: token.selected ? null : Border.all(color: Colors.blueGrey),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: TokenPickerListItem(
          imageUrl: token.imageUrl,
          symbol: token.symbol,
        ),
      ),
    );
  }
}
