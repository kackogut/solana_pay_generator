import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pay_gen/feature/input/bloc/parameters_input_cubit.dart';
import 'package:sol_pay_gen/feature/qr/bloc/qr_generator_cubit.dart';
import 'package:sol_pay_gen/feature/qr/bloc/qr_generator_state.dart';

import '../../design/input/base_input.dart';
import '../../util/strings.dart';
import '../qr/qr_code_dialog.dart';
import 'bloc/parameters_input_state.dart';

class ParametersInputScreen extends StatelessWidget {
  const ParametersInputScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Solana Pay QR Generator"),
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
  );
}

class InputBody extends StatelessWidget {
  const InputBody({super.key, required this.state});

  final ParametersInputState state;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            BaseInput(
              labelText: S.addressLabel.tr(),
                  error: state.address.error?.text,
                  onChanged: (address) => context
                      .read<ParametersInputCubit>()
                      .onAddressChange(address),
                ),
            const Padding(padding: EdgeInsets.only(top: 16.0)),
            BaseInput(
              labelText: S.amountLabel.tr(),
                  keyboardType: TextInputType.number,
                  error: state.amount.error?.text,
                  onChanged: (address) => context
                      .read<ParametersInputCubit>()
                      .onAmountChange(address),
                ),
            const Padding(padding: EdgeInsets.only(top: 16.0)),
            BaseInput(
              labelText: S.labelLabel.tr(),
                  onChanged: (text) =>
                      context.read<ParametersInputCubit>().onLabelChange(text),
                ),
            const Padding(padding: EdgeInsets.only(top: 16.0)),
            BaseInput(
              labelText: S.messageLabel.tr(),
                  onChanged: (text) => context
                      .read<ParametersInputCubit>()
                      .onMessageChange(text),
                ),
            const Padding(padding: EdgeInsets.only(top: 16.0)),
            BaseInput(
              labelText: S.referenceLabel.tr(),
                  error: state.reference.error?.text,
                  onChanged: (address) => context
                      .read<ParametersInputCubit>()
                      .onReferenceChange(address),
                ),
            const Padding(padding: EdgeInsets.only(top: 16.0)),
            BaseInput(
              labelText: S.memoLabel.tr(),
                  onChanged: (memo) =>
                      context.read<ParametersInputCubit>().onMemoChange(memo),
                ),
            const Padding(padding: EdgeInsets.only(top: 16.0)),
            BaseInput(
              labelText: S.splTokenLabel.tr(),
                  onChanged: (token) => context
                      .read<ParametersInputCubit>()
                      .onSplTokenChange(token),
                ),
          ],
        ),
      ),
      const Spacer(),
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: MaterialButton(
          onPressed: () {
                context.read<ParametersInputCubit>().onValidate();
                context.read<QrGeneratorCubit>().onGenerate();
              },
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              height: 56.0,
              child: Text(
                S.generateQrButtonText.tr(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
      )
    ],
  );
}
