import 'package:solana/base58.dart';

import '../data/error/input_error.dart';

abstract class KeysValidator {
  InputError? validateKey(String key);
}

class DefaultKeysValidator extends KeysValidator {
  // https://docs.solana.com/cli/transfer-tokens#:~:text=The%20public%20key%20is%20a,from%2032%20to%2044%20characters.
  static const minSolanaKeyLength = 32;
  static const maxSolanaKeyLength = 44;

  @override
  InputError? validateKey(String key) {
    if (key.length < minSolanaKeyLength || key.length > maxSolanaKeyLength) {
      return KeyLengthInvalid();
    } else {
      try {
        base58decode(key);
        return null;
      } on FormatException catch (_) {
        return KeyNotBase58Encoded();
      }
    }
  }
}
