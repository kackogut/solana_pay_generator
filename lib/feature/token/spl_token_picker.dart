import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pay_gen/domain/token/spl_token_data.dart';
import 'package:sol_pay_gen/feature/token/bloc/tokens_cubit.dart';

import '../../design/token/token_row.dart';

typedef OnTokenSelected = void Function(TokenData);

void showTokenPickerDialog(
    BuildContext context, OnTokenSelected onTokenSelected) {
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
                child: _TokenPicker(
                  tokens: tokens,
                  onTokenSelected: onTokenSelected,
                ),
              ),
            ),
          ));
}

class _TokenPicker extends StatelessWidget {
  const _TokenPicker(
      {super.key, required this.tokens, required this.onTokenSelected});

  final OnTokenSelected onTokenSelected;
  final List<TokenData> tokens;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tokens.length,
        itemBuilder: (_, index) {
          return _TokenPickerListItem(
            token: tokens[index],
            onTokenSelected: onTokenSelected,
          );
        });
  }
}

class _TokenPickerListItem extends StatelessWidget {
  final TokenData token;
  final OnTokenSelected onTokenSelected;

  const _TokenPickerListItem(
      {required this.token, required this.onTokenSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () {
          onTokenSelected(token);
          Navigator.pop(context);
        },
        child: TokenPickerListItem(
          imageUrl: token.imageUrl,
          symbol: token.symbol,
        ),
      ),
    );
  }
}
