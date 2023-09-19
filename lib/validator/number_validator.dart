import '../data/error/input_error.dart';

abstract class NumberValidator {
  InputError? validateAmount(String amount);
}

class DefaultNumberValidator extends NumberValidator {
  @override
  InputError? validateAmount(String amount) {
    double? parsedAmount = double.tryParse(amount);

    if (parsedAmount == null) {
      return NotANumber();
    }
    if (parsedAmount == 0) {
      return EmptyAmount();
    } else {
      return null;
    }
  }
}
