// TODO: Move to enum/sealed class and introduce translator
import 'package:easy_localization/easy_localization.dart';

import '../../util/strings.dart';

sealed class InputError {
  abstract String text;
}

class NotANumber extends InputError {
  @override
  String text = S.notANumberErrorLabel.tr();
}

class EmptyAmount extends InputError {
  @override
  String text = S.emptyAmountErrorLabel.tr();
}

class FieldRequired extends InputError {
  @override
  String text = S.fieldMissingErrorLabel.tr();
}

class KeyNotBase58Encoded extends InputError {
  @override
  String text = S.keyNotBase58EncodedErrorLabel.tr();
}

class KeyLengthInvalid extends InputError {
  @override
  String text = S.keyLengthInvalidErrorLabel.tr();
}
