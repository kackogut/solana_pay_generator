import 'package:equatable/equatable.dart';

import '../../../domain/token/spl_token_data.dart';

class TokensState extends Equatable {
  const TokensState({required this.tokens});

  @override
  List<Object?> get props => [tokens];

  final List<SplTokenData> tokens;
}
