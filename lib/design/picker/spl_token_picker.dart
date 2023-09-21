import 'package:flutter/material.dart';
import 'package:sol_pay_gen/data/token/spl_tokens.dart';

void showSplTokenBottomSheet(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) => Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(32.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 2,
              child: SafeArea(
                top: false,
                child: SplTokenPicker(),
              ),
            ),
          ));
}

class SplTokenPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: supportedTokens.length,
        itemBuilder: (_, index) {
          return SplTokenPickerListItem(supportedTokens[index]);
        });
  }
}

class SplTokenPickerListItem extends StatelessWidget {
  final SplToken _splToken;

  const SplTokenPickerListItem(this._splToken, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Image.network(
            _splToken.imageUrl,
            width: 32,
            height: 32,
          ),
          const Padding(padding: EdgeInsets.all(8)),
          Text(_splToken.symbol),
        ],
      ),
    );
  }
}
