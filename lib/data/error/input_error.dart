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
