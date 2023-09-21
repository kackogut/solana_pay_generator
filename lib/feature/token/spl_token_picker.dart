import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pay_gen/domain/token/spl_token_data.dart';
import 'package:sol_pay_gen/feature/token/bloc/tokens_cubit.dart';

void showSplTokenBottomSheet(BuildContext context) {
  final tokens = context.read<TokensCubit>().state.tokens;

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
                child: _SplTokenPicker(
                  tokens: tokens,
                ),
              ),
            ),
          ));
}

class _SplTokenPicker extends StatelessWidget {
  const _SplTokenPicker({super.key, required this.tokens});

  final List<SplTokenData> tokens;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tokens.length,
        itemBuilder: (_, index) {
          return _SplTokenPickerListItem(tokens[index]);
        });
  }
}

class _SplTokenPickerListItem extends StatelessWidget {
  final SplTokenData _splToken;

  const _SplTokenPickerListItem(this._splToken, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
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
