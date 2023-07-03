import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pay_gen/feature/input/bloc/parameters_input_cubit.dart';

import 'bloc/parameters_input_state.dart';

class ParametersInputScreen extends StatelessWidget {
  const ParametersInputScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Solana Pay QR Generator"),
        ),
        body: BlocBuilder<ParametersInputCubit, ParametersInputState>(
          builder: (context, state) => InputBody(state: state)
        )
      );
}

class InputBody extends StatelessWidget {
  const InputBody({super.key, required this.state});

  final ParametersInputState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(24.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Receive wallet address',
            ),
            onChanged: (address) => context.read<ParametersInputCubit>().onAddressChange(address),
          ),
        )
      ],
    );
  }
}
