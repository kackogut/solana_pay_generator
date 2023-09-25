import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pay_gen/design/button/base_button.dart';
import 'package:sol_pay_gen/feature/input/bloc/parameters_input_cubit.dart';
import 'package:sol_pay_gen/feature/qr/bloc/qr_generator_cubit.dart';
import 'package:sol_pay_gen/feature/qr/bloc/qr_generator_state.dart';

import '../../data/base/text_value.dart';
import '../../design/input/base_input.dart';
import '../../design/sizes.dart';
import '../../design/spacings.dart';
import '../../util/strings.dart';
import '../qr/qr_code_dialog.dart';
import 'bloc/parameters_input_state.dart';
import 'components/selected_token_row.dart';

class ParametersInputScreen extends StatelessWidget {
  const ParametersInputScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            S.generatorInputTitle.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: BlocListener<QrGeneratorCubit, QrGeneratorState>(
          listener: (context, state) {
            switch (state) {
              case Empty():
                {}
              case QrCode():
                qrCodeDialogBuilder(context, state.data);
            }
          },
          child: BlocBuilder<ParametersInputCubit, ParametersInputState>(
            builder: (context, state) => InputBody(state: state),
          ),
        ),
        floatingActionButton: _GenerateQrButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
}

class InputBody extends StatelessWidget {
  const InputBody({super.key, required this.state});

  final ParametersInputState state;

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.all(Spacing.medium_150),
        shrinkWrap: true,
        children: [
          _AddressInput(address: state.address),
          const SizedBox(height: Spacing.medium_100),
          _AmountInput(amount: state.amount),
          const SizedBox(height: Spacing.medium_100),
          _LabelInput(),
          const SizedBox(height: Spacing.medium_100),
          _MessageInput(),
          const SizedBox(height: Spacing.medium_100),
          _ReferenceInput(reference: state.reference),
          const SizedBox(height: Spacing.medium_100),
          _MemoInput(),
          const SizedBox(height: Spacing.medium_100),
          if (state.selectedToken != null)
            SelectedTokenRow(
              tokenData: state.selectedToken!,
              selectableTokens: state.selectableTokens,
            ),
          const SizedBox(height: Sizes.actionButtonSize + Spacing.medium_100),
        ],
      );
}

class _AddressInput extends StatelessWidget {
  const _AddressInput({required this.address});

  final TextValue address;

  @override
  Widget build(BuildContext context) => BaseInput(
        labelText: S.addressLabel.tr(),
        error: address.error?.text,
        onChanged: (address) =>
            context.read<ParametersInputCubit>().onAddressChange(address),
        keyboardType: TextInputType.number,
      );
}

class _AmountInput extends StatelessWidget {
  const _AmountInput({required this.amount});

  final TextValue amount;

  @override
  Widget build(BuildContext context) => BaseInput(
        labelText: S.amountLabel.tr(),
        error: amount.error?.text,
        onChanged: (address) =>
            context.read<ParametersInputCubit>().onAmountChange(address),
      );
}

class _LabelInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BaseInput(
        labelText: S.labelLabel.tr(),
        onChanged: (text) =>
            context.read<ParametersInputCubit>().onLabelChange(text),
      );
}

class _MessageInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BaseInput(
        labelText: S.messageLabel.tr(),
        onChanged: (text) =>
            context.read<ParametersInputCubit>().onMessageChange(text),
      );
}

class _ReferenceInput extends StatelessWidget {
  const _ReferenceInput({required this.reference});

  final TextValue reference;

  @override
  Widget build(BuildContext context) => BaseInput(
        labelText: S.referenceLabel.tr(),
        error: reference.error?.text,
        onChanged: (address) =>
            context.read<ParametersInputCubit>().onReferenceChange(address),
      );
}

class _MemoInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BaseInput(
        labelText: S.memoLabel.tr(),
        onChanged: (text) =>
            context.read<ParametersInputCubit>().onMemoChange(text),
      );
}

class _GenerateQrButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(Spacing.medium_150),
        child: BaseButton(
          onPressed: () {
            context.read<ParametersInputCubit>().onValidate();
            context.read<QrGeneratorCubit>().onGenerate();
          },
          text: S.generateQrButtonText.tr(),
        ),
      );
}
