import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pay_gen/feature/input/bloc/parameters_input_cubit.dart';
import 'package:sol_pay_gen/feature/qr/bloc/qr_generator_cubit.dart';
import 'package:sol_pay_gen/feature/qr/bloc/qr_generator_state.dart';

import '../../design/input/base_input.dart';
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
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              BaseInput(
                labelText: 'Receive wallet address',
                onChanged: (address) => context
                    .read<ParametersInputCubit>()
                    .onAddressChange(address),
              ),

              const Padding(padding: EdgeInsets.only(top: 16.0)),

              BaseInput(
                labelText: 'Amount',
                keyboardType: TextInputType.number,
                onChanged: (address) => context
                    .read<ParametersInputCubit>()
                    .onAmountChange(address),
              ),

              const Padding(padding: EdgeInsets.only(top: 16.0)),

              BaseInput(
                labelText: 'Label',
                keyboardType: TextInputType.number,
                onChanged: (text) => context
                    .read<ParametersInputCubit>()
                    .onLabelChange(text),
              ),

              const Padding(padding: EdgeInsets.only(top: 16.0)),

              BaseInput(
                labelText: 'Message',
                keyboardType: TextInputType.number,
                onChanged: (text) => context
                    .read<ParametersInputCubit>()
                    .onMessageChange(text),
              ),

              const Padding(padding: EdgeInsets.only(top: 16.0)),

              BaseInput(
                labelText: 'Reference',
                keyboardType: TextInputType.number,
                onChanged: (address) => context
                    .read<ParametersInputCubit>()
                    .onReferenceChange(address),
              ),

              const Padding(padding: EdgeInsets.only(top: 16.0)),

              BaseInput(
                labelText: 'Memo',
                keyboardType: TextInputType.number,
                onChanged: (address) => context
                    .read<ParametersInputCubit>()
                    .onReferenceChange(address),
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: MaterialButton(
            onPressed: () => context.read<QrGeneratorCubit>().onGenerate(),
            color: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            height: 56.0,
            child: const Text(
              "Let's go",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
