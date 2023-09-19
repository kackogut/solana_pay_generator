import '../error/input_error.dart';

class TextValue {
  TextValue({
    required this.text,
    this.error,
  });

  final String text;
  final InputError? error;
}
