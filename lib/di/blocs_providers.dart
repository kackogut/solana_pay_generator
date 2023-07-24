import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../feature/input/bloc/parameters_input_cubit.dart';

MultiBlocProvider getBlocProviders({required StatelessWidget child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<ParametersInputCubit>(
        create: (BuildContext context) => ParametersInputCubit(),
      )
    ],
    child: child,
  );
}
