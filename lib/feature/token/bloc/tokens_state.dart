import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/token/token_data.dart';

part 'tokens_state.freezed.dart';

@freezed
class TokensState with _$TokensState {
  const factory TokensState({required List<TokenData> tokens}) = _TokensState;
}
