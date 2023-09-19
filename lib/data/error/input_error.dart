abstract class InputError {
  abstract String text;
}

class NotANumber extends InputError {
  @override
  String text = "Field must be a number";
}

class EmptyAmount extends InputError {
  @override
  String text = "Amount must be more than 0 if present";
}

class RequiredAmount extends InputError {
  @override
  String text = "Field is required";
}

class KeyNotBase58Encoded extends InputError {
  @override
  String text = "Invalid value, must be base58 encoded";
}

class KeyLengthInvalid extends InputError {
  @override
  String text = "Key value must be between 32 and 44 characters";
}
